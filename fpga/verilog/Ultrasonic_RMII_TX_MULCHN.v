`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:35:00 10/21/2022 
// Design Name: 
// Module Name:    Ultrasonic_RMII_TX_MULCHN 
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
module Ultrasonic_RMII_TX_MULCHN(
    //system
	input clk,
	input reset,

	//rmii
	input rmii_tx_done,
	input [17:0] rmii_tx_data,
	input [15:0] rmii_tx_len,
	output reg rmii0,
	output reg rmii1,
	output reg rmiiv,
	output reg rmii_tx_en,

	//crc
	input [31:0] crc_dout,
	output reg [0:0] crc_mode,
	output reg [7:0] crc_din,
	output reg crc_din_valid,
	input start_flag
	
    );


// parameter define 
localparam BOARD_MAC = 48'h11_22_33_44_55_66;
localparam DES_MAC =  48'hfa_23_aa_60_10_6f;//48'hd6_22_2f_cf_7e_d1;
localparam ETH_TYPE = 16'h0900; 
localparam MIN_DATA_NUM = 16'd46; 

// eth state
localparam ST_IDLE = 8'b000_0001;
localparam ST_PREAMBLE = 8'b000_0010;
localparam ST_ETH_HEAD = 8'b000_0100;
localparam ST_TIME = 8'b000_1000;
localparam ST_LEN = 8'b001_0000;
localparam ST_TX_DATA = 8'b010_0000;
localparam ST_CRC = 8'b100_0000;

//resource
reg [7:0] PREAMBLE[7:0];
reg [7:0] ETH_HEAD[13:0];
reg [15:0] TX_BYTE_NUM = 0;

//state machine
reg [7:0] cur_state = ST_IDLE;
//bit_sel 
reg [4:0] bit_sel = 0;
//byte_cnt
reg [3:0] bt_cnt = 0;

reg crc_action_flag = 0;
reg crc_last_flag = 0;
reg [15:0] byte_cnt = 0;
reg [7:0] byte_tmp = 0;
//time_stap cnt
reg [31:0] Time_Send = 0;
reg [31:0] Time_Recive = 0;

reg [15:0] frame_cnt = 0;

reg [31:0] debug_cnt = 0;


reg Time_flag = 0;

reg start_flag_delay = 0;

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
	
end

//**********************************************//
//**						MAIN PART                **//
//**********************************************//
//					TRANSMIT DATA TO ARM            //

//Time module
always@(negedge clk)begin
	debug_cnt <= debug_cnt + 1;
	start_flag_delay <= start_flag;
end

always@(negedge clk or negedge reset)begin
	if(!reset)begin
		Time_Send <= 0;
	end
	else begin
		if(start_flag && (~start_flag_delay))begin
			Time_Send <= Time_Send + 1;
			frame_cnt <= 0;
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
					Time_Recive <= Time_Recive + 1;
					cur_state <= ST_PREAMBLE;
					frame_cnt <= frame_cnt + 1;
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
						cur_state <= ST_TIME;
					end
				end
			end
			ST_TIME:begin
				rmiiv <= 1'b1;
				bit_sel <= bit_sel + 1;
				crc_mode <= 1'b1;
				if(Time_flag==0)begin
					rmii0 <= Time_Send[24-byte_cnt*8+bit_sel*2];//Time_Send[24-byte_cnt*8+bit_sel*2];
					rmii1 <= Time_Send[24-byte_cnt*8+bit_sel*2+1];//Time_Send[24-byte_cnt*8+bit_sel*2+1];
				end
				else begin
					rmii0 <= Time_Recive[24-byte_cnt*8+bit_sel*2];
					rmii1 <= Time_Recive[24-byte_cnt*8+bit_sel*2+1];
				end
				if(bit_sel == 2)begin
					if(Time_flag==0)begin
						if(byte_cnt == 0)
							crc_din <= Time_Send[31:24];//Time_Send[31:24];
						else if(byte_cnt == 1)
							crc_din <= Time_Send[23:16];//Time_Send[23:16];
						else if(byte_cnt == 2)
							crc_din <= Time_Send[15:8];//Time_Send[15:8];
						else if(byte_cnt == 3)
							crc_din <= Time_Send[7:0];//Time_Send[7:0];
						crc_din_valid <= 1'b1;
					end
					else if(Time_flag==1)begin
						if(byte_cnt == 0)
							crc_din <= Time_Recive[31:24];
						else if(byte_cnt == 1)
							crc_din <= Time_Recive[23:16];
						else if(byte_cnt == 2)
							crc_din <= Time_Recive[15:8];
						else if(byte_cnt == 3)
							crc_din <= Time_Recive[7:0];
						crc_din_valid <= 1'b1;
					end
				end
				else if(bit_sel == 3)begin
					bit_sel <= 0;
					byte_cnt <= byte_cnt + 1;
					if(Time_flag==0 && byte_cnt == 3) begin
						byte_cnt <= 0;
						Time_flag <= 1;
					end
					if(Time_flag==1 && byte_cnt == 3) begin
						byte_cnt <= 0;
						Time_flag <= 0;
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
				crc_mode <= 1'b1;
				bt_cnt <= bt_cnt + 1;
				bit_sel <= bit_sel + 1;
				rmii0 <= rmii_tx_data[bit_sel*2];
				rmii1 <= rmii_tx_data[bit_sel*2+1];
				byte_tmp[bt_cnt*2] <= rmii_tx_data[bit_sel*2];
				byte_tmp[bt_cnt*2+1] <= rmii_tx_data[bit_sel*2+1];
				rmii_tx_en <= 0;
				if(bit_sel == 8) begin
					bit_sel <= 0;
					rmii_tx_en <= 1;
				end
				if(bt_cnt == 3)begin
					bt_cnt <= 0;
					crc_action_flag <= 1;
					byte_cnt <= byte_cnt + 1;
					if(byte_cnt == TX_BYTE_NUM-1) begin
						byte_cnt <= 0;
						bit_sel <= 0;
						rmii_tx_en <= 0;
						crc_action_flag <= 0;
						cur_state <= ST_CRC;
						crc_last_flag <= 0;
					end
				end
				if(crc_action_flag)begin
					crc_action_flag <= 0;
					crc_din <= byte_tmp;
					crc_din_valid <= 1'b1;
				end
				if(crc_action_flag == 0 && byte_cnt == TX_BYTE_NUM-1)begin
					if(crc_last_flag==0)begin
						crc_din <= rmii_tx_data[17:10];
						crc_din_valid <= 1'b1;
						crc_last_flag <= 1;
					end
				end
			end
			ST_CRC:begin
				rmiiv <= 1'b1;
				bit_sel <= bit_sel + 1;
				if(bit_sel == 0) begin
					rmii0 <= crc_dout[byte_cnt*8+0];
					rmii1 <= crc_dout[byte_cnt*8+1];
				end
				else if(bit_sel == 1) begin
					rmii0 <= crc_dout[byte_cnt*8+2];
					rmii1 <= crc_dout[byte_cnt*8+3];
				end
				else if(bit_sel == 2) begin
					rmii0 <= crc_dout[byte_cnt*8+4];
					rmii1 <= crc_dout[byte_cnt*8+5];
				end
				else if(bit_sel == 3) begin
					rmii0 <= crc_dout[byte_cnt*8+6];
					rmii1 <= crc_dout[byte_cnt*8+7];
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

