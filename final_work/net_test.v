`timescale 1ns/1ps
`include "sw.vh"

module swtest;
	
	logic [`PKTW:0] i0, i1, i2, i3;
	wire [`PKTW:0] o0, o1, o2, o3;
	logic clk, rst;
	
	net net(clk, rst, i0, i1, i2, i3, o0, o1, o2, o3);
	
	always #5 clk = ~clk;

initial begin
$dumpfile("net.vcd");
$dumpvars(0, swtest);
clk = 0;
i0 = 0;
i1 = 0;
i2 = 0;
i3 = 0;
rst = `ASSERT;
#10
rst = `NEGATE;
#10
i0 = 10'b10_0000_0000; // node0 => node0 length 4
#10
i0 = 10'b01_0000_0000;
#10
i0 = 10'b01_0000_0001;
#10
i0 = 10'b11_0000_0010;
#10
i0 = 0;
#10
i0 = 10'b10_1001_0001; // node0 => node1 length 4
#10
i0 = 10'b01_1001_0000;
#10
i0 = 10'b01_1001_0001;
#10
i0 = 10'b11_1001_0010;
#10
i0 = 0;
#10
i0 = 10'b10_1001_0010; // node0 => node2 length 4
#10
i0 = 10'b01_1001_0000;
#10
i0 = 10'b01_1001_0001;
#10
i0 = 10'b11_1001_0010;
#10
i0 = 0;
#10
i0 = 10'b10_1001_0011; // node0 => node3 length 4
#10
i0 = 10'b01_1001_0000;
#10
i0 = 10'b01_1001_0001;
#10
i0 = 10'b11_1001_0010;
#10
i0 = 0;
#200
$finish;
end
endmodule
