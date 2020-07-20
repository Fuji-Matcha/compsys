//81914989 OjimaHiroki
`include "sw.vh"

//n番出力ポートへのreqから、どの入力ポートを許可するかを決める
//低順位出力中に高順位がきたとき対応に課題あり
module arb(input clk, rst,
        input req0, req1, req2, req3, 
        output logic ack0, ack1, ack2, ack3);

    logic nack0, nack1, nack2, nack3, check, req, dup;
    logic [1:0] round, next_round;
    logic [2:0] dupflag;

    always @(posedge clk) begin
        if(rst) begin
            ack0 <= `NEGATE;
            ack1 <= `NEGATE; 
            ack2 <= `NEGATE;
            ack3 <= `NEGATE;
            check <= `NEGATE;
            round <= 2'b00;
        end else begin
            ack0 <= nack0;
            ack1 <= nack1; 
            ack2 <= nack2;
            ack3 <= nack3;
            if(req==`NEGATE && check==`ASSERT) begin
                round <= next_round;
                check <= `NEGATE;
            end
            else if(dup==`ASSERT) check <= `ASSERT;
        end
    end
 
    always @(*) begin
        nack0 = `NEGATE;
        nack1 = `NEGATE;
        nack2 = `NEGATE;
        nack3 = `NEGATE;

        req = (req0||req1||req2||req3);
        dupflag = req0 + req1 + req2 + req3;

        if(dupflag == 3'b010) dup = `ASSERT;
        else if(dupflag == 3'b011) dup = `ASSERT;
        else if(dupflag == 3'b100) dup = `ASSERT;
        else dup = `NEGATE;

        case(round)
        //synopsys full_case parallel_case
            2'b00:begin
                next_round = 2'b01;
                if(req0==`ASSERT) nack0 = `ASSERT ;
                else if(req1==`ASSERT) nack1 = `ASSERT;
                else if(req2==`ASSERT) nack2 = `ASSERT;
                else if(req3==`ASSERT) nack3 = `ASSERT;
            end
            2'b01:begin
                next_round = 2'b10;
                if(req1==`ASSERT) nack1 = `ASSERT ;
                else if(req2==`ASSERT) nack2 = `ASSERT;
                else if(req3==`ASSERT) nack3 = `ASSERT;
                else if(req0==`ASSERT) nack0 = `ASSERT;
            end
            2'b10:begin
                next_round = 2'b11;
                if(req2==`ASSERT) nack2 = `ASSERT ;
                else if(req3==`ASSERT) nack3 = `ASSERT;
                else if(req0==`ASSERT) nack0 = `ASSERT;
                else if(req1==`ASSERT) nack1 = `ASSERT;
            end
            2'b11:begin
                next_round = 2'b00;
                if(req3==`ASSERT) nack3 = `ASSERT ;
                else if(req0==`ASSERT) nack0 = `ASSERT;
                else if(req1==`ASSERT) nack1 = `ASSERT;
                else if(req2==`ASSERT) nack2 = `ASSERT;
            end
        endcase
    end

endmodule