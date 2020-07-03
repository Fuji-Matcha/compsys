`include "pu.vh"

module alu(input [`WIDTH:0] a, b, input [`OPS:0] op, output logic [`WIDTH:0] r,
		input dstb, output logic ze, ca, sg, input clk, rst);
	
	enum {ADD, SUB, THB, THA, RSR, RSL, NAD, XOR} OPETYP;
	
	logic [`WIDTH+1:0] rr; //17bit指定

	always @* begin
		case(op)
		// synopsys full_case parallel_case
		ADD: rr = a+b;
		SUB: rr = a-b;
		THB: rr = b;
		// ASR: rr = a>>>b;
		THA: rr = a; //付け加えた
		RSR: rr = a>>b;
		RSL: rr = a<<b;
		NAD: rr = ~(a&b);
		XOR: rr = a^b;
		endcase
	end

	assign r = rr[`WIDTH:0]; //17bitのrrから下位16bitをrへつなげる

	always @(posedge clk or posedge rst) begin
		if(rst) begin
			ze <= `NEGATE;
			ca <= `NEGATE;
			sg <= `NEGATE;
		end else begin
			// 計算結果が0のとき
			if(r == 0) ze <= `ASSERT;
			else ze <= `NEGATE;
			// 計算結果の最上位ビットが1のとき(符号)
			if(r[`WIDTH] == 1'b1) sg <= `ASSERT;
			else sg <= `NEGATE;
			// 17bit目が1のとき(キャリー)
			if(rr[`WIDTH+1] == 1'b1) ca <= `ASSERT;
			else ca <= `NEGATE;
		end
	end

endmodule
