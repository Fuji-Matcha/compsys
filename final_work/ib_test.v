`timescale 1ns/1ps
`include "sw.vh"

module test;

    logic clk, rst, ack;
    logic [`PKTW:0] pkti;
    wire [`PKTW:0] pkto;
    wire [`PORT:0] req;
    always #5 clk = ~clk;
    ib ib(clk, rst, ack, pkti, pkto, full, req);

    initial begin
        $dumpfile("ib.vcd");
        $dumpvars(0, test);
        clk = 1'b1;
        rst = 1'b1;
        ack = 1'b0;

        #15 //遅延を考慮
        rst = 1'b0;
        pkti = 10'b00_00000000;
        #30
        pkti = 10'b10_00000011;
        #10
        pkti = 10'b01_00000000;
        #10
        pkti = 10'b01_00000001;
        #10
        pkti = 10'b01_00000010;
        #10
        pkti = 10'b01_00000011;
        #10
        ack = 1'b1;
        pkti = 10'b11_00000000;
        #10
        pkti = 10'b00_00000000; 
        #80
        ack = 1'b0;
        #30
        $finish; 
    end

endmodule