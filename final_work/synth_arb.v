/* Generated by Yosys 0.9 (git sha1 1979e0b1, i686-w64-mingw32.static-g++ 5.5.0 -Os) */

(* top =  1  *)
(* src = "arb.v:7" *)
module arb(clk, rst, req0, req1, req2, req3, ack0, ack1, ack2, ack3);
  (* src = "arb.v:15" *)
  wire _000_;
  (* src = "arb.v:15" *)
  wire _001_;
  (* src = "arb.v:15" *)
  wire _002_;
  (* src = "arb.v:15" *)
  wire _003_;
  (* src = "arb.v:15" *)
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
  wire _057_;
  wire _058_;
  (* src = "arb.v:9" *)
  output ack0;
  reg ack0;
  (* src = "arb.v:9" *)
  output ack1;
  reg ack1;
  (* src = "arb.v:9" *)
  output ack2;
  reg ack2;
  (* src = "arb.v:9" *)
  output ack3;
  reg ack3;
  (* src = "arb.v:11" *)
  reg check;
  (* src = "arb.v:7" *)
  input clk;
  (* src = "arb.v:8" *)
  input req0;
  (* src = "arb.v:8" *)
  input req1;
  (* src = "arb.v:8" *)
  input req2;
  (* src = "arb.v:8" *)
  input req3;
  (* onehot = 32'd1 *)
  reg [3:0] round;
  (* src = "arb.v:7" *)
  input rst;
  assign _009_ = ~round[1];
  assign _010_ = ~round[2];
  assign _011_ = ~rst;
  assign _012_ = ~req2;
  assign _013_ = req1 | req0;
  assign _014_ = _013_ | ~(_012_);
  assign _015_ = ~(_014_ | req3);
  assign _016_ = ~(_015_ & check);
  assign _017_ = ~(_016_ & _011_);
  assign _018_ = _016_ | ~(_011_);
  assign _006_ = ~((_017_ | _009_) & (_010_ | _018_));
  assign _019_ = ~round[0];
  assign _007_ = ~((_017_ | _010_) & (_019_ | _018_));
  assign _020_ = ~round[3];
  assign _008_ = ~((_017_ | _020_) & (_009_ | _018_));
  assign _021_ = ~((_017_ | _019_) & (_020_ | _018_));
  assign _005_ = _021_ | ~(_011_);
  assign _022_ = ~(req3 ^ req2);
  assign _023_ = ~(_022_ ^ req1);
  assign _024_ = ~req3;
  assign _025_ = _022_ | ~(req1);
  assign _026_ = ~((_024_ | _012_) & _025_);
  assign _027_ = ~((_023_ & req0) | _026_);
  assign _028_ = check ? _015_ : _027_;
  assign _004_ = ~(_028_ | rst);
  assign _029_ = ~req0;
  assign _030_ = req2 | ~(req3);
  assign _031_ = ~(_030_ | req1);
  assign _032_ = ~(_031_ & _029_);
  assign _033_ = round[1] | round[3];
  assign _034_ = ~(_033_ | round[2]);
  assign _035_ = ~_034_;
  assign _036_ = ~((_024_ | _020_) & (_009_ | _030_));
  assign _037_ = ~((_031_ & round[2]) | _036_);
  assign _038_ = _034_ ? _032_ : _037_;
  assign _003_ = ~(_038_ | rst);
  assign _039_ = req1 | ~(req2);
  assign _040_ = _039_ | ~(_029_);
  assign _041_ = _040_ | ~(_034_);
  assign _042_ = _040_ | ~(_024_);
  assign _043_ = ~((_012_ | _009_) & (_020_ | _042_));
  assign _044_ = ~(_039_ | _010_);
  assign _045_ = ~((_044_ | _043_) & _035_);
  assign _002_ = ~((_045_ & _041_) | rst);
  assign _046_ = req0 | ~(req1);
  assign _047_ = _046_ | ~(_034_);
  assign _048_ = _046_ | ~(_024_);
  assign _049_ = _048_ | ~(_012_);
  assign _050_ = ~((_048_ | _020_) & (_009_ | _049_));
  assign _051_ = req1 & round[2];
  assign _052_ = ~((_051_ | _050_) & _035_);
  assign _001_ = ~((_052_ & _047_) | rst);
  assign _053_ = req3 | ~(req0);
  assign _054_ = _053_ | ~(_012_);
  assign _055_ = ~((_053_ | _020_) & (_009_ | _054_));
  assign _056_ = ~(_054_ | req1);
  assign _057_ = ~((_056_ & round[2]) | _055_);
  assign _058_ = _034_ ? _029_ : _057_;
  assign _000_ = ~(_058_ | rst);
  always @(posedge clk)
      round[0] <= _005_;
  always @(posedge clk)
      round[1] <= _006_;
  always @(posedge clk)
      round[2] <= _007_;
  always @(posedge clk)
      round[3] <= _008_;
  (* src = "arb.v:15" *)
  always @(posedge clk)
      ack0 <= _000_;
  (* src = "arb.v:15" *)
  always @(posedge clk)
      ack1 <= _001_;
  (* src = "arb.v:15" *)
  always @(posedge clk)
      ack2 <= _002_;
  (* src = "arb.v:15" *)
  always @(posedge clk)
      ack3 <= _003_;
  (* src = "arb.v:15" *)
  always @(posedge clk)
      check <= _004_;
endmodule