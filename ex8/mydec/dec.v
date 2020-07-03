`include "pu.vh"
`define DEBUG
//`define DEBUG2

module dec(input [`CMDS:0] o, //imemからの命令
	output logic h, we,	//h:PCの停止,we:RFへの書きこみenable線
	output logic [`RASB:0] wad, //RFへの書き込みアドレス
	output logic [`OPS:0] op, //ALUへの計算指定 
	output logic [`RASB:0] rb, ra, //RFへの読み出しアドレス
	output logic [`LICMDS:0] liop, //LIDXのオペレーション指定
	output logic [`HALFWIDTH:0] iv, //LIDXへの直値代入の値
	output logic pcwe, dmwe, dms, //pcwe:PCのジャンプ, dmwe:DMの書き込みenable, dms:DMSの選択。HIならDM、LOWならALUの値を選択
	output logic pcs, dstb, //psc:aselの選択。HIならPCのカウント値、LOWならRFのaの値を選択, dstb:比較命令の値を保存する(nop対策)なくてよい
	input ze, ca, sg); //ALUの結果 ze:ゼロ, ca:キャリー, sg:符号(16bit目が1)

/* 
im: 符号付き直値
a: ra,aとして読み出す値のRF上のアドレス
b: rb,bとして読み出す値のRF上のアドレス
op: op,ALUの計算指定
rw: wad,RFへの書き込みアドレス
f: UC(無条件),ZE(ゼロ),CA(キャリー),SG(符号)
p: 
*/

