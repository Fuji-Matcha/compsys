/* Generated by Yosys 0.9 (git sha1 1979e0b1, i686-w64-mingw32.static-g++ 5.5.0 -Os) */

(* top =  1  *)
(* src = "ackor.v:1" *)
module ackor(ack0, ack1, ack2, ack3, ack);
  wire _00_;
  wire _01_;
  (* src = "ackor.v:2" *)
  wire _02_;
  (* src = "ackor.v:1" *)
  wire _03_;
  (* src = "ackor.v:1" *)
  wire _04_;
  (* src = "ackor.v:1" *)
  wire _05_;
  (* src = "ackor.v:1" *)
  wire _06_;
  wire _07_;
  wire _08_;
  (* src = "ackor.v:2" *)
  output ack;
  (* src = "ackor.v:1" *)
  input ack0;
  (* src = "ackor.v:1" *)
  input ack1;
  (* src = "ackor.v:1" *)
  input ack2;
  (* src = "ackor.v:1" *)
  input ack3;
  NOR2X1 _09_ (
    .A(_04_),
    .B(_03_),
    .Y(_07_)
  );
  NOR2X1 _10_ (
    .A(_05_),
    .B(_06_),
    .Y(_08_)
  );
  NAND2X1 _11_ (
    .A(_07_),
    .B(_08_),
    .Y(_02_)
  );
  assign _04_ = ack1;
  assign _03_ = ack0;
  assign _05_ = ack2;
  assign _06_ = ack3;
  assign ack = _02_;
endmodule
