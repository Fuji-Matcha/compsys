`timescale 1ns/1ps
`include "sw.vh"

module test;

    logic req0, req1, req2, req3;
    logic clk, rst;
    always #5 clk = ~clk;
    arb arb(clk, rst, req0, req1, req2, req3, ack0, ack1, ack2, ack3);

    initial begin
        $dumpfile("arb.vcd");
        $dumpvars(0, test);
        clk = 1'b1;
        rst = 1'b1;
        req0 = 1'b0;
        req1 = 1'b0;
        req2 = 1'b0;
        req3 = 1'b0;
        #15
        rst = 1'b0;
        req0 = 1'b1;
        req1 = 1'b1;
        req2 = 1'b1;
        req3 = 1'b1;
        #20
        req0 = 1'b0;
        #20
        req1 = 1'b0;
        #20
        req2 = 1'b0;
        #20
        req3 = 1'b0;
        #20
        req0 = 1'b1;
        req1 = 1'b1;
        req2 = 1'b1;
        req3 = 1'b1;
        #20
        req0 = 1'b0;
        #20
        req1 = 1'b0;
        #20
        req2 = 1'b0;
        #20
        req3 = 1'b0;
        #20
        req0 = 1'b1;
        req1 = 1'b1;
        req2 = 1'b1;
        req3 = 1'b1;
        #20
        req0 = 1'b0;
        #20
        req1 = 1'b0;
        #20
        req2 = 1'b0;
        #20
        req3 = 1'b0;
        $finish; 
    end

endmodule