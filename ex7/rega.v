//レジスタファイル
module rega(input clk, we,
	input logic [1:0] wad, //書き込みアドレス
	input [15:0] wd, //書き込みデータ
	input logic [1:0] arad, brad, //書き出しアドレス
	output logic [15:0] a, b); //書き出しデータ

	logic [15:0] regar [3:0]; //メモリ(16bit*4)

	always @(posedge clk) begin
		if(we) regar[wad] <= wd; //書き込み
	end

	assign a = regar[arad];
	assign b = regar[brad];
endmodule
