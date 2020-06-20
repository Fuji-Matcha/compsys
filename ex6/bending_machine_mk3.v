module bending_mk3(input clk, rst, input ten, input fif, output logic [6:0] change, output logic serv);


    
    logic [2:0] next_state;
    logic a,b, serv;

    always_ff @(posedge clk) begin
        a <= ten;
        b <= fif;
        if (rst) begin
        change <= 3'b101;
        serv <= 1'b0;
        end else begin
            if (change==next_state) serv <= 1'b1;
            else change <= next_state;
        end
    end

    always_comb begin
        case(change)
        // synopsys full_case parallel_case
            3'b000: begin
                case({a,b})
                // synopsys full_case parallel_case
                    2'b00 : next_state = 3'b000;
                    2'b10 : next_state = 3'b001;
                    2'b01 : next_state = 3'b000;
                endcase
            end 3'b001: begin
                case({a,b})
                // synopsys full_case parallel_case
                    2'b00 : next_state = 3'b001;
                    2'b10 : next_state = 3'b010;
                    2'b01 : next_state = 3'b001;
                endcase
            end 3'b010: begin
                case({a,b})
                // synopsys full_case parallel_case
                    2'b00 : next_state = 3'b010;
                    2'b10 : next_state = 3'b011;
                    2'b01 : next_state = 3'b010;
                endcase
            end 3'b011: begin
                case({a,b})
                // synopsys full_case parallel_case
                    2'b00 : next_state = 3'b011;
                    2'b10 : next_state = 3'b100;
                    2'b01 : next_state = 3'b011;
                endcase
            end 3'b100: begin
                case({a,b})
                // synopsys full_case parallel_case
                    2'b00 : next_state = 3'b100;
                    2'b10 : next_state = 3'b000;
                    2'b01 : next_state = 3'b100;
                endcase
            end 3'b101: next_state = 3'b000; //初期化(rst時)
        endcase
    end
    
endmodule