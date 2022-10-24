`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:27:18 09/28/2022 
// Design Name: 
// Module Name:    RMII_SINGLE_TX 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module RMII_SINGLE_TX(
	//system
	input clk,
	input reset,
	
	input [15:0] rmii_tx_len,
	input rmii_tx_done,
	input [7:0] rmii_tx_data,
	output reg rmii_tx_en,
	
	
	//rmii
	output reg rmii0,
	output reg rmii1,
	output reg rmiiv,
	
	//crc
	input [31:0] crc_dout,
	output reg [0:0] crc_mode,
	output reg [7:0] crc_din,
	output reg crc_din_valid
	
    );


// parameter define 
localparam BOARD_MAC = 48'h11_22_33_44_55_66;
localparam DES_MAC =  48'hfa_23_aa_60_10_6f;//48'hd6_22_2f_cf_7e_d1;
//localparam DES_MAC =  48'h11_22_33_44_55_66;//48'hd6_22_2f_cf_7e_d1;
//localparam BOARD_MAC = 48'hfa_23_aa_60_10_6f;
localparam ETH_TYPE = 16'h0900; 
localparam MIN_DATA_NUM = 16'd46; 

// eth state
localparam ST_IDLE = 7'b000_0001;
localparam ST_PREAMBLE = 7'b000_0010;
localparam ST_ETH_HEAD = 7'b000_0100;
localparam ST_LEN = 7'b000_1000;
localparam ST_TX_DATA = 7'b001_0000;
localparam ST_CRC = 7'b010_0000;

//resource
reg [7:0] PREAMBLE[7:0];
reg [7:0] ETH_HEAD[13:0];
reg [15:0] TX_BYTE_NUM = 0;

//state machine
reg [6:0] cur_state = ST_IDLE;
//tx action flag
reg start = 0;
reg [24:0] start_cnt = 0;
//bit_sel 
reg [3:0] bit_sel = 0;
//byte_cnt
reg [15:0] byte_cnt = 0;
//debug_tx_data
//reg [7:0] tx_data[55:0];
//debug_crc
//reg [31:0] crc_data_debug = 32'h4195a088;

initial begin 
	PREAMBLE[0] <= 8'h55;                 
	PREAMBLE[1] <= 8'h55;
	PREAMBLE[2] <= 8'h55;
	PREAMBLE[3] <= 8'h55;
	PREAMBLE[4] <= 8'h55;
	PREAMBLE[5] <= 8'h55;
	PREAMBLE[6] <= 8'h55;
	PREAMBLE[7] <= 8'hd5;
	//
	ETH_HEAD[0] <= DES_MAC[47:40];
	ETH_HEAD[1] <= DES_MAC[39:32];
	ETH_HEAD[2] <= DES_MAC[31:24];
	ETH_HEAD[3] <= DES_MAC[23:16];
	ETH_HEAD[4] <= DES_MAC[15:8];
	ETH_HEAD[5] <= DES_MAC[7:0];
	//
	ETH_HEAD[6] <= BOARD_MAC[47:40];
	ETH_HEAD[7] <= BOARD_MAC[39:32];
	ETH_HEAD[8] <= BOARD_MAC[31:24];
	ETH_HEAD[9] <= BOARD_MAC[23:16];
	ETH_HEAD[10] <= BOARD_MAC[15:8];
	ETH_HEAD[11] <= BOARD_MAC[7:0];
	//
	ETH_HEAD[12] <= ETH_TYPE[15:8];
	ETH_HEAD[13] <= ETH_TYPE[7:0];
   //
//	tx_data[0] <= 8'h00;
//	tx_data[1] <= 8'h00;
//	tx_data[2] <= 8'h00;
//	tx_data[3] <= 8'h04;
//	tx_data[4] <= 8'hf8;
//	tx_data[5] <= 8'h02;
//	tx_data[6] <= 8'had;
//	tx_data[7] <= 8'h02;
//	tx_data[8] <= 8'hfa;
//	tx_data[9] <= 8'h03;
//	tx_data[10] <= 8'h6b;
//	tx_data[11] <= 8'h20;
//	tx_data[12] <= 8'h59;
//	tx_data[13] <= 8'h02;
//	tx_data[14] <= 8'h3c;
//	tx_data[15] <= 8'h23;
//	tx_data[16] <= 8'hd4;
//	tx_data[17] <= 8'h20;
//	tx_data[18] <= 8'he9;
//	tx_data[19] <= 8'h23;
//	tx_data[20] <= 8'h76;
//	tx_data[21] <= 8'h23;
//	tx_data[22] <= 8'h00;
//	tx_data[23] <= 8'h22;
//	tx_data[24] <= 8'hcd;
//	tx_data[25] <= 8'h23;
//	tx_data[26] <= 8'h3c;
//	tx_data[27] <= 8'h01;
//	tx_data[28] <= 8'ha0;
//	tx_data[29] <= 8'h21;
//	tx_data[30] <= 8'ha7;
//	tx_data[31] <= 8'h03;
//	tx_data[32] <= 8'ha0;
//	tx_data[33] <= 8'h01;
//	tx_data[34] <= 8'ha7;
//	tx_data[35] <= 8'h03;
//	tx_data[36] <= 8'hcd;
//	tx_data[37] <= 8'h03;
//	tx_data[38] <= 8'h3c;
//	tx_data[39] <= 8'h01;
//	tx_data[40] <= 8'h76;
//	tx_data[41] <= 8'h03;
//	tx_data[42] <= 8'h00;
//	tx_data[43] <= 8'h22;
//	tx_data[44] <= 8'hd4;
//	tx_data[45] <= 8'h00;
//	tx_data[46] <= 8'he9;
//	tx_data[47] <= 8'h23;
//	tx_data[48] <= 8'h59;
//	tx_data[49] <= 8'h22;
//	tx_data[50] <= 8'h3c;
//	tx_data[51] <= 8'h23;
//	tx_data[52] <= 8'hfa;
//	tx_data[53] <= 8'h23;
//	tx_data[54] <= 8'h6b;
//	tx_data[55] <= 8'h20;
	
end

//**********************************************//
//**						MAIN PART                **//
//**********************************************//
//					TRANSMIT DATA TO ARM            //

//generate transmit signal flag
always@(negedge clk or negedge reset) begin
	if(!reset)
		start_cnt <= 0;
	else begin
		start <= 0;
		start_cnt <= start_cnt + 1;
		if(start_cnt == 85535*4) begin
			start_cnt <= 0;
			start <= 1;
		end
	end
end
//Tx data procedure
always@(negedge clk or negedge reset) begin
	if(!reset)begin
		rmiiv <= 1'b0;
	end
	else begin
		rmiiv <= 1'b0;
		crc_din_valid <= 1'b0;
		rmii_tx_en <= 0;
		case(cur_state)
			ST_IDLE: begin
				rmii0 <= 0;
				rmii1 <= 0;
				rmiiv <= 0;
				crc_din_valid <= 1'b1;
				crc_mode <= 1'b0;
				if(rmii_tx_done) begin
					TX_BYTE_NUM <= rmii_tx_len;
					cur_state <= ST_PREAMBLE;
				end
			end
			ST_PREAMBLE: begin
				rmiiv <= 1'b1;
				bit_sel <= bit_sel + 1;
				if(bit_sel == 0) begin
					rmii0 <= PREAMBLE[byte_cnt][0];
					rmii1 <= PREAMBLE[byte_cnt][1];
				end
				else if(bit_sel == 1) begin
					rmii0 <= PREAMBLE[byte_cnt][2];
					rmii1 <= PREAMBLE[byte_cnt][3];
				end
				else if(bit_sel == 2) begin
					rmii0 <= PREAMBLE[byte_cnt][4];
					rmii1 <= PREAMBLE[byte_cnt][5];
				end
				else if(bit_sel == 3) begin
					rmii0 <= PREAMBLE[byte_cnt][6];
					rmii1 <= PREAMBLE[byte_cnt][7];
					bit_sel <= 0;
					byte_cnt <= byte_cnt + 1;
					if(byte_cnt == 7) begin
						byte_cnt <= 0;
						cur_state <= ST_ETH_HEAD;
					end
				end
			end
			ST_ETH_HEAD: begin
				rmiiv <= 1'b1;
				bit_sel <= bit_sel + 1;
				crc_mode <= 1'b1;
				if(bit_sel == 0) begin
					rmii0 <= ETH_HEAD[byte_cnt][0];
					rmii1 <= ETH_HEAD[byte_cnt][1];
				end
				else if(bit_sel == 1) begin
					rmii0 <= ETH_HEAD[byte_cnt][2];
					rmii1 <= ETH_HEAD[byte_cnt][3];
				end
				else if(bit_sel == 2) begin
					rmii0 <= ETH_HEAD[byte_cnt][4];
					rmii1 <= ETH_HEAD[byte_cnt][5];
					crc_din <= ETH_HEAD[byte_cnt];
					crc_din_valid <= 1'b1;
				end
				else if(bit_sel == 3) begin
					rmii0 <= ETH_HEAD[byte_cnt][6];
					rmii1 <= ETH_HEAD[byte_cnt][7];
					bit_sel <= 0;
					byte_cnt <= byte_cnt + 1;
					if(byte_cnt == 13) begin
						byte_cnt <= 0;
						cur_state <= ST_LEN;
					end
				end
			end
			ST_LEN: begin
				rmiiv <= 1'b1;
				bit_sel <= bit_sel + 1;
				crc_mode <= 1'b1;
				if(bit_sel == 0) begin
					rmii0 <= TX_BYTE_NUM[8];
					rmii1 <= TX_BYTE_NUM[9];
				end
				else if(bit_sel == 1) begin
					rmii0 <= TX_BYTE_NUM[10];
					rmii1 <= TX_BYTE_NUM[11];
				end
				else if(bit_sel == 2) begin
					rmii0 <= TX_BYTE_NUM[12];
					rmii1 <= TX_BYTE_NUM[13];
					crc_din <= TX_BYTE_NUM[15:8];
					crc_din_valid <= 1'b1;
				end
				else if(bit_sel == 3) begin
					rmii0 <= TX_BYTE_NUM[14];
					rmii1 <= TX_BYTE_NUM[15];
				end
				else if(bit_sel == 4) begin
					rmii0 <= TX_BYTE_NUM[0];
					rmii1 <= TX_BYTE_NUM[1];
				end
				else if(bit_sel == 5) begin
					rmii0 <= TX_BYTE_NUM[2];
					rmii1 <= TX_BYTE_NUM[3];
				end
				else if(bit_sel == 6) begin
					rmii0 <= TX_BYTE_NUM[4];
					rmii1 <= TX_BYTE_NUM[5];
					crc_din <= TX_BYTE_NUM[7:0];
					crc_din_valid <= 1'b1;
					rmii_tx_en <= 1;
				end
				else if(bit_sel == 7) begin
					rmii0 <= TX_BYTE_NUM[6];
					rmii1 <= TX_BYTE_NUM[7];
					bit_sel <= 0;
					cur_state <= ST_TX_DATA;
					rmii_tx_en <= 0;
				end
			end
			ST_TX_DATA: begin
				rmiiv <= 1'b1;
				bit_sel <= bit_sel + 1;
				crc_mode <= 1'b1;
				rmii_tx_en <= 0;
				if(bit_sel == 0) begin
					rmii0 <= rmii_tx_data[0];//tx_data[byte_cnt][0];
					rmii1 <= rmii_tx_data[1];//tx_data[byte_cnt][1];
				end
				else if(bit_sel == 1) begin
					rmii0 <= rmii_tx_data[2];//tx_data[byte_cnt][2];
					rmii1 <= rmii_tx_data[3];//tx_data[byte_cnt][3];
				end
				else if(bit_sel == 2) begin
					rmii0 <= rmii_tx_data[4];//tx_data[byte_cnt][4];
					rmii1 <= rmii_tx_data[5];//tx_data[byte_cnt][5];
					crc_din <= rmii_tx_data;//tx_data[byte_cnt][7:0];
					crc_din_valid <= 1'b1;
				end
				else if(bit_sel == 3) begin
					rmii0 <= rmii_tx_data[6];//tx_data[byte_cnt][6];
					rmii1 <= rmii_tx_data[7];//tx_data[byte_cnt][7];
					bit_sel <= 0;
					byte_cnt <= byte_cnt + 1;
					rmii_tx_en <= 1;
					if(byte_cnt == TX_BYTE_NUM-1) begin
						byte_cnt <= 0;
						cur_state <= ST_CRC;
						rmii_tx_en <= 0;
					end
				end
			end
			ST_CRC:begin
				rmiiv <= 1'b1;
				bit_sel <= bit_sel + 1;
				if(bit_sel == 0) begin
					rmii0 <= crc_dout[byte_cnt*8+0];//crc_data_debug[byte_cnt*8+0];
					rmii1 <= crc_dout[byte_cnt*8+1];//~crc_dout[24-byte_cnt*8+1];
				end
				else if(bit_sel == 1) begin
					rmii0 <= crc_dout[byte_cnt*8+2];//crc_data_debug[byte_cnt*8+2];
					rmii1 <= crc_dout[byte_cnt*8+3];//crc_data_debug[byte_cnt*8+3];
				end
				else if(bit_sel == 2) begin
					rmii0 <= crc_dout[byte_cnt*8+4];//crc_data_debug[byte_cnt*8+4];
					rmii1 <= crc_dout[byte_cnt*8+5];//crc_data_debug[byte_cnt*8+5];
				end
				else if(bit_sel == 3) begin
					rmii0 <= crc_dout[byte_cnt*8+6];//crc_data_debug[byte_cnt*8+6];
					rmii1 <= crc_dout[byte_cnt*8+7];//crc_data_debug[byte_cnt*8+7];
					bit_sel <= 0;
					byte_cnt <= byte_cnt + 1;
					if(byte_cnt == 3) begin
						byte_cnt <= 0;
						cur_state <= ST_IDLE;
					end
				end
			end
			default: ;
		endcase;
	end
end




endmodule
