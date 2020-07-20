//81914989 OjimaHiroki
`include "sw.vh"

//ackを出してから次のクロックまでに次のパケットを出力させる(初期パケットが複数クロックにわたって重複してしまう)
module cb(input [`PKTW:0] co0, co1, co2, co3, //co0:ib0からのパケット 
        input [`PORT:0] ack0, ack1, ack2, ack3, //ackn;n番出力ポートのack
        output logic [`PKTW:0] o0, o1, o2, o3);  //o0:ポート0への最終出力パケット

    always @(*) begin
        o0 = 10'b00_00000000;
        o1 = 10'b00_00000000;
        o2 = 10'b00_00000000;
        o3 = 10'b00_00000000;
        // outport 0 この中で同時に複数ASSERTすることはない
        if(ack0[0]==`ASSERT) o0 = co0;
        if(ack0[1]==`ASSERT) o0 = co1;
        if(ack0[2]==`ASSERT) o0 = co2;
        if(ack0[3]==`ASSERT) o0 = co3;
        // outport 1
        if(ack1[0]==`ASSERT) o1 = co0;
        if(ack1[1]==`ASSERT) o1 = co1;
        if(ack1[2]==`ASSERT) o1 = co2;
        if(ack1[3]==`ASSERT) o1 = co3;
        // outport 2
        if(ack2[0]==`ASSERT) o2 = co0;
        if(ack2[1]==`ASSERT) o2 = co1;
        if(ack2[2]==`ASSERT) o2 = co2;
        if(ack2[3]==`ASSERT) o2 = co3;
        // outport 3
        if(ack3[0]==`ASSERT) o3 = co0;
        if(ack3[1]==`ASSERT) o3 = co1;
        if(ack3[2]==`ASSERT) o3 = co2;
        if(ack3[3]==`ASSERT) o3 = co3;
    end

endmodule