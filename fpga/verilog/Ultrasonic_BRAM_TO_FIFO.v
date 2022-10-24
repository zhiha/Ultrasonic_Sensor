`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:41:48 10/09/2022 
// Design Name: 
// Module Name:    Ultrasonic_BRAM_TO_FIFO 
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
module Ultrasonic_BRAM_TO_FIFO(
   input clk,
	input reset,
	input [15:0] fmcw_data,
	input read_start,  
	output reg enb,
	output reg [12:0] read_addr,
	output reg [7:0] bram_data,
	output reg byte_data_valid,
	output reg byte_data_done,
	output reg [15:0] byte_num
    );
	 
localparam len = 1498;

reg [15:0] byte_cnt = 0;
reg [1:0] cnt = 0;


always@(posedge clk or negedge reset)begin
	if(!reset)begin
		read_addr <= 0;
		bram_data <= 0;
		byte_data_valid <= 0;
		byte_data_done <= 0;
		enb <= 0;
	end
	else begin
		byte_num <= len;
		byte_data_valid <= 0;
		byte_data_done <= 0;
		enb <= 0;
		if(read_start) begin
			enb <= 1;
			if(enb && cnt==0)begin
				cnt <= cnt + 1;
				enb <= 0;
			end
			else if(cnt==1)begin
				byte_data_valid <= 1;
				byte_cnt <= byte_cnt + 1;
				cnt <= cnt + 1;
				enb <= 0;
				bram_data <= fmcw_data[15:8];
			end
			else if(cnt==2)begin	
				cnt <= 0;
				byte_data_valid <= 1;
				byte_cnt <= byte_cnt + 1;
				if(byte_cnt == len-1) begin
					byte_data_done <= 1;
					byte_cnt <= 0;
				end
				read_addr <= read_addr + 1;
				if(read_addr == 4799)begin
					read_addr <= 0;
				end
				bram_data <= fmcw_data[7:0];
			end
		end
		else begin
			read_addr <= 0;
		end
	end
end

endmodule
