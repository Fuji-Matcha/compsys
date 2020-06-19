`timescale 1ns/1ps //注意必ず1ns/1ps!!
module test;

    logic clk, rst, ten, fif;
    wire [2:0] change;
    bending_mk2 btmk2(clk, rst, ten, fif, change, serv);
    always #5 clk =~clk;
    //tenかfifをHIにしたらservされるまで(ten=1'b0)&&(fif=1'b0)にしない!!
    initial begin
        $dumpfile("bending_mk2.vcd");
        $dumpvars(0, test);
        clk = 1'b1;
        rst = 1'b0;
        #15
        rst = 1'b1;
        ten = 1'b0;
        fif = 1'b0;
        #10 //ここからお金入れる
        rst = 1'b0;
        ten = 1'b1;
        fif = 1'b0;
        #10
        ten = 1'b1;
        fif = 1'b0;
        #10
        ten = 1'b1;
        fif = 1'b0;
        #10
        ten = 1'b0;
        fif = 1'b1;
        #10
        ten = 1'b0;
        fif = 1'b0;
        #10
        $finish;
    end
endmodule