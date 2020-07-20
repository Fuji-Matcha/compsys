`timescale 1ns/1ps
`include "sw.vh"

module test;

    logic clk, rst, ack, empty;
    logic [`PKTW:0] pkto;
    logic [`PORT:0] reqi;
    wire [`PORT:0] req;
    always #5 clk = ~clk;
    ibsm ibsm(clk, rst, ack, pkto, reqi, empty, re, req);

    initial begin
        $dumpfile("ibsm.vcd");
        $dumpvars(0, test);
        clk = 1'b1;
        rst = 1'b1;
        ack = 1'b0;
        empty = 1'b1;

        #15 //遅延を考慮
        rst = 1'b0;
        pkto = 10'b00_00000000;
        #20
        empty = 1'b0; //パケット検知
        pkto = 10'b10_00000011;
        reqi = 4'b1000;
        #50
        ack = 1'b1;
        #20
        pkto = 10'b01_00000000;
        reqi = 4'b0000;
        #10
        pkto = 10'b01_00000001;
        #10
        pkto = 10'b01_00000010;
        #10
        pkto = 10'b01_00000011;
        #10
        pkto = 10'b11_00000000;
        #10
        pkto = 10'b00_00000000;
        empty = 1'b1;
        #10
        ack = 1'b0;
        #10        
        $finish; 
    end

endmodule