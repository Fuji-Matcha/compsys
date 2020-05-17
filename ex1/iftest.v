//第2回計算機システム設計論No2

module iftest(input a, b, s, output o);
	logic o; //alwaysブロックの出力はlogic(reg)宣言する。
	always_comb begin; //ここだけ上から下へ順番に評価される。
		if (s) o = a;
		else o = b;	
	end
endmodule

//テストブロック
module test;
	logic a, b, s, o;
	initial begin;
		$dumpfile("iftest.vcd");
		$dumpvars(0, test);
		a = 1;
		b = 0;
		s = 0;
	#10
		a = 1;
		b = 0;
		s = 1;
	#10
		a = 0;
		b = 1;
		s = 0;
	#10
		a = 0;
		b = 1;
		s = 1;
	#10
		$finish;
	end
endmodule