// 演習問題(４)自販機

module bending(input rst, clk, en, ten, fif, output logic serv, output logic [1:0] test, output logic [3:0] mon);

    typedef enum logic [2:0] {ZERO=3'b000, ONE=3'b001, TWO=3'b010, THREE=3'b011,
    FOUR=3'b100, FIVE=3'b101} myst;

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
                if(ten) nstate = ONE;
                if(fif) begin
                    serv = 1'b1;
                    mon = 4'b0000;
                    nstate = ZERO;
                end
            end
            ONE: begin
                if(ten) nstate = TWO;
                if(fif) begin
                    serv = 1'b1;
                    mon = 4'b0001;
                    nstate = ZERO;
                end
            end
            TWO: begin
                if(ten) nstate = THREE;
                if(fif) begin
                    serv = 1'b1;
                    mon = 4'b0010;
                    nstate = ZERO;
                end
            end        
            THREE: begin
                if(ten) nstate = FOUR;
                if(fif) begin
                    serv = 1'b1;
                    mon = 4'b0100;
                    nstate = ZERO;
                end
            end        
            FOUR: begin
                if(ten) nstate = FIVE;
                if(fif) begin
                    serv = 1'b1;
                    mon = 4'b1000;
                    nstate = ZERO;
                    test = 2'b10;
                end
            end
            FIVE: begin
                serv = 1'b1;
                mon = 4'b0000;
                nstate = ZERO;
            end
            endcase
        end
        else begin
            serv = 1'b0;
            mon = 4'b0000;
            test = 2'b00;
        end
    end
endmodule

module test;
    logic rst, clk, en, ten, fif;
    logic [1:0] tst;
    bending bt(rst, clk, en, ten, fif, serv, tst, mon);
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
        $finish;
    end

endmodule