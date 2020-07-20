//81914989 OjimaHiroki
`include "sw.vh"

module mkreq0(input clk, rst, 
            input logic [`PKTW:0] pkto,
            output logic [`PORT:0] reqi);

    logic [`PORT:0] req;
    
    always @(posedge clk) begin
        if (rst) reqi <= 4'b0000;
        else reqi <= req;
    end

//routing_table(all port2)
    always @(*) begin
        if(pkto[`FLOWBH:`FLOWBL]==`HEAD) begin
            case(pkto[1:0])
            //synopsys full_case parallel_case
                2'b00: req = 4'b0100;
                2'b01: req = 4'b0100;
                2'b10: req = 4'b0100;
                2'b11: req = 4'b0100;
            endcase
        end 
        else req = 4'b0000;
    end

endmodule