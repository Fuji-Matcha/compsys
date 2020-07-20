`timescale 1ns/1ps
`include "sw.vh"

module test;

    logic clk, rst;
    logic [`PKTW:0] pkto;
    wire [`PORT:0] reqi;
    always #5 clk = ~clk;
    mkreq mkreq(clk, rst, pkto, reqi);

    initial begin
        $dumpfile("mkreq.vcd");
        $dumpvars(0, test);
        clk = 1'b1;
        rst = 1'b1;
        #15 //遅延を考慮
        rst = 1'b0;
        pkto = 10'b00_00000000;
        #10
        pkto = 10'b10_00000010;
        #30
        pkto = 10'b01_00000000;
        #10
        pkto = 10'b01_00000011;
        #10
        pkto = 10'b11_00000000;
        #10;
        pkto = 10'b00_00000000;
        #50
        $finish; 
    end

endmodule