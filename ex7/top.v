module top(input clk, rst);
	logic [15:0] a, b, wd;
	logic [1:0] arad, brad, wad;
	logic [2:0] op;
	logic [5:0] pca; //pcに同じ
	logic [9:0] o;
	rega rega(clk,we, wad, wd, arad, brad, a, b);
	alu alu(a, b, op, wd);
	pc pc(h, pca, clk, rst);
	imem imem(pca, o);
	
	// デコーダ
	// 停止/書き込みアドレス/演算/bの読み込みアドレス/aの読み込みアドレス
	assign {h, wad, op, arad, brad} = o;
	// hが立ったら書かなくなる
	assign we = ~h;
endmodule

