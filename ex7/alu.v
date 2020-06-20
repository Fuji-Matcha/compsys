module alu(input [15:0] a, b, input [2:0] op, output logic [15:0] r);
	enum {SET0, SET1, SET2, ADD, SUB, TRU} OPTYPE;
	always_comb
		case(op)
		// synopsys full_case parallel_case
		SET0: r = 16'd3; //000
		SET1: r = 16'd0; //001
		SET2: r = 16'd2; //010
		ADD: r = a+b; //011
		SUB: r = a-b; //100
		TRU: r = a; //101
		endcase
endmodule
