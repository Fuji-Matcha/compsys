`timescale 1ns/1ps
`include "sw.vh"

module test;

    logic clk, rst, re, we;
    logic [`PKTW:0] pkti;
    wire [`PKTW:0] pkto;
    always #5 clk = ~clk;
    fifo fifo(clk, rst, re, we, pkti, empty, full, pkto);

    initial begin
        $dumpfile("fifo.vcd");
        $dumpvars(0, test);
        clk = 1'b1;
        rst = 1'b1;
        re = 1'b0;
        we = 1'b0;

        #15 //遅延を考慮
        rst = 1'b0;
        pkti = 10'b00_00000000; //null
        #10
        we = 1'b1;
        pkti = 10'b10_00000011; //head
        #10
        pkti = 10'b01_00000000;
        #10
        re = 1'b1;
        pkti = 10'b01_00000001;
        #10
        pkti = 10'b01_00000010;
        #10
        pkti = 10'b11_00000000; //tail
        #10
        we = 1'b0;
        pkti = 10'b00_00000000; //null
        #20
        re = 1'b0;
        #50
        $finish; 
    end

endmodule