/*
   // F E D C B A 9 8 7 6 5 4 3 2 1 0
   // 0 0 0 0 0 0 * * * * * * * * * 0 ; NOP (0) DSTB //$$

2  // 0 0 0 0 0 0 * * * * * * * * * 1 ; HALT (1) //$$

   // 0 0 0 0 0 1 * * * * * * * * * * ; future reserved (PUSH, POP, SET(reg))

4  // 0 0 0 0 1 0 rw> F op--> a-> b-> ; CAL rw=ra,rb (F=0:NORM/1:DSTB) MV //$$aとbの計算結果をRFに代入Fは使わない
5  // 0 0 0 0 1 1 * * * op--> a-> b-> ; EVA CAL ra,rb (F=0)/CMP ra,rb //$$条件比較
6  // 0 0 0 1 0 0 f f p op--> a-> b-> ; JP/BR fp [ra op rb] (ff:NC,Z,C,S) //$$条件を満たしたらaとbを計算(何もしない、使わないかも)

   // 0 0 0 1 0 1 * * * * * * * * * * ; future reserved

8  // 0 0 0 1 1 0 F * * op--> a-> b-> ; SM [ra]=rb / SM [ra] = [ra op rb] *MM //$$計算結果をDMに入れる
9  // 0 0 0 1 1 1 rw> F op--> a-> b-> ; LM rw=[ra op rb] / LM rw=[rb] *MM // $$aとbの計算結果のアドレスにあるDMをRFのrwアドレスにロード
10 // 0 0 1 # rw> a-> im------------> ; CAL rw=ra,im (#=0:ADD/1:SUB only) // $$aとimのADDかSUBをRFのrwアドレスに代入
   // 0 1 0 p 0 * f f im------------> ; JP/BR fp [(s)im] //条件を満たしたらimを出力(使わない)
12 // 0 1 0 * 1 0 b-> im------------> ; SM [(s)im]=rb *MM //$$bをDMのimアドレスに代入
13 // 0 1 0 p 1 1 f f im------------> ; JP/BR fp [PC + (s)im] //$$条件を満たしたらのPCの値とimの値を計算(相対ジャンプ)
   // 0 1 1 p a-> f f im------------> ; JP/BR fp [ra + (s)im] //条件を満たしたらaの値とimの値を計算(使わない)
   // 1 0 0 0 rw> 0 0 0 0 0 0 0 S C Z ; LI rw,SM S:sign C:carry Z:zero //使わない
16 // 1 0 0 0 rw> 0 1 im------------> ; LI rw,(s)im (rw=rb) lidx=o[9:8] //$$imの上位8bitを0埋めしてRFのrwアドレスへ返す　
   // 1 0 0 0 rw> 1 0 im------------> ; LIL rw,im (rw=rb) //bの下位8bitを置き換えてbに戻す
   // 1 0 0 0 rw> 1 1 im------------> ; LIH rw,im (rw=rb) //bの上位8bitをimに置き換えてbに戻す
   // 1 0 0 1 rw> * * im------------> ; LM rw=[im] *MM //$$DMのimアドレスの値をRFのrwアドレスに代入
20 // 1 0 1 0 rw> a-> im------------> ; LM rw=[ra + (s)im] //$$aとimを計算したアドレスのDMの値をRFのrwアドレスへ読みだす
   // 1 0 1 1 a-> b-> im------------> ; SM [ra + (s)im]=rb //bの値をaとimを計算したアドレスのDMへ代入(使わない)
   // 1 1 * * * * * * * * * * * * * * ; future reserved *MM
*/

	`LIDXENUM
	enum {UC, ZE, CA, SG} FLAGTYP;
	logic f1, f2;
	
	//組み合わせ
	always @* begin
		f1 = `NEGATE;
		f2 = `NEGATE;
		case(o[9:8])
		// synopsys full_case parallel_case
		UC: begin
			f1 = `ASSERT;
			f2 = `ASSERT;
		end
		ZE: begin
			f1 = ~ze^o[7]; //(ze=0&&p=0)or(ze=1&&p=1)) (p@o[7])
			f2 = ~ze^o[12];
		end
		CA: begin
			f1 = ~ca^o[7];
			f2 = ~ca^o[12];
		end
		SG: begin
			f1 = ~sg^o[7];
			f2 = ~sg^o[12];
		end
		endcase
	end
	
	always @* begin
		h = `NEGATE;
		ra = 0;
		rb = 0;
		op = `THB;
		we = `NEGATE;
		wad = 0;
		liop = THU;
		iv = 0;
		dstb = `NEGATE;
		pcwe = `NEGATE;
		dmwe = `NEGATE;
		dms = `NEGATE;
		pcs = `NEGATE;

`ifdef DEBUG
$display("*****PC[%h]we[%h]CODE:%h", test.pu.pc.pc, pcwe, o);
$display("r0[%h]1[%h]2[%h]3[%h]", test.pu.rega.regar[0], test.pu.rega.regar[1],
`endif

	test.pu.rega.regar[2], test.pu.rega.regar[3]);

		case(o[15:13])
		// synopsys full_case parallel_case
		3'b000: begin
			case(o[12:10])
			// synopsys full_case parallel_case
			3'b000: begin
			// F E D C B A 9 8 7 6 5 4 3 2 1 0
			// 0 0 0 0 0 0 * * * * * * * * * 1 ; HALT (1) //2
				h = `ASSERT;
			end
			3'b010: begin
			// F E D C B A 9 8 7 6 5 4 3 2 1 0
			// 0 0 0 0 1 0 rw> F op--> a-> b-> ; CAL rw=ra,rb (F=0:NORM/1:DSTB) MV //4
				wad = o[9:8];
				we = `ASSERT;
				op = o[6:4];
				ra = o[3:2];
				rb = o[1:0];
			end
			3'b011: begin
			// F E D C B A 9 8 7 6 5 4 3 2 1 0
			// 0 0 0 0 1 1 * * * op--> a-> b-> ; EVA CAL ra,rb (F=0)/CMP ra,rb //5
				op = o[6:4];
				ra = o[3:2];
				rb = o[1:0];
			end
			3'b110: begin
			// F E D C B A 9 8 7 6 5 4 3 2 1 0
			// 0 0 0 1 1 0 F * * op--> a-> b-> ; SM [ra]=rb / SM [ra] = [ra op rb] *MM //8
				op = o[6:4];
				ra = o[3:2];
				rb = o[1:0];
				dmwe = `ASSERT;
			end
			3'b111: begin
			// F E D C B A 9 8 7 6 5 4 3 2 1 0
			// 0 0 0 1 1 1 rw> F op--> a-> b-> ; LM rw=[ra op rb] / LM rw=[rb] *MM //9
				wad = o[9:8];
				we = `ASSERT;
				op = o[6:4];
				ra = o[3:2];
				rb = o[1:0];
				dms = `ASSERT;
			end
			endcase
		end
		3'b001: begin //10
		// F E D C B A 9 8 7 6 5 4 3 2 1 0
		// 0 0 1 # rw> a-> im------------> ; CAL rw=ra,im (#=0:ADD/1:SUB only)
			wad = o[11:10];
			we = `ASSERT;
			ra = o[9:8];
			iv = o[7:0];
			liop = IMM;
			if (o[12]==`ASSERT) op = 3'b001;
			else op = 3'b000;
		end
		3'b010: begin
			case(o[11:10])
			//synopsys full_case parallel_case
			2'b10: begin // 12
			// F E D C B A 9 8 7 6 5 4 3 2 1 0
			// 0 1 0 * 1 0 b-> im------------> ; SM [(s)im]=rb *MM
				rb = o[9:8];
				iv = o[7:0];
				liop = IMM;
				op = 3'b010;
				dmwe = `ASSERT;
			end
			2'b11: begin // 13
			// F E D C B A 9 8 7 6 5 4 3 2 1 0
			// 0 1 0 p 1 1 f f im------------> ; JP/BR fp [PC + (s)im]
				if (f2==`NEGATE) begin
					pcs = `ASSERT;
					iv = o[7:0];
					liop = IMM;
					op = 3'b000;
					pcwe = `ASSERT;
				end
				else begin
				// NOP
				end
			end
			endcase
		end
		3'b100: begin //16
		// F E D C B A 9 8 7 6 5 4 3 2 1 0
		// 1 0 0 0 rw> 0 1 im------------> ; LI rw,(s)im (rw=rb) lidx=o[9:8]
			wad = o[11:10];
			we = `ASSERT;
			iv = o[7:0];
			liop = IMM;
			op = 3'b010;
		end
		3'b101: begin //20
		// F E D C B A 9 8 7 6 5 4 3 2 1 0
		// 1 0 1 0 rw> a-> im------------> ; LM rw=[ra + (s)im]
			wad = o[11:10];
			we = `ASSERT;
			ra = o[9:8];
			iv = o[7:0];
			liop = IMM;
			op = 3'b000;
			dms = `ASSERT;
		end
		endcase

`ifdef DEBUG2
$display("----DEBUG----(%f)", $realtime);
$display("PC[%h]we[%h]CODE:%h", test.pu.pc.pc, pcwe, o);
$display("REGA a[%h], b[%h], w[%h](%h)", ra, rb, wad, we);
$display("ALU op[%h], dstb[%h], status Z[%h] C[%h] S[%h]", op, dstb, ze, ca, sg);
$display("SEL LIDX[%h] IM[%h] PCS[%h]", liop, iv, pcs);
$display("DMEM we[%h] sel[%h]", dmwe, dms);
$display("r0[%h]1[%h]2[%h]3[%h]", test.pu.rega.regar[0], test.pu.rega.regar[1],
	test.pu.rega.regar[2], test.pu.rega.regar[3]);
$display("-------------");
`endif

	end

endmodule
