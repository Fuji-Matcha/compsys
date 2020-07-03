`include "pu.vh"
module lidx(input [`WIDTH:0] i, input [`HALFWIDTH:0] iv, input [`LIDXS:0] op, output logic [`WIDTH:0] o);
	`LIDXENUM
	always @*
		casex(op)
		// synopsys full_case parallel_case
		THU:
			o = i;
		IMM:
			o = {{8{iv[`HALFWIDTH]}},iv[`HALFWIDTH:0]}; //上位8bitをivの最上位ビットで埋める
		LIL:
			o = {i[`WIDTH:`HALFWIDTH+1],iv}; //下位ビットをivで埋める
		LIH:
			o = {iv,i[`HALFWIDTH:0]}; //上位ビットをivで埋める
		endcase
endmodule
