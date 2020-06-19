module bending_mk2(input clk, rst, ten, fif, output logic [2:0] change, output serv);

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
                    2'b00 : begin
                        next_state = 3'b000;
                    end 2'b10 : begin 
                        next_state = 3'b001;
                     end 2'b01 : begin 
                        next_state = 3'b000;
                    end
                endcase
            end 3'b001: begin
                case({a,b})
                // synopsys full_case parallel_case
                    2'b00 : begin
                        next_state = 3'b001;
                    end 2'b10 : begin 
                        next_state = 3'b010;
                    end 2'b01 : begin 
                        next_state = 3'b001;
                    end
                endcase
            end 3'b010: begin
                case({a,b})
                // synopsys full_case parallel_case
                    2'b00 : begin 
                        next_state = 3'b010;
                    end 2'b10 : begin 
                        next_state = 3'b011;
                    end 2'b01 : begin 
                        next_state = 3'b010;
                    end
                endcase
            end 3'b011: begin
                case({a,b})
                // synopsys full_case parallel_case
                    2'b00 : begin 
                        next_state = 3'b011;
                    end 2'b10 : begin
                        next_state = 3'b100;
                    end 2'b01 : begin 
                        next_state = 3'b011;
                    end
                endcase
            end 3'b100: begin
                case({a,b})
                // synopsys full_case parallel_case
                    2'b00 : begin
                        next_state = 3'b100
                    end 2'b10 : begin 
                        next_state = 3'b000;
                    end 2'b01 : begin 
                        next_state = 3'b100;
                    end
                endcase
            end 3'b101: next_state = 3'b000; //初期化(rst時)
        endcase
    end
    
endmodule