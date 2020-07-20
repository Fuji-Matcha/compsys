`timescale 1ns/1ps
`include "sw.vh"

module test;

    logic [`PKTW:0] co0, co1, co2, co3;
    logic [`PORT:0] ack0, ack1, ack2, ack3;
    logic clk;
    wire [`PKTW:0] o0, o1, o2, o3;
    always #5 clk = ~clk;
    cb cb(co0, co1, co2, co3, ack0, ack1, ack2, ack3, o0, o1, o2, o3);

    initial begin
        $dumpfile("cb.vcd");
        $dumpvars(0, test);
        clk = 1'b1;
        #5
        co0 = 10'b10_00000011;
        co1 = 10'b00_00000000;
        co2 = 10'b00_00000000;
        co3 = 10'b00_00000000;
        ack0 = 4'b0000;
        ack1 = 4'b0000;
        ack2 = 4'b0000;
        ack3 = 4'b0000;
        #40
        ack3 = 4'b0001;
        #10 //ackを出してから次のクロックまでに次のパケットを出力させる(ここを#10にしたい)
        co0 = 10'b01_00000000;
        #10
        co0 = 10'b01_00000001;
        #10
        co0 = 10'b01_00000010;
        #10
        co0 = 10'b01_00000011;
        #10
        co0 = 10'b11_00000000;
        #10
        co0 = 10'b00_00000000;
        #20
        ack3 = 4'b0000;
        #30
        $finish; 
    end

endmodule