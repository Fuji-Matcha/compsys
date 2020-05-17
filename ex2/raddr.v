//4bit Ripple Carry Adder
// a,b:加算する(される)ビット, c:前桁からの繰上りビット, co:後桁への繰り上げビット, s:その桁の足し算の和ビット
// fadderモジュール内の処理で値がきまるc[3:1]を外側のraddrモジュールで初期化してしまっていいのかは疑問
module raddr(input [3:0] a, b, output [3:0] s, output co);
	logic [3:0] c, bcomp;
	assign bcomp[3:0] = ~b[3:0] + 4'b0001; //補数を計算
	// logic co;
	assign c[0] = 1'b0; //今回はc[3:1]を初期化しなかった→warningがでる
	faddr f0(a[0], bcomp[0], c[0], s[0], c[1]);
	faddr f1(a[1], bcomp[1], c[1], s[1], c[2]);
	faddr f2(a[2], bcomp[2], c[2], s[2], c[3]);
	faddr f3(a[3], bcomp[3], c[3], s[3], co);
endmodule
