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
  (* src = "ibsm.v:15" *)
  wire _057_;
  (* src = "ibsm.v:15" *)
  wire _058_;
  (* src = "ibsm.v:15" *)
  wire _059_;
  (* src = "ibsm.v:15" *)
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  (* src = "ibsm.v:5" *)
  wire _064_;
  (* src = "ibsm.v:8" *)
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  (* src = "ibsm.v:6" *)
  wire _092_;
  (* src = "ibsm.v:6" *)
  wire _093_;
  (* src = "ibsm.v:9" *)
  wire _094_;
  (* src = "ibsm.v:10" *)
  wire _095_;
  (* src = "ibsm.v:10" *)
  wire _096_;
  (* src = "ibsm.v:10" *)
  wire _097_;
  (* src = "ibsm.v:10" *)
  wire _098_;
  (* src = "ibsm.v:7" *)
  wire _099_;
  (* src = "ibsm.v:7" *)
  wire _100_;
  (* src = "ibsm.v:7" *)
  wire _101_;
  (* src = "ibsm.v:7" *)
  wire _102_;
  (* src = "ibsm.v:4" *)
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  (* src = "ibsm.v:13" *)
  wire _107_;
  (* src = "ibsm.v:13" *)
  wire _108_;
  (* src = "ibsm.v:13" *)
  wire _109_;
  (* src = "ibsm.v:13" *)
  wire _110_;
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
  wire [2:0] state;
  (* src = "ibsm.v:13" *)
  wire [3:0] tmp;
  INVX1 _111_ (
    .A(_105_),
    .Y(_066_)
  );
  INVX1 _112_ (
    .A(_104_),
    .Y(_067_)
  );
  INVX1 _113_ (
    .A(_065_),
    .Y(_068_)
  );
  INVX1 _114_ (
    .A(_092_),
    .Y(_069_)
  );
  INVX1 _115_ (
    .A(_064_),
    .Y(_070_)
  );
  INVX1 _116_ (
    .A(_107_),
    .Y(_071_)
  );
  INVX1 _117_ (
    .A(_099_),
    .Y(_072_)
  );
  INVX1 _118_ (
    .A(_108_),
    .Y(_073_)
  );
  INVX1 _119_ (
    .A(_100_),
    .Y(_074_)
  );
  INVX1 _120_ (
    .A(_109_),
    .Y(_075_)
  );
  INVX1 _121_ (
    .A(_101_),
    .Y(_076_)
  );
  INVX1 _122_ (
    .A(_110_),
    .Y(_077_)
  );
  INVX1 _123_ (
    .A(_102_),
    .Y(_078_)
  );
  NAND2X1 _124_ (
    .A(_093_),
    .B(_092_),
    .Y(_079_)
  );
  AOI21X1 _125_ (
    .A(_104_),
    .B(_065_),
    .C(_103_),
    .Y(_080_)
  );
  OAI21X1 _126_ (
    .A(_066_),
    .B(_079_),
    .C(_080_),
    .Y(_061_)
  );
  AOI22X1 _127_ (
    .A(_104_),
    .B(_068_),
    .C(_106_),
    .D(_070_),
    .Y(_081_)
  );
  NOR2X1 _128_ (
    .A(_103_),
    .B(_081_),
    .Y(_063_)
  );
  AOI22X1 _129_ (
    .A(_106_),
    .B(_064_),
    .C(_079_),
    .D(_105_),
    .Y(_082_)
  );
  NOR2X1 _130_ (
    .A(_103_),
    .B(_082_),
    .Y(_062_)
  );
  AND2X1 _131_ (
    .A(_093_),
    .B(_069_),
    .Y(_083_)
  );
  NAND2X1 _132_ (
    .A(_093_),
    .B(_069_),
    .Y(_084_)
  );
  NAND3X1 _133_ (
    .A(_093_),
    .B(_069_),
    .C(_106_),
    .Y(_085_)
  );
  OR2X1 _134_ (
    .A(_103_),
    .B(_085_),
    .Y(_086_)
  );
  AOI21X1 _135_ (
    .A(_067_),
    .B(_085_),
    .C(_103_),
    .Y(_087_)
  );
  OAI22X1 _136_ (
    .A(_072_),
    .B(_086_),
    .C(_087_),
    .D(_071_),
    .Y(_057_)
  );
  OAI22X1 _137_ (
    .A(_074_),
    .B(_086_),
    .C(_087_),
    .D(_073_),
    .Y(_058_)
  );
  OAI22X1 _138_ (
    .A(_076_),
    .B(_086_),
    .C(_087_),
    .D(_075_),
    .Y(_059_)
  );
  OAI22X1 _139_ (
    .A(_078_),
    .B(_086_),
    .C(_087_),
    .D(_077_),
    .Y(_060_)
  );
  NOR2X1 _140_ (
    .A(_105_),
    .B(_065_),
    .Y(_088_)
  );
  OAI21X1 _141_ (
    .A(_106_),
    .B(_088_),
    .C(_083_),
    .Y(_089_)
  );
  AOI22X1 _142_ (
    .A(_105_),
    .B(_079_),
    .C(_084_),
    .D(_106_),
    .Y(_090_)
  );
  OAI22X1 _143_ (
    .A(_072_),
    .B(_089_),
    .C(_090_),
    .D(_071_),
    .Y(_095_)
  );
  OAI22X1 _144_ (
    .A(_074_),
    .B(_089_),
    .C(_090_),
    .D(_073_),
    .Y(_096_)
  );
  OAI22X1 _145_ (
    .A(_076_),
    .B(_089_),
    .C(_090_),
    .D(_075_),
    .Y(_097_)
  );
  OAI22X1 _146_ (
    .A(_078_),
    .B(_089_),
    .C(_090_),
    .D(_077_),
    .Y(_098_)
  );
  AOI21X1 _147_ (
    .A(_106_),
    .B(_064_),
    .C(_105_),
    .Y(_091_)
  );
  INVX1 _148_ (
    .A(_091_),
    .Y(_094_)
  );
  DFFPOSX1 _149_ (
    .CLK(clk),
    .D(_001_),
    .Q(state[0])
  );
  DFFPOSX1 _150_ (
    .CLK(clk),
    .D(_002_),
    .Q(state[1])
  );
  DFFPOSX1 _151_ (
    .CLK(clk),
    .D(_003_),
    .Q(state[2])
  );
  (* src = "ibsm.v:15" *)
  DFFPOSX1 _152_ (
    .CLK(clk),
    .D(_000_[0]),
    .Q(tmp[0])
  );
  (* src = "ibsm.v:15" *)
  DFFPOSX1 _153_ (
    .CLK(clk),
    .D(_000_[1]),
    .Q(tmp[1])
  );
  (* src = "ibsm.v:15" *)
  DFFPOSX1 _154_ (
    .CLK(clk),
    .D(_000_[2]),
    .Q(tmp[2])
  );
  (* src = "ibsm.v:15" *)
  DFFPOSX1 _155_ (
    .CLK(clk),
    .D(_000_[3]),
    .Q(tmp[3])
  );
  assign _105_ = state[1];
  assign _104_ = state[0];
  assign _103_ = rst;
  assign _065_ = empty;
  assign _093_ = pkto[9];
  assign _092_ = pkto[8];
  assign _001_ = _061_;
  assign _106_ = state[2];
  assign _064_ = ack;
  assign _003_ = _063_;
  assign _002_ = _062_;
  assign _107_ = tmp[0];
  assign _099_ = reqi[0];
  assign _000_[0] = _057_;
  assign _108_ = tmp[1];
  assign _100_ = reqi[1];
  assign _000_[1] = _058_;
  assign _109_ = tmp[2];
  assign _101_ = reqi[2];
  assign _000_[2] = _059_;
  assign _110_ = tmp[3];
  assign _102_ = reqi[3];
  assign _000_[3] = _060_;
  assign req[0] = _095_;
  assign req[1] = _096_;
  assign req[2] = _097_;
  assign req[3] = _098_;
  assign re = _094_;
endmodule
