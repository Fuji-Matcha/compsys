`timescale 1ns/1ps
`include "sw.vh"

module test;

    logic ack0, ack1, ack2, ack3;
    logic clk;
    always #5 clk = ~clk;
    ackor ackor(ack0, ack1, ack2, ack3, ack);

    initial begin
        $dumpfile("ackor.vcd");
        $dumpvars(0, test);
        clk = 1'b1;
        ack0 = 1'b0;
        ack1 = 1'b0;
        ack2 = 1'b0;
        ack3 = 1'b0;
        #15
        ack0 = 1'b1;
        #10
        ack1 = 1'b1;
        #10
        ack2 = 1'b1;
        #10
        ack3 = 1'b1;
        #10
        ack0 = 1'b0;
        ack1 = 1'b0;
        ack2 = 1'b0;
        ack3 = 1'b0;
        #30
        $finish; 
    end

endmodule