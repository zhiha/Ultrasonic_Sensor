`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:21:30 10/04/2022 
// Design Name: 
// Module Name:    RAM_TO_CFRBDS 
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
module RAM_TO_CFRBDS(
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

reg [1:0] reset_cnt = 0;
reg [1:0] state = 0;
reg reset_flag = 0;
reg txflag = 0;


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
		if(tx_flag)begin
			txflag <= 1;
		end
		if(read_start) begin //&&txflag
			if(state==0) begin
				cfrbds_data <= 0;
				cfrbds_reset <= 1;
				cfrbds_flush <= 1;
				reset_cnt <= reset_cnt + 1;
				if(reset_cnt == 3) begin
					reset_cnt <= 0;
					state <= state + 1;
				end
				enb <= 1;
			end
			else if(state==1) begin
				cfrbds_data <= 0;
				cfrbds_reset <= 0;
				reset_cnt <= reset_cnt + 1;
				if(reset_cnt == 3) begin
					reset_cnt <= 0;
					state <= state + 1;
				end
				enb <= 1;
			end
			else if(state==2) begin
				enb <= 1;
				cfrbds_data <= 0;
				cfrbds_flush <= 0;
				cfrbds_data <= fmcw_data;
				read_addr <= read_addr + 1;
				finish_flag <= 0;
				if(read_addr == 0)begin
					finish_flag <= 1;
				end
				if(read_addr == 3999) begin
					txflag <= 0;
					read_addr <= 0;
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
			txflag <= 0;
		end
	end
end

endmodule
