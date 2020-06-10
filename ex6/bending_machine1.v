// 演習問題(４)自販機

//ten:10円を入れる時にHI,fif:50円を入れる時にHI,serv:ジュース排出,change:おつり値出力、yosysではenumが使えない
module bending1(input rst, clk, en, ten, fif, output logic serv, output logic [5:0] change);

    logic [2:0] state, nstate; //state保持
    logic [5:0] c; //おつり値保持

    always_ff @(posedge clk)begin
        if (rst) state <= 3'b000;
        else state <= nstate;
    end

    always_comb begin
        if(en) begin
            nstate = state;
            case(state)
            // synopsys full_case parallel_case
            3'b000: begin //例えばtotal=1*ten, if(total==0)などとするとデコーダを作ってしまう
                c = 6'd00;
                serv = 1'b0;
                if(fif) begin 
                    nstate = 3'b101;
                    c = 6'd00;
                end else if(ten) nstate = 3'b001;
            end 3'b001: begin
                if(fif) begin 
                    nstate = 3'b101; 
                    c = 6'd10;
                end else if(ten) nstate = 3'b010;
            end 3'b010: begin
                if(fif) begin 
                    nstate = 3'b101;
                    c = 6'd20;
                end else if(ten) nstate = 3'b011;
            end 3'b011: begin
                if(fif) begin
                    nstate = 3'b101;
                    c = 6'd30;
                end else if(ten) nstate = 3'b100;
            end 3'b100: begin
                if(fif) begin 
                    nstate = 3'b101;
                    c = 6'd40;
                end else if(ten) nstate = 3'b101;
            end 3'b101: begin
                change = c;
                serv = 1'b1;
                nstate = 3'b000;
            end
            endcase
        end
        //プリセット値
        else begin
            serv = 1'b0;
            c = 6'd00;
        end
    end
endmodule