## ファイル説明
* test*.v  
ブロッキングorノンブロッキング代入で記述したmoduleファイル。第６回テキスト参照。
* te*.v
テストベンチ。.vcdファイル名はここで指定。
* te*.ys 
test*.vを合成するコマンドをまとめたファイル(windowsの場合最後の行のコメントアウト変更が必要)。最終出力ファイル名はここで指定。
* synth*.v
.ysコマンド中の中間ファイル
* gate*.v 
最終的な合成結果を記述したファイル

## 実行方法
$ yosys *.ys : 回路合成  
$ iverilog -g2012 te*.v test*.v :合成前のシミュレーション  
$ iverilog -gspecify -T typ te*.v gate*.v ../../osu018_stdcells.v :合成後の遅延付きシミュレーション  
