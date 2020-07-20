all:
	iverilog -g2012 test.v sw.v cb.v arb.v ackor.v ib.v fifo.v mkreq.v mkwe.v ibsm.v
	vvp a.out
ib:
	iverilog -g2012 test.v ib.v fifo.v mkreq.v mkwe.v ibsm.v
	vvp a.out

mkreq:
	iverilog -g2012 mkreq.v mkreq_test.v
	vvp a.out

mkreq_yosys:  
	yosys mkreq.ys

mkreq_s:
	iverilog -gspecify -T typ mkreq_s.v mkreq_test.v osu018_stdcells.v
	vvp a.out

fifo:
	iverilog -g2012 fifo.v fifo_test.v
	vvp a.out

fifo_yosys:
	yosys fifo.ys

fifo_s:
	iverilog -gspecify -T typ fifo_s.v fifo_test.v osu018_stdcells.v
	vvp a.out

ibsm:
	iverilog -g2012 ibsm.v ibsm_test.v
	vvp a.out

ibsm_yosys:
	yosys ibsm.ys

ibsm_s:
	iverilog -gspecify -T typ ibsm_s.v ibsm_test.v osu018_stdcells.v
	vvp a.out

ib:
	iverilog -g2012 ib.v ib_test.v mkwe.v fifo.v ibsm.v mkreq.v
	vvp a.out

ib_yosys:
	yosys ib.ys

ib_s:
	iverilog -gspecify -T typ ib_s.v ib_test.v osu018_stdcells.v
	vvp a.out

cb:
	iverilog -g2012 cb.v cb_test.v
	vvp a.out

cb_yosys:
	yosys cb.ys

cb_s:
	iverilog -gspecify -T typ cb_s.v cb_test.v osu018_stdcells.v
	vvp a.out

arb:
	iverilog -g2012 arb.v arb_test.v
	vvp a.out

arb_yosys:
	yosys arb.ys

arb_s:
	iverilog -gspecify -T typ arb_s.v arb_test.v osu018_stdcells.v
	vvp a.out

ackor:
	iverilog -g2012 ackor.v ackor_test.v
	vvp a.out

ackor_yosys:
	yosys ackor.ys

ackor_s:
	iverilog -gspecify -T typ ackor_s.v ackor_test.v osu018_stdcells.v
	vvp a.out

sw:
	iverilog -g2012 sw.v sw_test.v cb.v arb.v ackor.v ib.v mkwe.v fifo.v ibsm.v mkreq.v
	vvp a.out

sw_yosys:
	yosys sw.ys

sw_s:
	iverilog -gspecify -T typ sw_s.v sw_test.v osu018_stdcells.v
	vvp a.out

net:
	iverilog -g2012 net.v net_test.v sw.v cb.v arb.v ackor.v ib.v mkwe.v fifo.v ibsm.v mkreq.v
	vvp a.out

net_yosys:
	yosys net.ys

net_s:
	iverilog -gspecify -T typ net_s.v net_test.v osu018_stdcells.v
	vvp a.out

net2:
	iverilog -g2012 net.v net_test.v sw.v sw0.v cb.v arb.v ackor.v ib.v ib0.v mkwe.v fifo.v ibsm.v mkreq.v mkreq0.v
	vvp a.out

net2_yosys:
	yosys net.ys

net2_s:
	iverilog -gspecify -T typ net_s.v net_test.v osu018_stdcells.v
	vvp a.out