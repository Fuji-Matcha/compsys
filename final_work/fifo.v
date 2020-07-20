//81914989 OjimaHiroki
`include "sw.vh"

//10bit幅16section(1dummy)
//空のときの読み出し及び満杯のときの書き込みはしない
module fifo(input clk, rst,
            input re, we,
            input [`PKTW:0] pkti, //入力パケット
            output empty, full, 
            output [`PKTW:0] pkto);

    logic [`PKTW:0] mem [`FIFOL:0];
    logic [`FIFOLB:0] head, tail, headi; //ポインタ
    logic empty, full;

    always @(posedge clk) begin
        
        if(rst) begin
            head <= 0;
            tail <= 0;
            mem [0] <= 10'b00_00000000;
        end
        else begin
            if(we) begin 
                mem [head] <= pkti;
                mem [headi] <= 10'b00_00000000;
                head <= head + 1;
            end
            if(re) tail <= tail + 1;
        end
    end

    assign pkto = mem[tail];

    always @(*) begin
        if(head == tail) empty = `ASSERT;
        else empty = `NEGATE;
        headi = head + 1; //headiのbit幅に収まる
        if(headi == tail) full = `ASSERT;
        else full = `NEGATE;
    end

endmodule