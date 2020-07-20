//81914989 OjimaHiroki
`include "sw.vh"

module net(input clk, rst,
        input [`PKTW:0] ni0, ni1, ni2, ni3,
        output [`PKTW:0] no0, no1, no2, no3);

    wire [`PKTW:0] c0a, c0b, c1a, c1b, c2a, c2b, c3a, c3b, d0a, d0b, d1a, d1b, d2a, d2b, d3a, d3b;
    
    sw0 sw0(clk, rst, 
            ni0, c0b, d0b, c3a,
            no0, c0a, d0a, c3b);

    sw sw1(clk, rst, 
            c0a, ni1, c1b, d1b,
            c0b, no1, c1a, d1a);
    
    sw sw2(clk, rst, 
            d2b, c1a, ni2, c2b,
            d2a, c1b, no2, c2a);

    sw sw3(clk, rst, 
            c3b, d3b, c2a, ni3,
            c3a, d3a, c2b, no3);
        
    sw sw4(clk, rst, 
            d0a, d1a, d2a, d3a,
            d0b, d1b, d2b, d3b);

endmodule