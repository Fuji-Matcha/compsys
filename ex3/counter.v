//プリセッタブルダウンカウンタ

module counter(input [7:0] v, input clk, en, rst, output b);
    logic [7:0] count;
    logic [1:0] t;
    logic b;

    always_ff @(posedge clk) begin;
        if(rst) begin; //値を初期化
            count <= 8'd0;
            b <= 1'b0;
            t <= 2'd0;
        end 
        else begin;
            if(en) begin; //カウント動作
                if(count!=0) begin; //カウンタ減算
                    count <= count - 8'd1;
                    b <= 1'b0;
                end
                else begin; //beep出力動作
                    if (t!=0) begin; //beep出力
                        b <= 1'b1;
                        t <= t - 2'd1;
                    end
                    else b<= 1'b0; //beep出力停止
                end
            end
            else begin; //値をセット
                count <= v;
                b <= 1'b0;
                t <= 2'd3;
            end
        end
    end
endmodule