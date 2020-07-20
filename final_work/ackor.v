//81914989 OjimaHiroki
module ackor(input ack0, ack1, ack2, ack3, //n番出力ポートからのack
            output logic ack); //入力ポートへのack

    always @(*) begin
        ack = ack0 || ack1 || ack2 || ack3;
    end

endmodule