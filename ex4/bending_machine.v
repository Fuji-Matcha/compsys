// 演習問題(４)自販機

//ten:10円を入れる時にHI,fif:50円を入れる時にHI,serv:ジュース排出,change:おつり値出力
module bending(input rst, clk, en, ten, fif, output logic serv, output logic [5:0] change);

    //ステート型(myst)を定義
    typedef enum logic [2:0] {ZERO=3'b000, ONE=3'b001, TWO=3'b010, THREE=3'b011,
    FOUR=3'b100, FIVE=3'b101} myst;

    //myst型を宣言
    myst state, nstate;  

    always_ff @(posedge clk)begin
        if (rst) begin
            state <= ZERO;
        end
        else state <= nstate;
    end

    always_comb begin
        if(en) begin
            nstate = state;
            case(state)
            // synopsys full_case parallel_case
            ZERO: begin //例えばtotal=1*ten, if(total==0)などとするとデコーダを作ってしまう
                if(fif) begin
                    serv = 1'b1;
                    nstate = ZERO;
                    // change = 6'd00; //これがあると動かないけど理由がわからない(nstateが0からいきなり2に変わる)
                end
                else if(ten) nstate = ONE;
            end
            ONE: begin
                if(fif) begin
                    serv = 1'b1;
                    nstate = ZERO;
                    change = 6'd10;
                end
                else if(ten) nstate = TWO;
            end
            TWO: begin
                if(fif) begin
                    serv = 1'b1;
                    nstate = ZERO;
                    change = 6'd20;
                end
                else if(ten) nstate = THREE;
            end        
            THREE: begin
                if(fif) begin
                    serv = 1'b1;
                    nstate = ZERO;
                    change = 6'd30;
                end
                else if(ten) nstate = FOUR;
            end        
            FOUR: begin
                if(fif) begin
                    serv = 1'b1;
                    nstate = ZERO;
                    change = 6'd40;
                end
                else if(ten) nstate = FIVE;
            end
            FIVE: begin
                serv = 1'b1;
                nstate = ZERO;
                change = 6'd00;
            end
            endcase
        end
        //プリセット値
        else begin
            serv = 1'b0;
            change = 6'd00;
        end
    end
endmodule

module test;
    logic rst, clk, en, ten, fif;
    logic [5:0] change;
    bending bt(rst, clk, en, ten, fif, serv, change);
    always #5 clk = ~clk;
    
    initial begin
        $dumpfile("bending.vcd");
        $dumpvars(0, test);
        clk = 1'b1;
        rst = 1'b1;
        en = 1'b0;
        ten = 1'b0;
        fif = 1'b0;
        #20
        // tenとfifを同時にHIにしない
        rst = 1'b0;
        en = 1'b1;
        #20
        ten = 1'b1;
        fif = 1'b0;
        #10
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