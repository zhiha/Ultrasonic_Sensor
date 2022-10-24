// Generator : SpinalHDL v1.7.0a    git head : 150a9b9067020722818dfb17df4a23ac712a7af8
// Component : CRCCombinational
// Git hash  : a1ae4fcd432b732bf3280b97b2b7c4ac70cd6fe0

`timescale 1ns/1ps

module CRCCombinational (
  input               io_cmd_valid,
  input      [0:0]    io_cmd_payload_mode,
  input      [7:0]    io_cmd_payload_data,
  output     [31:0]   io_crc,
  input               clk,
  input               reset
);
  localparam CRCCombinationalCmdMode_INIT = 1'd0;
  localparam CRCCombinationalCmdMode_UPDATE = 1'd1;

  reg        [31:0]   crc_reg;
  reg        [7:0]    _zz_dataIn;
  wire       [7:0]    dataIn;
  reg        [31:0]   next_crc;
  wire                when_CRCCombinational_l100;
  wire                when_CRCCombinational_l105;
  reg        [31:0]   result_reflected;
  `ifndef SYNTHESIS
  reg [47:0] io_cmd_payload_mode_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(io_cmd_payload_mode)
      CRCCombinationalCmdMode_INIT : io_cmd_payload_mode_string = "INIT  ";
      CRCCombinationalCmdMode_UPDATE : io_cmd_payload_mode_string = "UPDATE";
      default : io_cmd_payload_mode_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    _zz_dataIn[0] = io_cmd_payload_data[7];
    _zz_dataIn[1] = io_cmd_payload_data[6];
    _zz_dataIn[2] = io_cmd_payload_data[5];
    _zz_dataIn[3] = io_cmd_payload_data[4];
    _zz_dataIn[4] = io_cmd_payload_data[3];
    _zz_dataIn[5] = io_cmd_payload_data[2];
    _zz_dataIn[6] = io_cmd_payload_data[1];
    _zz_dataIn[7] = io_cmd_payload_data[0];
  end

  assign dataIn[7 : 0] = _zz_dataIn[7 : 0];
  always @(*) begin
    next_crc[0] = (((dataIn[0] ^ dataIn[6]) ^ crc_reg[24]) ^ crc_reg[30]);
    next_crc[1] = (((((((dataIn[0] ^ dataIn[1]) ^ dataIn[6]) ^ dataIn[7]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[2] = (((((((((dataIn[0] ^ dataIn[1]) ^ dataIn[2]) ^ dataIn[6]) ^ dataIn[7]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[3] = (((((((dataIn[1] ^ dataIn[2]) ^ dataIn[3]) ^ dataIn[7]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[31]);
    next_crc[4] = (((((((((dataIn[0] ^ dataIn[2]) ^ dataIn[3]) ^ dataIn[4]) ^ dataIn[6]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[30]);
    next_crc[5] = (((((((((((((dataIn[0] ^ dataIn[1]) ^ dataIn[3]) ^ dataIn[4]) ^ dataIn[5]) ^ dataIn[6]) ^ dataIn[7]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[6] = (((((((((((dataIn[1] ^ dataIn[2]) ^ dataIn[4]) ^ dataIn[5]) ^ dataIn[6]) ^ dataIn[7]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[7] = (((((((((dataIn[0] ^ dataIn[2]) ^ dataIn[3]) ^ dataIn[5]) ^ dataIn[7]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[8] = ((((((((dataIn[0] ^ dataIn[1]) ^ dataIn[3]) ^ dataIn[4]) ^ crc_reg[0]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[27]) ^ crc_reg[28]);
    next_crc[9] = ((((((((dataIn[1] ^ dataIn[2]) ^ dataIn[4]) ^ dataIn[5]) ^ crc_reg[1]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[29]);
    next_crc[10] = ((((((((dataIn[0] ^ dataIn[2]) ^ dataIn[3]) ^ dataIn[5]) ^ crc_reg[2]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[29]);
    next_crc[11] = ((((((((dataIn[0] ^ dataIn[1]) ^ dataIn[3]) ^ dataIn[4]) ^ crc_reg[3]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[27]) ^ crc_reg[28]);
    next_crc[12] = ((((((((((((dataIn[0] ^ dataIn[1]) ^ dataIn[2]) ^ dataIn[4]) ^ dataIn[5]) ^ dataIn[6]) ^ crc_reg[4]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[30]);
    next_crc[13] = ((((((((((((dataIn[1] ^ dataIn[2]) ^ dataIn[3]) ^ dataIn[5]) ^ dataIn[6]) ^ dataIn[7]) ^ crc_reg[5]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[29]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[14] = ((((((((((dataIn[2] ^ dataIn[3]) ^ dataIn[4]) ^ dataIn[6]) ^ dataIn[7]) ^ crc_reg[6]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[15] = ((((((((dataIn[3] ^ dataIn[4]) ^ dataIn[5]) ^ dataIn[7]) ^ crc_reg[7]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[16] = ((((((dataIn[0] ^ dataIn[4]) ^ dataIn[5]) ^ crc_reg[8]) ^ crc_reg[24]) ^ crc_reg[28]) ^ crc_reg[29]);
    next_crc[17] = ((((((dataIn[1] ^ dataIn[5]) ^ dataIn[6]) ^ crc_reg[9]) ^ crc_reg[25]) ^ crc_reg[29]) ^ crc_reg[30]);
    next_crc[18] = ((((((dataIn[2] ^ dataIn[6]) ^ dataIn[7]) ^ crc_reg[10]) ^ crc_reg[26]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[19] = ((((dataIn[3] ^ dataIn[7]) ^ crc_reg[11]) ^ crc_reg[27]) ^ crc_reg[31]);
    next_crc[20] = ((dataIn[4] ^ crc_reg[12]) ^ crc_reg[28]);
    next_crc[21] = ((dataIn[5] ^ crc_reg[13]) ^ crc_reg[29]);
    next_crc[22] = ((dataIn[0] ^ crc_reg[14]) ^ crc_reg[24]);
    next_crc[23] = ((((((dataIn[0] ^ dataIn[1]) ^ dataIn[6]) ^ crc_reg[15]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[30]);
    next_crc[24] = ((((((dataIn[1] ^ dataIn[2]) ^ dataIn[7]) ^ crc_reg[16]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[31]);
    next_crc[25] = ((((dataIn[2] ^ dataIn[3]) ^ crc_reg[17]) ^ crc_reg[26]) ^ crc_reg[27]);
    next_crc[26] = ((((((((dataIn[0] ^ dataIn[3]) ^ dataIn[4]) ^ dataIn[6]) ^ crc_reg[18]) ^ crc_reg[24]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[30]);
    next_crc[27] = ((((((((dataIn[1] ^ dataIn[4]) ^ dataIn[5]) ^ dataIn[7]) ^ crc_reg[19]) ^ crc_reg[25]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[28] = ((((((dataIn[2] ^ dataIn[5]) ^ dataIn[6]) ^ crc_reg[20]) ^ crc_reg[26]) ^ crc_reg[29]) ^ crc_reg[30]);
    next_crc[29] = ((((((dataIn[3] ^ dataIn[6]) ^ dataIn[7]) ^ crc_reg[21]) ^ crc_reg[27]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[30] = ((((dataIn[4] ^ dataIn[7]) ^ crc_reg[22]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[31] = ((dataIn[5] ^ crc_reg[23]) ^ crc_reg[29]);
  end

  assign when_CRCCombinational_l100 = (io_cmd_valid && (io_cmd_payload_mode == CRCCombinationalCmdMode_INIT));
  assign when_CRCCombinational_l105 = (io_cmd_valid && (io_cmd_payload_mode == CRCCombinationalCmdMode_UPDATE));
  always @(*) begin
    result_reflected[0] = crc_reg[31];
    result_reflected[1] = crc_reg[30];
    result_reflected[2] = crc_reg[29];
    result_reflected[3] = crc_reg[28];
    result_reflected[4] = crc_reg[27];
    result_reflected[5] = crc_reg[26];
    result_reflected[6] = crc_reg[25];
    result_reflected[7] = crc_reg[24];
    result_reflected[8] = crc_reg[23];
    result_reflected[9] = crc_reg[22];
    result_reflected[10] = crc_reg[21];
    result_reflected[11] = crc_reg[20];
    result_reflected[12] = crc_reg[19];
    result_reflected[13] = crc_reg[18];
    result_reflected[14] = crc_reg[17];
    result_reflected[15] = crc_reg[16];
    result_reflected[16] = crc_reg[15];
    result_reflected[17] = crc_reg[14];
    result_reflected[18] = crc_reg[13];
    result_reflected[19] = crc_reg[12];
    result_reflected[20] = crc_reg[11];
    result_reflected[21] = crc_reg[10];
    result_reflected[22] = crc_reg[9];
    result_reflected[23] = crc_reg[8];
    result_reflected[24] = crc_reg[7];
    result_reflected[25] = crc_reg[6];
    result_reflected[26] = crc_reg[5];
    result_reflected[27] = crc_reg[4];
    result_reflected[28] = crc_reg[3];
    result_reflected[29] = crc_reg[2];
    result_reflected[30] = crc_reg[1];
    result_reflected[31] = crc_reg[0];
  end

  assign io_crc = (result_reflected ^ 32'hffffffff);
  always @(negedge clk) begin
    if(when_CRCCombinational_l100) begin
      crc_reg <= 32'hffffffff;
    end
    if(when_CRCCombinational_l105) begin
      crc_reg <= next_crc;
    end
  end


endmodule
