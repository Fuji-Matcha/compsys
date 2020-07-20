//81914989 OjimaHiroki
`include "sw.vh"

// Input Buffer
module ib(input clk, rst, 
        input ack, 
        input [`PKTW:0] pkti, 
        output [`PKTW:0] pkto, 
        output full, 
        output [`PORT:0] req);

    wire [`PORT:0] reqi;

    mkwe mkwe(pkti, we); // fifoのweを生成。
    fifo fifo(clk, rst, re, we, pkti, empty, full, pkto);
    ibsm ibsm(clk, rst, ack, pkto, reqi, empty, re, req); // ステートマシン。ckからreを生成。
    mkreq mkreq(clk, rst, pkto, reqi); // fifoの出力pktoから宛先アドレスを読み取りreqを生成

endmodule

