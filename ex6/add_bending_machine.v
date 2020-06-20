module add_bending(input clk, rst, input ten, input fif, output logic [6:0] change, output logic serv);

    logic [6:0] count;

    always_ff @(posedge clk) begin
        if (rst) begin
            count <= 3'd0;
            change <= 6'd00;
            serv <= 1'b0;
        end else begin
            if (count < 6'd50) begin
                if (ten) count <= count + 6'd10;
                else if (fif)  count <= count + 6'd50;
                else count <= count + 6'd00;
            end else begin
                change <= count - 6'd50;
                serv <= 1'b1;
            end
        end
    end
    
endmodule