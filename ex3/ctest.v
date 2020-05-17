//counterモジュールのテストベンチ

module test;
    logic [7:0] v;
    logic clk, en, rst;
    counter ca(v, clk, en, rst, b);

    initial begin;
        $dumpfile("counter.vcd");
        $dumpvars(0, test);

        //初期化
        v = 8'd5;
        en = 0;
        rst = 1;
        #1
        clk = 1;
        #1
        clk = 0;
        #1

        //値をセット
        v = 8'd5;
        en = 0;
        rst = 0; 
        #1
        clk = 1;
        #1
        clk = 0;
        #1

        //カウント開始
        v = 8'd5;
        en = 1;
        rst = 0;        
        #1
        clk = 1;
        #1
        clk = 0;
        #1

        v = 8'd5;
        en = 1;
        rst = 0;        
        #1
        clk = 1;
        #1
        clk = 0;
        #1

        v = 8'd5;
        en = 1;
        rst = 0;        
        #1
        clk = 1;
        #1
        clk = 0;
        #1

        v = 8'd5;
        en = 1;
        rst = 0;        
        #1
        clk = 1;
        #1
        clk = 0;
        #1

        v = 8'd5;
        en = 1;
        rst = 0;        
        #1
        clk = 1;
        #1
        clk = 0;
        #1

        v = 8'd5;
        en = 1;
        rst = 0;        
        #1
        clk = 1;
        #1
        clk = 0;
        #1

        v = 8'd5;
        en = 1;
        rst = 0;        
        #1
        clk = 1;
        #1
        clk = 0;
        #1

        v = 8'd5;
        en = 1;
        rst = 0;        
        #1
        clk = 1;
        #1
        clk = 0;
        #1

        v = 8'd5;
        en = 1;
        rst = 0;        
        #1
        clk = 1;
        #1
        clk = 0;
        #1

        v = 8'd5;
        en = 1;
        rst = 0;        
        #1
        clk = 1;
        #1
        clk = 0;
        #1
        
        //値を再セット
        v = 8'd3;
        en = 0;
        rst = 0;        
        #1
        clk = 1;
        #1
        clk = 0;
        #1

        //カウント開始
        v = 8'd3;
        en = 1;
        rst = 0;        
        #1
        clk = 1;
        #1
        clk = 0;
        #1

        v = 8'd3;
        en = 1;
        rst = 0;        
        #1
        clk = 1;
        #1
        clk = 0;
        #1

        v = 8'd3;
        en = 1;
        rst = 0;        
        #1
        clk = 1;
        #1
        clk = 0;
        #1

        $finish;
    end

endmodule
