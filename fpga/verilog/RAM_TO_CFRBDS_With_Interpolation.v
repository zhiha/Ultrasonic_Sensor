`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:49:36 10/30/2022 
// Design Name: 
// Module Name:    RAM_TO_CFRBDS_With_Interpolation 
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
module RAM_TO_CFRBDS_With_Interpolation(
	input clk,
	input reset,
	input [15:0] fmcw_data,
	input read_start, 
	input tx_flag,
	output reg finish_flag,
	output reg enb,	
	output reg [12:0] read_addr,
	output reg [15:0] cfrbds_data,
	output reg cfrbds_reset,
	output reg cfrbds_flush
    );

localparam pulse_num_one_frame = 8;
localparam pulse_slot = 100;
localparam frame_slot = 10000;

reg [1:0] reset_cnt = 0;
reg [3:0] state = 0;
reg reset_flag = 0;

reg [15:0] init_value = 0;
reg [15:0] inter_value = 0;
reg [15:0] next_value = 0;
wire[15:0] subtract_value;
wire[15:0] fushu_transform;
wire[15:0] fushu_inter_value;

reg [3:0] inter_cnt = 0;

reg [3:0] pulse_cnt = 0;
reg [15:0] slot_cnt = 0;


assign subtract_value = state==4 ? (fmcw_data - init_value):(fmcw_data - next_value);
assign fushu_transform = (~subtract_value+1);
assign fushu_inter_value = fushu_transform >> 3;

always@(posedge clk or negedge reset)begin
	if(!reset)begin
		read_addr <= 0;
		cfrbds_data <= 0;
		cfrbds_reset <= 1;
		cfrbds_flush <= 1;
		enb <= 0;
	end
	else begin
		enb <= 0;
		if(read_start) begin
			if(state==0) begin
				cfrbds_data <= 0;
				cfrbds_reset <= 1;
				cfrbds_flush <= 1;
				reset_cnt <= reset_cnt + 1;
				if(reset_cnt == 3) begin
					reset_cnt <= 0;
					state <= state + 1;
				end
			end
			else if(state==1) begin
				cfrbds_data <= 0;
				cfrbds_reset <= 0;
				reset_cnt <= reset_cnt + 1;
				if(reset_cnt == 3) begin
					reset_cnt <= 0;
					state <= state + 1;
					enb <= 1;
				end
			end
			else if(state==2) begin
				enb <= 1;
				read_addr <= read_addr + 1;
				state <= state + 1;
			end	
			else if(state==3) begin
				cfrbds_flush <= 0;
				init_value <= fmcw_data;
				state <= state + 1;
			end
			else if(state==4) begin
				state <= state + 1;
				if(subtract_value[15]==1)
					inter_value <= ~fushu_inter_value+1;
				else
					inter_value <= subtract_value>>3;
				next_value <= fmcw_data;
			end
			else if(state==5) begin
				finish_flag <= 0;
				cfrbds_data <= init_value;
				init_value <= init_value + inter_value;
				inter_cnt <= inter_cnt + 1;
				if(inter_cnt == 5)begin
					enb <= 1;
					read_addr <= read_addr + 1;
					if(read_addr == 3999) begin
//						txflag <= 0;
						read_addr <= 0;
						finish_flag <= 1;
					end
				end
				if(inter_cnt == 7)begin
					if(subtract_value[15]==1)
						inter_value <= ~fushu_inter_value+1;
					else
						inter_value <= subtract_value>>3;
					init_value <= next_value;
					next_value <= fmcw_data;
					inter_cnt <= 0;
				end
			end	
		end
		else begin
			if(!reset_flag) begin
				cfrbds_data <= 0;
				cfrbds_reset <= 1;
				cfrbds_flush <= 1;
				reset_cnt <= reset_cnt + 1;
				if(reset_cnt == 1) begin
					cfrbds_reset <= 0;
				end
				if(reset_cnt == 3) begin
					cfrbds_flush <= 0;
					reset_cnt <= 0;
					reset_flag <= 1;
				end
			end
			read_addr <= 0;
			state <= 0;
//			txflag <= 0;
		end
	end
end





endmodule
