//81914989 OjimaHiroki
`include "sw.vh"
//fifoの出力を監視してreqを生成。reqの継続判定はisbmに任せる
module mkreq(input clk, rst, 
            input logic [`PKTW:0] pkto, //fifoから出力されたパケット
            output logic [`PORT:0] reqi); //req

    logic [`PORT:0] req;
    
    always @(posedge clk) begin
        if (rst) reqi <= 4'b0000;
        else reqi <= req;
    end

//routing_table
    always @(*) begin
        if(pkto[`FLOWBH:`FLOWBL]==`HEAD) begin
            case(pkto[1:0])
            //synopsys full_case parallel_case
                2'b00: req = 4'b0001;
                2'b01: req = 4'b0010;
                2'b10: req = 4'b0100;
                2'b11: req = 4'b1000;
            endcase
        end 
        else req = 4'b0000;
    end

endmodule