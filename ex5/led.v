//演習問題(5) LEDコントローラ

//dot:0から4までの配列。それぞれがLEDのON/OFFに対応。
module led(input rst, st, clk, input logic [4:0] mem [31:0], output logic [4:0] dot);
logic [5:0] count; //memのインデックスカウンタ

always_ff @(posedge clk)begin
    if(rst) begin
        count <= 6'd0;
        dot <= 5'b00000;
    end
    else begin 
        if(st) begin
            if(count==6'd32) begin
                count <= 6'd0;
                dot <= 5'b00000;
            end 
            else begin
                count <= count+1;
                dot <= mem[count];
            end
        end
        else begin
            count <= 6'd0;
            dot <= 5'b00000;
        end
    end
end
endmodule

`timescale 1ps/1ps
module test();
    logic [4:0] mem [31:0];
    logic [4:0] dot;
    logic rst, st, clk;
    always #10 clk = ~clk;
    led l1(rst, st, clk, mem, dot);
    initial begin
        $dumpfile("led.vcd");
        $dumpvars(0,test);
        $readmemb("verilog!!!.txt", mem); //verilog!!!.txtの内容をmem配列に格納
        clk = 1'b0;
        rst = 1'b1;
        st = 1'b0;
        #20
        rst = 1'b0;
        st = 1'b1;
        #650
        st = 1'b0;
        #100
        st = 1'b1;
        #1000
        $finish;
    end
endmodule