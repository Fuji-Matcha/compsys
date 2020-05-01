//第二回計算機システム設計論No1

module a(a, b);
	input a;
	output b;
	assign b = a;
endmodule

module t;
	logic a;
	a at(a, b);
	initial begin
	$dumpfile("t.vcd");
	$dumpvars(0, t);
	a = 1;
	#10
	a = 0;
	#10
	$finish;
	end
endmodule