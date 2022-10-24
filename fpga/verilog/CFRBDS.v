// Generator : SpinalHDL v1.7.2    git head : 08fc866bebdc40c471ebe327bface63e34406489
// Component : CFRBDS
// Git hash  : 58b077ee7fbb6f801e51affc7441b8858890cae4

`timescale 1ns/1ps

module CFRBDS (
  input      [15:0]   io_d_d,
  output              io_v,
  input               io_flush,
  input               clk,
  input               reset
);

  wire       [26:0]   bu_0_io_d_d;
  wire       [26:0]   bu_1_io_d_d;
  wire       [26:0]   bu_2_io_d_d;
  wire       [26:0]   bu_3_io_d_d;
  wire       [26:0]   bu_4_io_d_d;
  wire       [17:0]   bu_0_io_q_d;
  wire       [17:0]   bu_1_io_q_d;
  wire       [17:0]   bu_2_io_q_d;
  wire       [17:0]   bu_3_io_q_d;
  wire       [17:0]   bu_4_io_q_d;
  wire       [21:0]   _zz__zz_io_d_d;
  wire       [5:0]    _zz__zz_io_d_d_1;
  wire       [24:0]   _zz_io_d_d_1;
  wire       [6:0]    _zz_io_d_d_2;
  wire       [24:0]   _zz_io_d_d_3;
  wire       [6:0]    _zz_io_d_d_4;
  wire       [24:0]   _zz_io_d_d_5;
  wire       [24:0]   _zz_io_d_d_6;
  wire       [17:0]   _zz_v;
  wire                v;
  reg        [24:0]   _zz_io_d_d;

  assign _zz__zz_io_d_d = ($signed(io_d_d) * $signed(_zz__zz_io_d_d_1));
  assign _zz__zz_io_d_d_1 = 6'h16;
  assign _zz_io_d_d_1 = ($signed(bu_0_io_q_d) * $signed(_zz_io_d_d_2));
  assign _zz_io_d_d_2 = 7'h20;
  assign _zz_io_d_d_3 = ($signed(bu_1_io_q_d) * $signed(_zz_io_d_d_4));
  assign _zz_io_d_d_4 = 7'h20;
  assign _zz_io_d_d_5 = ({7'd0,bu_2_io_q_d} <<< 7);
  assign _zz_io_d_d_6 = ({7'd0,bu_3_io_q_d} <<< 7);
  assign _zz_v = 18'h0;
  CFRBUnit bu_0 (
    .io_d_d   (bu_0_io_d_d[26:0]), //i
    .io_q_d   (bu_0_io_q_d[17:0]), //o
    .io_v     (v                ), //i
    .io_flush (io_flush         ), //i
    .clk      (clk              ), //i
    .reset    (reset            )  //i
  );
  CFRBUnit_1 bu_1 (
    .io_d_d   (bu_1_io_d_d[26:0]), //i
    .io_q_d   (bu_1_io_q_d[17:0]), //o
    .io_v     (v                ), //i
    .io_flush (io_flush         ), //i
    .clk      (clk              ), //i
    .reset    (reset            )  //i
  );
  CFRBUnit_2 bu_2 (
    .io_d_d   (bu_2_io_d_d[26:0]), //i
    .io_q_d   (bu_2_io_q_d[17:0]), //o
    .io_v     (v                ), //i
    .io_flush (io_flush         ), //i
    .clk      (clk              ), //i
    .reset    (reset            )  //i
  );
  CFRBUnit_3 bu_3 (
    .io_d_d   (bu_3_io_d_d[26:0]), //i
    .io_q_d   (bu_3_io_q_d[17:0]), //o
    .io_v     (v                ), //i
    .io_flush (io_flush         ), //i
    .clk      (clk              ), //i
    .reset    (reset            )  //i
  );
  CFRBUnit_4 bu_4 (
    .io_d_d   (bu_4_io_d_d[26:0]), //i
    .io_q_d   (bu_4_io_q_d[17:0]), //o
    .io_v     (v                ), //i
    .io_flush (io_flush         ), //i
    .clk      (clk              ), //i
    .reset    (reset            )  //i
  );
  assign io_v = v;
  assign bu_0_io_d_d = {{2{_zz_io_d_d[24]}}, _zz_io_d_d};
  assign bu_1_io_d_d = {{2{_zz_io_d_d_1[24]}}, _zz_io_d_d_1};
  assign bu_2_io_d_d = {{2{_zz_io_d_d_3[24]}}, _zz_io_d_d_3};
  assign bu_3_io_d_d = {{2{_zz_io_d_d_5[24]}}, _zz_io_d_d_5};
  assign bu_4_io_d_d = {{2{_zz_io_d_d_6[24]}}, _zz_io_d_d_6};
  assign v = ($signed(bu_4_io_q_d) < $signed(_zz_v));
  always @(posedge clk) begin
    _zz_io_d_d <= {{3{_zz__zz_io_d_d[21]}}, _zz__zz_io_d_d};
  end


endmodule

module CFRBUnit_4 (
  input      [26:0]   io_d_d,
  output     [17:0]   io_q_d,
  input               io_v,
  input               io_flush,
  input               clk,
  input               reset
);

  wire       [17:0]   _zz__zz_io_q_d_2;
  wire       [26:0]   _zz__zz_io_q_d_2_1;
  wire       [26:0]   _zz__zz_io_q_d_2_2;
  wire       [26:0]   _zz__zz_io_q_d_2_3;
  wire       [24:0]   _zz__zz_io_q_d_2_4;
  wire       [24:0]   _zz__zz_io_q_d_2_5;
  wire       [24:0]   _zz__zz_io_q_d_2_6;
  wire       [26:0]   _zz__zz_io_q_d_2_7;
  wire       [20:0]   _zz__zz_io_q_d_2_8;
  wire       [2:0]    _zz__zz_io_q_d_2_9;
  wire       [17:0]   _zz__zz_io_q_d_1;
  wire       [26:0]   _zz__zz_io_q_d_1_1;
  wire       [26:0]   _zz__zz_io_q_d_1_2;
  wire       [25:0]   _zz__zz_io_q_d_1_3;
  wire       [26:0]   _zz__zz_io_q_d_1_4;
  wire       [24:0]   _zz__zz_io_q_d_1_5;
  wire       [24:0]   _zz__zz_io_q_d_1_6;
  wire       [24:0]   _zz__zz_io_q_d_1_7;
  reg        [17:0]   _zz_io_q_d;
  reg        [17:0]   _zz_io_q_d_1;
  wire       [17:0]   _zz_io_q_d_2;

  assign _zz__zz_io_q_d_2_1 = ($signed(_zz__zz_io_q_d_2_2) - $signed(_zz__zz_io_q_d_2_7));
  assign _zz__zz_io_q_d_2 = _zz__zz_io_q_d_2_1[26 : 9];
  assign _zz__zz_io_q_d_2_2 = ($signed(io_d_d) - $signed(_zz__zz_io_q_d_2_3));
  assign _zz__zz_io_q_d_2_4 = (io_v ? _zz__zz_io_q_d_2_5 : _zz__zz_io_q_d_2_6);
  assign _zz__zz_io_q_d_2_3 = {{2{_zz__zz_io_q_d_2_4[24]}}, _zz__zz_io_q_d_2_4};
  assign _zz__zz_io_q_d_2_5 = 25'h1520000;
  assign _zz__zz_io_q_d_2_6 = 25'h0ae0000;
  assign _zz__zz_io_q_d_2_8 = ($signed(_zz_io_q_d_1) * $signed(_zz__zz_io_q_d_2_9));
  assign _zz__zz_io_q_d_2_7 = {{6{_zz__zz_io_q_d_2_8[20]}}, _zz__zz_io_q_d_2_8};
  assign _zz__zz_io_q_d_2_9 = 3'b011;
  assign _zz__zz_io_q_d_1_1 = ($signed(_zz__zz_io_q_d_1_2) - $signed(_zz__zz_io_q_d_1_4));
  assign _zz__zz_io_q_d_1 = _zz__zz_io_q_d_1_1[26 : 9];
  assign _zz__zz_io_q_d_1_3 = ({8'd0,_zz_io_q_d_2} <<< 8);
  assign _zz__zz_io_q_d_1_2 = {{1{_zz__zz_io_q_d_1_3[25]}}, _zz__zz_io_q_d_1_3};
  assign _zz__zz_io_q_d_1_5 = (io_v ? _zz__zz_io_q_d_1_6 : _zz__zz_io_q_d_1_7);
  assign _zz__zz_io_q_d_1_4 = {{2{_zz__zz_io_q_d_1_5[24]}}, _zz__zz_io_q_d_1_5};
  assign _zz__zz_io_q_d_1_6 = 25'h13d0000;
  assign _zz__zz_io_q_d_1_7 = 25'h0c30000;
  assign _zz_io_q_d_2 = ($signed(_zz_io_q_d) + $signed(_zz__zz_io_q_d_2));
  assign io_q_d = _zz_io_q_d_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_io_q_d <= 18'h0;
      _zz_io_q_d_1 <= 18'h0;
    end else begin
      if(io_flush) begin
        _zz_io_q_d <= 18'h0;
        _zz_io_q_d_1 <= 18'h0;
      end else begin
        _zz_io_q_d_1 <= ($signed(_zz_io_q_d_1) + $signed(_zz__zz_io_q_d_1));
        _zz_io_q_d <= _zz_io_q_d_2;
      end
    end
  end


endmodule

module CFRBUnit_3 (
  input      [26:0]   io_d_d,
  output     [17:0]   io_q_d,
  input               io_v,
  input               io_flush,
  input               clk,
  input               reset
);

  wire       [17:0]   _zz__zz_io_q_d_2;
  wire       [26:0]   _zz__zz_io_q_d_2_1;
  wire       [26:0]   _zz__zz_io_q_d_2_2;
  wire       [26:0]   _zz__zz_io_q_d_2_3;
  wire       [24:0]   _zz__zz_io_q_d_2_4;
  wire       [24:0]   _zz__zz_io_q_d_2_5;
  wire       [24:0]   _zz__zz_io_q_d_2_6;
  wire       [26:0]   _zz__zz_io_q_d_2_7;
  wire       [21:0]   _zz__zz_io_q_d_2_8;
  wire       [3:0]    _zz__zz_io_q_d_2_9;
  wire       [17:0]   _zz__zz_io_q_d_1;
  wire       [26:0]   _zz__zz_io_q_d_1_1;
  wire       [26:0]   _zz__zz_io_q_d_1_2;
  wire       [24:0]   _zz__zz_io_q_d_1_3;
  wire       [26:0]   _zz__zz_io_q_d_1_4;
  wire       [24:0]   _zz__zz_io_q_d_1_5;
  wire       [24:0]   _zz__zz_io_q_d_1_6;
  wire       [24:0]   _zz__zz_io_q_d_1_7;
  reg        [17:0]   _zz_io_q_d;
  reg        [17:0]   _zz_io_q_d_1;
  wire       [17:0]   _zz_io_q_d_2;

  assign _zz__zz_io_q_d_2_1 = ($signed(_zz__zz_io_q_d_2_2) - $signed(_zz__zz_io_q_d_2_7));
  assign _zz__zz_io_q_d_2 = _zz__zz_io_q_d_2_1[26 : 9];
  assign _zz__zz_io_q_d_2_2 = ($signed(io_d_d) - $signed(_zz__zz_io_q_d_2_3));
  assign _zz__zz_io_q_d_2_4 = (io_v ? _zz__zz_io_q_d_2_5 : _zz__zz_io_q_d_2_6);
  assign _zz__zz_io_q_d_2_3 = {{2{_zz__zz_io_q_d_2_4[24]}}, _zz__zz_io_q_d_2_4};
  assign _zz__zz_io_q_d_2_5 = 25'h1840000;
  assign _zz__zz_io_q_d_2_6 = 25'h07c0000;
  assign _zz__zz_io_q_d_2_8 = ($signed(_zz_io_q_d_1) * $signed(_zz__zz_io_q_d_2_9));
  assign _zz__zz_io_q_d_2_7 = {{5{_zz__zz_io_q_d_2_8[21]}}, _zz__zz_io_q_d_2_8};
  assign _zz__zz_io_q_d_2_9 = 4'b0101;
  assign _zz__zz_io_q_d_1_1 = ($signed(_zz__zz_io_q_d_1_2) - $signed(_zz__zz_io_q_d_1_4));
  assign _zz__zz_io_q_d_1 = _zz__zz_io_q_d_1_1[26 : 9];
  assign _zz__zz_io_q_d_1_3 = ({7'd0,_zz_io_q_d_2} <<< 7);
  assign _zz__zz_io_q_d_1_2 = {{2{_zz__zz_io_q_d_1_3[24]}}, _zz__zz_io_q_d_1_3};
  assign _zz__zz_io_q_d_1_5 = (io_v ? _zz__zz_io_q_d_1_6 : _zz__zz_io_q_d_1_7);
  assign _zz__zz_io_q_d_1_4 = {{2{_zz__zz_io_q_d_1_5[24]}}, _zz__zz_io_q_d_1_5};
  assign _zz__zz_io_q_d_1_6 = 25'h1600000;
  assign _zz__zz_io_q_d_1_7 = 25'h0a00000;
  assign _zz_io_q_d_2 = ($signed(_zz_io_q_d) + $signed(_zz__zz_io_q_d_2));
  assign io_q_d = _zz_io_q_d_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_io_q_d <= 18'h0;
      _zz_io_q_d_1 <= 18'h0;
    end else begin
      if(io_flush) begin
        _zz_io_q_d <= 18'h0;
        _zz_io_q_d_1 <= 18'h0;
      end else begin
        _zz_io_q_d_1 <= ($signed(_zz_io_q_d_1) + $signed(_zz__zz_io_q_d_1));
        _zz_io_q_d <= _zz_io_q_d_2;
      end
    end
  end


endmodule

module CFRBUnit_2 (
  input      [26:0]   io_d_d,
  output     [17:0]   io_q_d,
  input               io_v,
  input               io_flush,
  input               clk,
  input               reset
);

  wire       [17:0]   _zz__zz_io_q_d_2;
  wire       [26:0]   _zz__zz_io_q_d_2_1;
  wire       [26:0]   _zz__zz_io_q_d_2_2;
  wire       [26:0]   _zz__zz_io_q_d_2_3;
  wire       [24:0]   _zz__zz_io_q_d_2_4;
  wire       [24:0]   _zz__zz_io_q_d_2_5;
  wire       [24:0]   _zz__zz_io_q_d_2_6;
  wire       [26:0]   _zz__zz_io_q_d_2_7;
  wire       [21:0]   _zz__zz_io_q_d_2_8;
  wire       [3:0]    _zz__zz_io_q_d_2_9;
  wire       [17:0]   _zz__zz_io_q_d_1;
  wire       [26:0]   _zz__zz_io_q_d_1_1;
  wire       [26:0]   _zz__zz_io_q_d_1_2;
  wire       [23:0]   _zz__zz_io_q_d_1_3;
  wire       [26:0]   _zz__zz_io_q_d_1_4;
  wire       [24:0]   _zz__zz_io_q_d_1_5;
  wire       [24:0]   _zz__zz_io_q_d_1_6;
  wire       [24:0]   _zz__zz_io_q_d_1_7;
  reg        [17:0]   _zz_io_q_d;
  reg        [17:0]   _zz_io_q_d_1;
  wire       [17:0]   _zz_io_q_d_2;

  assign _zz__zz_io_q_d_2_1 = ($signed(_zz__zz_io_q_d_2_2) - $signed(_zz__zz_io_q_d_2_7));
  assign _zz__zz_io_q_d_2 = _zz__zz_io_q_d_2_1[26 : 9];
  assign _zz__zz_io_q_d_2_2 = ($signed(io_d_d) - $signed(_zz__zz_io_q_d_2_3));
  assign _zz__zz_io_q_d_2_4 = (io_v ? _zz__zz_io_q_d_2_5 : _zz__zz_io_q_d_2_6);
  assign _zz__zz_io_q_d_2_3 = {{2{_zz__zz_io_q_d_2_4[24]}}, _zz__zz_io_q_d_2_4};
  assign _zz__zz_io_q_d_2_5 = 25'h1c90000;
  assign _zz__zz_io_q_d_2_6 = 25'h0370000;
  assign _zz__zz_io_q_d_2_8 = ($signed(_zz_io_q_d_1) * $signed(_zz__zz_io_q_d_2_9));
  assign _zz__zz_io_q_d_2_7 = {{5{_zz__zz_io_q_d_2_8[21]}}, _zz__zz_io_q_d_2_8};
  assign _zz__zz_io_q_d_2_9 = 4'b0101;
  assign _zz__zz_io_q_d_1_1 = ($signed(_zz__zz_io_q_d_1_2) - $signed(_zz__zz_io_q_d_1_4));
  assign _zz__zz_io_q_d_1 = _zz__zz_io_q_d_1_1[26 : 9];
  assign _zz__zz_io_q_d_1_3 = ({6'd0,_zz_io_q_d_2} <<< 6);
  assign _zz__zz_io_q_d_1_2 = {{3{_zz__zz_io_q_d_1_3[23]}}, _zz__zz_io_q_d_1_3};
  assign _zz__zz_io_q_d_1_5 = (io_v ? _zz__zz_io_q_d_1_6 : _zz__zz_io_q_d_1_7);
  assign _zz__zz_io_q_d_1_4 = {{2{_zz__zz_io_q_d_1_5[24]}}, _zz__zz_io_q_d_1_5};
  assign _zz__zz_io_q_d_1_6 = 25'h1bd0000;
  assign _zz__zz_io_q_d_1_7 = 25'h0430000;
  assign _zz_io_q_d_2 = ($signed(_zz_io_q_d) + $signed(_zz__zz_io_q_d_2));
  assign io_q_d = _zz_io_q_d_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_io_q_d <= 18'h0;
      _zz_io_q_d_1 <= 18'h0;
    end else begin
      if(io_flush) begin
        _zz_io_q_d <= 18'h0;
        _zz_io_q_d_1 <= 18'h0;
      end else begin
        _zz_io_q_d_1 <= ($signed(_zz_io_q_d_1) + $signed(_zz__zz_io_q_d_1));
        _zz_io_q_d <= _zz_io_q_d_2;
      end
    end
  end


endmodule

module CFRBUnit_1 (
  input      [26:0]   io_d_d,
  output     [17:0]   io_q_d,
  input               io_v,
  input               io_flush,
  input               clk,
  input               reset
);

  wire       [17:0]   _zz__zz_io_q_d_2;
  wire       [26:0]   _zz__zz_io_q_d_2_1;
  wire       [26:0]   _zz__zz_io_q_d_2_2;
  wire       [26:0]   _zz__zz_io_q_d_2_3;
  wire       [24:0]   _zz__zz_io_q_d_2_4;
  wire       [24:0]   _zz__zz_io_q_d_2_5;
  wire       [24:0]   _zz__zz_io_q_d_2_6;
  wire       [26:0]   _zz__zz_io_q_d_2_7;
  wire       [20:0]   _zz__zz_io_q_d_2_8;
  wire       [2:0]    _zz__zz_io_q_d_2_9;
  wire       [17:0]   _zz__zz_io_q_d_1;
  wire       [26:0]   _zz__zz_io_q_d_1_1;
  wire       [26:0]   _zz__zz_io_q_d_1_2;
  wire       [24:0]   _zz__zz_io_q_d_1_3;
  wire       [6:0]    _zz__zz_io_q_d_1_4;
  wire       [26:0]   _zz__zz_io_q_d_1_5;
  wire       [24:0]   _zz__zz_io_q_d_1_6;
  wire       [24:0]   _zz__zz_io_q_d_1_7;
  wire       [24:0]   _zz__zz_io_q_d_1_8;
  reg        [17:0]   _zz_io_q_d;
  reg        [17:0]   _zz_io_q_d_1;
  wire       [17:0]   _zz_io_q_d_2;

  assign _zz__zz_io_q_d_2_1 = ($signed(_zz__zz_io_q_d_2_2) - $signed(_zz__zz_io_q_d_2_7));
  assign _zz__zz_io_q_d_2 = _zz__zz_io_q_d_2_1[26 : 9];
  assign _zz__zz_io_q_d_2_2 = ($signed(io_d_d) - $signed(_zz__zz_io_q_d_2_3));
  assign _zz__zz_io_q_d_2_4 = (io_v ? _zz__zz_io_q_d_2_5 : _zz__zz_io_q_d_2_6);
  assign _zz__zz_io_q_d_2_3 = {{2{_zz__zz_io_q_d_2_4[24]}}, _zz__zz_io_q_d_2_4};
  assign _zz__zz_io_q_d_2_5 = 25'h1cd0000;
  assign _zz__zz_io_q_d_2_6 = 25'h0330000;
  assign _zz__zz_io_q_d_2_8 = ($signed(_zz_io_q_d_1) * $signed(_zz__zz_io_q_d_2_9));
  assign _zz__zz_io_q_d_2_7 = {{6{_zz__zz_io_q_d_2_8[20]}}, _zz__zz_io_q_d_2_8};
  assign _zz__zz_io_q_d_2_9 = 3'b011;
  assign _zz__zz_io_q_d_1_1 = ($signed(_zz__zz_io_q_d_1_2) - $signed(_zz__zz_io_q_d_1_5));
  assign _zz__zz_io_q_d_1 = _zz__zz_io_q_d_1_1[26 : 9];
  assign _zz__zz_io_q_d_1_3 = ($signed(_zz_io_q_d_2) * $signed(_zz__zz_io_q_d_1_4));
  assign _zz__zz_io_q_d_1_2 = {{2{_zz__zz_io_q_d_1_3[24]}}, _zz__zz_io_q_d_1_3};
  assign _zz__zz_io_q_d_1_4 = 7'h20;
  assign _zz__zz_io_q_d_1_6 = (io_v ? _zz__zz_io_q_d_1_7 : _zz__zz_io_q_d_1_8);
  assign _zz__zz_io_q_d_1_5 = {{2{_zz__zz_io_q_d_1_6[24]}}, _zz__zz_io_q_d_1_6};
  assign _zz__zz_io_q_d_1_7 = 25'h1bb0000;
  assign _zz__zz_io_q_d_1_8 = 25'h0450000;
  assign _zz_io_q_d_2 = ($signed(_zz_io_q_d) + $signed(_zz__zz_io_q_d_2));
  assign io_q_d = _zz_io_q_d_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_io_q_d <= 18'h0;
      _zz_io_q_d_1 <= 18'h0;
    end else begin
      if(io_flush) begin
        _zz_io_q_d <= 18'h0;
        _zz_io_q_d_1 <= 18'h0;
      end else begin
        _zz_io_q_d_1 <= ($signed(_zz_io_q_d_1) + $signed(_zz__zz_io_q_d_1));
        _zz_io_q_d <= _zz_io_q_d_2;
      end
    end
  end


endmodule

module CFRBUnit (
  input      [26:0]   io_d_d,
  output     [17:0]   io_q_d,
  input               io_v,
  input               io_flush,
  input               clk,
  input               reset
);

  wire       [17:0]   _zz__zz_io_q_d;
  wire       [26:0]   _zz__zz_io_q_d_1;
  wire       [26:0]   _zz__zz_io_q_d_2;
  wire       [24:0]   _zz__zz_io_q_d_3;
  wire       [24:0]   _zz__zz_io_q_d_4;
  wire       [24:0]   _zz__zz_io_q_d_5;
  reg        [17:0]   _zz_io_q_d;

  assign _zz__zz_io_q_d_1 = ($signed(io_d_d) - $signed(_zz__zz_io_q_d_2));
  assign _zz__zz_io_q_d = _zz__zz_io_q_d_1[26 : 9];
  assign _zz__zz_io_q_d_3 = (io_v ? _zz__zz_io_q_d_4 : _zz__zz_io_q_d_5);
  assign _zz__zz_io_q_d_2 = {{2{_zz__zz_io_q_d_3[24]}}, _zz__zz_io_q_d_3};
  assign _zz__zz_io_q_d_4 = 25'h1ea0000;
  assign _zz__zz_io_q_d_5 = 25'h0160000;
  assign io_q_d = _zz_io_q_d;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_io_q_d <= 18'h0;
    end else begin
      if(io_flush) begin
        _zz_io_q_d <= 18'h0;
      end else begin
        _zz_io_q_d <= ($signed(_zz_io_q_d) + $signed(_zz__zz_io_q_d));
      end
    end
  end


endmodule
