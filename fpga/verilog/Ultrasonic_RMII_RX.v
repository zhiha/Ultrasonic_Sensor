`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:25:33 10/04/2022 
// Design Name: 
// Module Name:    Ultrasonic_RMII_RX 
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
module Ultrasonic_RMII_RX(
	input clk,
	input reset,
	input rmii_txen,
	input rmii_tx0,
	input rmii_tx1,
	output reg [7:0] rmii_rec_data,
	output reg rmii_rec_data_update,
	output reg rmii_rec_data_done,
	output reg [15:0] rmii_rec_byte_num,
	output reg config_ing,
	output reg config_done,
	output reg tx_flag
    );

localparam BOARD_MAC = 48'h11_22_33_44_55_66;

// ETH PROTOCOL
localparam ST_IDLE = 7'b000_0001;
localparam ST_PREAMBLE = 7'b000_0010;
localparam ST_ETH_HEAD = 7'b000_0100;
localparam ST_LEN = 7'b000_1000;
localparam ST_RX_DATA = 7'b001_0000;
localparam ST_RX_END = 7'b010_0000;

localparam CONFIGING = 8'h0a;
localparam CONFIGFINISH = 8'h0b;
localparam TXFLAG = 8'h0c;

reg [6:0] state = ST_IDLE;
reg [7:0] byte_data;
reg [3:0] bit_sel = 0;
reg byte_update = 0;

reg [15:0] byte_cnt = 0;
reg error_flag = 0;

reg [47:0] desmac ;
reg [15:0] eth_type;
reg [15:0] data_len;


always@(posedge clk or negedge reset) begin
	if(!reset) begin
		byte_update <= 0;
		bit_sel <= 0;
		byte_data <= 0;
	end
	else begin
		bit_sel <= 0;
		byte_update <= 0;
		if(rmii_txen)begin
			bit_sel <= bit_sel + 1;
			if(bit_sel == 0)begin
				byte_data[0] <= rmii_tx0;
				byte_data[1] <= rmii_tx1;
			end
			else if(bit_sel == 1)begin
				byte_data[2] <= rmii_tx0;
				byte_data[3] <= rmii_tx1;
			end
			else if(bit_sel == 2)begin
				byte_data[4] <= rmii_tx0;
				byte_data[5] <= rmii_tx1;
			end
			else if(bit_sel == 3)begin
				byte_data[6] <= rmii_tx0;
				byte_data[7] <= rmii_tx1;
				bit_sel <= 0;
				byte_update <= 1;
			end
		end
	end
end

always@(posedge clk or negedge reset)begin
	if(!reset)begin
		error_flag <= 0;
		byte_cnt <= 0;
		rmii_rec_data <= 0;
		eth_type <= 0;
		config_ing <= 0;
		config_done <= 1;
		rmii_rec_data_update <= 0;
	end
	else begin
		tx_flag <= 0;
		error_flag <= 0;
		rmii_rec_data_update <= 0;
		rmii_rec_data_done <= 0;
		case(state)
			ST_IDLE:begin
				if((byte_update==1) && (byte_data == 8'h55)) begin
					state <= ST_PREAMBLE;
				end
			end
			ST_PREAMBLE:begin
				if(byte_update == 1) begin
					byte_cnt <= byte_cnt + 1;
					if(byte_cnt < 6 && byte_data != 8'h55)begin
						error_flag <= 1;
						byte_cnt <= 0;
						state <= ST_RX_END;
					end
					if(byte_cnt == 6) begin
						if(byte_data == 8'hd5) 
							state <= ST_ETH_HEAD;
						else begin
							error_flag <= 1;
							state <= ST_RX_END;
						end
						byte_cnt <= 0;
					end
				end
			end
			ST_ETH_HEAD:begin
				if(byte_update) begin
					byte_cnt <= byte_cnt + 1;
					if(byte_cnt < 6)
						desmac <= {desmac[39:0],byte_data};
					else if(byte_cnt == 12)
						eth_type[15:8] <= byte_data;
					else if(byte_cnt == 13) begin
						eth_type[7:0] <= byte_data;
						byte_cnt <= 0;
						if(desmac == BOARD_MAC)
							state <= ST_LEN;
						else
							error_flag <= 1;
						if(eth_type[15:8] == 8'h09) begin
							config_ing <= 0;
							config_done <= 1;
						end
						if(eth_type[15:8] == CONFIGING) begin
							config_ing <= 1;
							config_done <= 0;
						end
						if(eth_type[15:8] == CONFIGFINISH) begin
							state <= ST_RX_END;
							config_ing <= 0;
							config_done <= 1;
						end
						if(eth_type[15:8] == TXFLAG) begin
							state <= ST_RX_END;
							tx_flag <= 1;
						end
					end
				end
			end
			ST_LEN: begin
				if(byte_update)begin
					byte_cnt <= byte_cnt + 1;
					if(byte_cnt == 0)
						data_len[15:8] <= byte_data;
					else if(byte_cnt == 1)begin
						data_len[7:0] <= byte_data;
						byte_cnt <= 0;
						state <= ST_RX_DATA;
					end
				end
			end
			ST_RX_DATA:begin
				rmii_rec_data_update <= 0;
				rmii_rec_byte_num <= data_len;
				if(byte_update) begin
					byte_cnt <= byte_cnt + 1;
					rmii_rec_data <= byte_data;
					rmii_rec_data_update <= 1;
					if(byte_cnt == data_len -1)begin
						state <= ST_RX_END;
						byte_cnt <= 0;
						rmii_rec_data_done <= 1;
					end
				end
			end
			ST_RX_END:begin
				rmii_rec_data_update <= 0;
				rmii_rec_data_done <= 0;
				if(rmii_txen == 0)
					state <= ST_IDLE;
			end
			default: ;
		endcase
	end
end

endmodule
