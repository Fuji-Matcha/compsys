## ファイル説明  
* bending_machine1.v  
ex4/のbending_machine.vのenumをなくしたver。ラッチが生成されるため合成後は動かない。  
* benging_machine_mk3.v  
ミスコミット。これは無視してよい。  
* bending_machine_mk2.v  
ステートマシンで作ったver。合成後も動く。  
* add_benging_machine.v  
足し算器のみで作ったver。合成後も動く。  
* test_\*.v  
テストベンチ。 
* bd_\*.ys  
\*.vを合成するコマンドをまとめたファイル(windowsの場合最後の行のコメントアウト変更が必要)。最終出力ファイル名はここで指定。  
* bd_\*.v  
合成後のファイル。  

## 実行方法  
$ yosys \*.ys : 回路合成  
$ iverilog -g2012 te\*.v test\*.v :合成前のシミュレーション  
$ iverilog -gspecify -T typ te\*.v gate\*.v ../../osu018_stdcells.v :合成後の遅延付きシミュレーション  
