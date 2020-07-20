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
  (* src = "arb.v:15" *)
  wire _059_;
  (* src = "arb.v:15" *)
  wire _060_;
  (* src = "arb.v:15" *)
  wire _061_;
  (* src = "arb.v:15" *)
  wire _062_;
  (* src = "arb.v:15" *)
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  (* src = "arb.v:11" *)
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
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  (* src = "arb.v:8" *)
  wire _106_;
  (* src = "arb.v:8" *)
  wire _107_;
  (* src = "arb.v:8" *)
  wire _108_;
  (* src = "arb.v:8" *)
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  (* src = "arb.v:7" *)
  wire _114_;
  (* src = "arb.v:9" *)
  output ack0;
  (* src = "arb.v:9" *)
  output ack1;
  (* src = "arb.v:9" *)
  output ack2;
  (* src = "arb.v:9" *)
  output ack3;
  (* src = "arb.v:11" *)
  wire check;
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
  wire [3:0] round;
  (* src = "arb.v:7" *)
  input rst;
  INVX1 _115_ (
    .A(_112_),
    .Y(_069_)
  );
  INVX1 _116_ (
    .A(_114_),
    .Y(_070_)
  );
  INVX1 _117_ (
    .A(_106_),
    .Y(_071_)
  );
  INVX1 _118_ (
    .A(_110_),
    .Y(_072_)
  );
  INVX1 _119_ (
    .A(_113_),
    .Y(_073_)
  );
  INVX1 _120_ (
    .A(_111_),
    .Y(_074_)
  );
  NOR2X1 _121_ (
    .A(_107_),
    .B(_106_),
    .Y(_075_)
  );
  NOR2X1 _122_ (
    .A(_108_),
    .B(_109_),
    .Y(_076_)
  );
  NAND3X1 _123_ (
    .A(_068_),
    .B(_075_),
    .C(_076_),
    .Y(_077_)
  );
  AND2X1 _124_ (
    .A(_070_),
    .B(_077_),
    .Y(_078_)
  );
  NAND2X1 _125_ (
    .A(_070_),
    .B(_077_),
    .Y(_079_)
  );
  NOR2X1 _126_ (
    .A(_114_),
    .B(_077_),
    .Y(_080_)
  );
  OR2X1 _127_ (
    .A(_114_),
    .B(_077_),
    .Y(_081_)
  );
  OAI22X1 _128_ (
    .A(_074_),
    .B(_079_),
    .C(_081_),
    .D(_069_),
    .Y(_065_)
  );
  OAI22X1 _129_ (
    .A(_069_),
    .B(_079_),
    .C(_081_),
    .D(_072_),
    .Y(_066_)
  );
  OAI22X1 _130_ (
    .A(_073_),
    .B(_079_),
    .C(_081_),
    .D(_074_),
    .Y(_067_)
  );
  AOI22X1 _131_ (
    .A(_072_),
    .B(_078_),
    .C(_080_),
    .D(_073_),
    .Y(_064_)
  );
  OR2X1 _132_ (
    .A(_075_),
    .B(_076_),
    .Y(_082_)
  );
  AOI22X1 _133_ (
    .A(_107_),
    .B(_106_),
    .C(_109_),
    .D(_108_),
    .Y(_083_)
  );
  INVX1 _134_ (
    .A(_083_),
    .Y(_084_)
  );
  NOR2X1 _135_ (
    .A(_068_),
    .B(_084_),
    .Y(_085_)
  );
  AOI21X1 _136_ (
    .A(_082_),
    .B(_085_),
    .C(_079_),
    .Y(_063_)
  );
  NOR2X1 _137_ (
    .A(_112_),
    .B(_111_),
    .Y(_086_)
  );
  NAND2X1 _138_ (
    .A(_106_),
    .B(_086_),
    .Y(_087_)
  );
  AOI21X1 _139_ (
    .A(_107_),
    .B(_074_),
    .C(_108_),
    .Y(_088_)
  );
  AOI21X1 _140_ (
    .A(_087_),
    .B(_088_),
    .C(_113_),
    .Y(_089_)
  );
  NAND2X1 _141_ (
    .A(_070_),
    .B(_109_),
    .Y(_090_)
  );
  NOR2X1 _142_ (
    .A(_089_),
    .B(_090_),
    .Y(_062_)
  );
  NOR2X1 _143_ (
    .A(_106_),
    .B(_109_),
    .Y(_091_)
  );
  OR2X1 _144_ (
    .A(_106_),
    .B(_113_),
    .Y(_092_)
  );
  OAI21X1 _145_ (
    .A(_106_),
    .B(_113_),
    .C(_086_),
    .Y(_093_)
  );
  NAND2X1 _146_ (
    .A(_073_),
    .B(_086_),
    .Y(_094_)
  );
  NOR2X1 _147_ (
    .A(_091_),
    .B(_093_),
    .Y(_095_)
  );
  AOI21X1 _148_ (
    .A(_107_),
    .B(_074_),
    .C(_114_),
    .Y(_096_)
  );
  NAND2X1 _149_ (
    .A(_108_),
    .B(_096_),
    .Y(_097_)
  );
  NOR2X1 _150_ (
    .A(_095_),
    .B(_097_),
    .Y(_061_)
  );
  OAI21X1 _151_ (
    .A(_108_),
    .B(_074_),
    .C(_073_),
    .Y(_098_)
  );
  OAI21X1 _152_ (
    .A(_111_),
    .B(_092_),
    .C(_069_),
    .Y(_099_)
  );
  AOI21X1 _153_ (
    .A(_091_),
    .B(_098_),
    .C(_099_),
    .Y(_100_)
  );
  NAND2X1 _154_ (
    .A(_070_),
    .B(_107_),
    .Y(_101_)
  );
  NOR2X1 _155_ (
    .A(_100_),
    .B(_101_),
    .Y(_060_)
  );
  NOR3X1 _156_ (
    .A(_069_),
    .B(_108_),
    .C(_107_),
    .Y(_102_)
  );
  NOR2X1 _157_ (
    .A(_071_),
    .B(_109_),
    .Y(_103_)
  );
  OAI21X1 _158_ (
    .A(_098_),
    .B(_102_),
    .C(_103_),
    .Y(_104_)
  );
  OAI21X1 _159_ (
    .A(_106_),
    .B(_094_),
    .C(_070_),
    .Y(_105_)
  );
  AOI21X1 _160_ (
    .A(_094_),
    .B(_104_),
    .C(_105_),
    .Y(_059_)
  );
  DFFPOSX1 _161_ (
    .CLK(clk),
    .D(_005_),
    .Q(round[0])
  );
  DFFPOSX1 _162_ (
    .CLK(clk),
    .D(_006_),
    .Q(round[1])
  );
  DFFPOSX1 _163_ (
    .CLK(clk),
    .D(_007_),
    .Q(round[2])
  );
  DFFPOSX1 _164_ (
    .CLK(clk),
    .D(_008_),
    .Q(round[3])
  );
  (* src = "arb.v:15" *)
  DFFPOSX1 _165_ (
    .CLK(clk),
    .D(_000_),
    .Q(ack0)
  );
  (* src = "arb.v:15" *)
  DFFPOSX1 _166_ (
    .CLK(clk),
    .D(_001_),
    .Q(ack1)
  );
  (* src = "arb.v:15" *)
  DFFPOSX1 _167_ (
    .CLK(clk),
    .D(_002_),
    .Q(ack2)
  );
  (* src = "arb.v:15" *)
  DFFPOSX1 _168_ (
    .CLK(clk),
    .D(_003_),
    .Q(ack3)
  );
  (* src = "arb.v:15" *)
  DFFPOSX1 _169_ (
    .CLK(clk),
    .D(_004_),
    .Q(check)
  );
  assign _112_ = round[2];
  assign _114_ = rst;
  assign _108_ = req2;
  assign _107_ = req1;
  assign _106_ = req0;
  assign _109_ = req3;
  assign _068_ = check;
  assign _006_ = _065_;
  assign _110_ = round[0];
  assign _007_ = _066_;
  assign _113_ = round[3];
  assign _008_ = _067_;
  assign _005_ = _064_;
  assign _004_ = _063_;
  assign _111_ = round[1];
  assign _003_ = _062_;
  assign _002_ = _061_;
  assign _001_ = _060_;
  assign _000_ = _059_;
endmodule
