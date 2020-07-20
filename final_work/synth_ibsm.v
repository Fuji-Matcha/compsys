/* Generated by Yosys 0.9 (git sha1 1979e0b1, i686-w64-mingw32.static-g++ 5.5.0 -Os) */

(* top =  1  *)
(* src = "ibsm.v:4" *)
module ibsm(clk, rst, ack, pkto, reqi, empty, re, req);
  (* src = "ibsm.v:15" *)
  wire [3:0] _000_;
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  (* src = "ibsm.v:5" *)
  input ack;
  (* src = "ibsm.v:4" *)
  input clk;
  (* src = "ibsm.v:8" *)
  input empty;
  (* src = "ibsm.v:6" *)
  input [9:0] pkto;
  (* src = "ibsm.v:9" *)
  output re;
  (* src = "ibsm.v:10" *)
  output [3:0] req;
  (* src = "ibsm.v:7" *)
  input [3:0] reqi;
  (* src = "ibsm.v:4" *)
  input rst;
  (* onehot = 32'd1 *)
  reg [2:0] state;
  (* src = "ibsm.v:13" *)
  reg [3:0] tmp;
  assign _004_ = ~rst;
  assign _005_ = ~state[1];
  assign _006_ = ~state[0];
  assign _007_ = rst | ~(empty);
  assign _008_ = pkto[9] & pkto[8];
  assign _009_ = ~(_008_ & _004_);
  assign _010_ = ~((_007_ | _006_) & (_005_ | _009_));
  assign _001_ = _010_ | ~(_004_);
  assign _011_ = ~state[2];
  assign _012_ = empty | rst;
  assign _013_ = ack | rst;
  assign _003_ = ~((_012_ | _006_) & (_011_ | _013_));
  assign _014_ = _008_ | ~(_004_);
  assign _015_ = rst | ~(ack);
  assign _002_ = ~((_014_ | _005_) & (_011_ | _015_));
  assign _016_ = tmp[0] & ~(state[0]);
  assign _017_ = pkto[8] | ~(pkto[9]);
  assign _018_ = _017_ | ~(state[2]);
  assign _019_ = _018_ ? _016_ : reqi[0];
  assign _000_[0] = rst ? tmp[0] : _019_;
  assign _020_ = tmp[1] & ~(state[0]);
  assign _021_ = _018_ ? _020_ : reqi[1];
  assign _000_[1] = rst ? tmp[1] : _021_;
  assign _022_ = tmp[2] & ~(state[0]);
  assign _023_ = _018_ ? _022_ : reqi[2];
  assign _000_[2] = rst ? tmp[2] : _023_;
  assign _024_ = tmp[3] & ~(state[0]);
  assign _025_ = _018_ ? _024_ : reqi[3];
  assign _000_[3] = rst ? tmp[3] : _025_;
  assign _026_ = _017_ | ~(reqi[0]);
  assign _027_ = ~(_026_ | empty);
  assign _028_ = state[2] | state[1];
  assign _029_ = _008_ | ~(tmp[0]);
  assign _030_ = ~tmp[0];
  assign _031_ = ~reqi[0];
  assign _032_ = pkto[9] & ~(pkto[8]);
  assign _033_ = _032_ ? _031_ : _030_;
  assign _034_ = ~((_029_ | _005_) & (_011_ | _033_));
  assign req[0] = _028_ ? _034_ : _027_;
  assign _035_ = _017_ | ~(reqi[1]);
  assign _036_ = ~(_035_ | empty);
  assign _037_ = _008_ | ~(tmp[1]);
  assign _038_ = ~tmp[1];
  assign _039_ = ~reqi[1];
  assign _040_ = _032_ ? _039_ : _038_;
  assign _041_ = ~((_037_ | _005_) & (_011_ | _040_));
  assign req[1] = _028_ ? _041_ : _036_;
  assign _042_ = _017_ | ~(reqi[2]);
  assign _043_ = ~(_042_ | empty);
  assign _044_ = _008_ | ~(tmp[2]);
  assign _045_ = ~tmp[2];
  assign _046_ = ~reqi[2];
  assign _047_ = _032_ ? _046_ : _045_;
  assign _048_ = ~((_044_ | _005_) & (_011_ | _047_));
  assign req[2] = _028_ ? _048_ : _043_;
  assign _049_ = _017_ | ~(reqi[3]);
  assign _050_ = ~(_049_ | empty);
  assign _051_ = _008_ | ~(tmp[3]);
  assign _052_ = ~tmp[3];
  assign _053_ = ~reqi[3];
  assign _054_ = _032_ ? _053_ : _052_;
  assign _055_ = ~((_051_ | _005_) & (_011_ | _054_));
  assign req[3] = _028_ ? _055_ : _050_;
  assign _056_ = ~ack;
  assign re = ~((_056_ | _011_) & _005_);
  always @(posedge clk)
      state[0] <= _001_;
  always @(posedge clk)
      state[1] <= _002_;
  always @(posedge clk)
      state[2] <= _003_;
  (* src = "ibsm.v:15" *)
  always @(posedge clk)
      tmp[0] <= _000_[0];
  (* src = "ibsm.v:15" *)
  always @(posedge clk)
      tmp[1] <= _000_[1];
  (* src = "ibsm.v:15" *)
  always @(posedge clk)
      tmp[2] <= _000_[2];
  (* src = "ibsm.v:15" *)
  always @(posedge clk)
      tmp[3] <= _000_[3];
endmodule
