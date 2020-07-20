//81914989 OjimaHiroki
`include "sw.vh"

module sw(input clk, rst, input [`PKTW:0] i0, i1, i2, i3, output [`PKTW:0] o0, o1, o2, o3);

logic [`PKTW:0] co0, co1, co2, co3;
logic [`PORT:0] req0, req1, req2, req3;

//i0:入力パケット,co0:cbへの出力パケット,req0:arbへのリクエスト,sck0:ackor0からのgrantシグナル,full0:fifoのfullシグナル
ib ib0(clk, rst, ack0, i0, co0, full0, req0);
ib ib1(clk, rst, ack1, i1, co1, full1, req1);
ib ib2(clk, rst, ack2, i2, co2, full2, req2);
ib ib3(clk, rst, ack3, i3, co3, full3, req3);

ackor ackor0(ack00, ack10, ack20, ack30, ack0); //ack0:ib0へのack, ackn0:n番出力ポートからのack
ackor ackor1(ack01, ack11, ack21, ack31, ack1);
ackor ackor2(ack02, ack12, ack22, ack32, ack2);
ackor ackor3(ack03, ack13, ack23, ack33, ack3);

arb arb0(clk, rst, req0[0], req1[0], req2[0], req3[0], ack00, ack01, ack02, ack03); //0番出力へ許可するibを選択
arb arb1(clk, rst, req0[1], req1[1], req2[1], req3[1], ack10, ack11, ack12, ack13);
arb arb2(clk, rst, req0[2], req1[2], req2[2], req3[2], ack20, ack21, ack22, ack23);
arb arb3(clk, rst, req0[3], req1[3], req2[3], req3[3], ack30, ack31, ack32, ack33);

cb cb(co0, co1, co2, co3,  //co0:ib0からのパケット, o0:ポート0への最終出力パケット
{ack03, ack02, ack01, ack00}, {ack13, ack12, ack11, ack10},
{ack23, ack22, ack21, ack20}, {ack33, ack32, ack31, ack30},
o0, o1, o2, o3);

endmodule