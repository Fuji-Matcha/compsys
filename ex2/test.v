module test;
	logic [3:0] a, b;
	raddr ra(a, b, s, co);

	initial begin;
		$dumpfile("raddr.vcd");
		$dumpvars(0, test);
		a = 5;
		b = 6;
		#10
		a = 11;
		b = 13;
		#10
		a = 5;
		b = 4'b1110; //4'b0010(2)の補数
		#10
		$finish;
	end
endmodule