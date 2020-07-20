//81914989 OjimaHiroki
`include "sw.vh"
// fifoのweを生成。パケットの先頭2bitを判定
module mkwe(input [`PKTW:0] pkti, output logic we);

    always @(*) begin
        if(pkti[`FLOWBH:`FLOWBL]==`EMPT) we = 1'b0;
        else we = 1'b1;  
    end

endmodule