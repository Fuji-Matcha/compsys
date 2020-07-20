//81914989 OjimaHiroki
`include "sw.vh"

module ibsm(input clk, rst, 
            input ack, //arbからの送信許可
            input [`PKTW:0] pkto, //fifoから取り出したパケット
            input [`PORT:0] reqi, //mkareqからのリクエスト信号
            input empty, //fifoの空フラッグ
            output logic re, //fifoのread enable
            output logic [`PORT:0] req); //arbへのリクエスト

    logic [1:0] state, nextstate;
    logic [`PORT:0] tmp;

    always @(posedge clk) begin
        if(rst) state <= 2'b00;
        else begin 
            state <= nextstate;
            if(state==2'b00) tmp <= 4'b0000; 
            if(state==2'b01 && pkto[`FLOWBH:`FLOWBL]==`HEAD) tmp <= reqi;
        end
    end
        
    always @(*) begin
        nextstate = state; //for exception
        re = `NEGATE;
        req = 4'b0000;
        case(state)
        // synopsys full_case parallel_case
            2'b00: begin //do nothing
                if(empty==`NEGATE) begin
                    nextstate = 2'b01; //次のステートへ
                    if(pkto[`FLOWBH:`FLOWBL]==`HEAD) req = reqi;
                end
                else nextstate = 2'b00; //現状維持
            end
            2'b01: begin //send request, wait ack
                if(pkto[`FLOWBH:`FLOWBL]==`HEAD) req = reqi;
                else req = tmp;
                if(ack==`ASSERT) begin 
                    nextstate = 2'b10; //次のステートへ
                    re = `ASSERT;
                end
                else nextstate = 2'b01; //現状維持
            end
            2'b10: begin //send packets
                re = `ASSERT;
                if(pkto[`FLOWBH:`FLOWBL]==`TAIL) begin
                    nextstate = 2'b00; //次のステートへ
                    req = 4'b000;
                end
                else begin
                    nextstate = 2'b10; //現状維持
                    req = tmp;
                end
            end
        endcase 
    end

endmodule