`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:07:08 10/21/2022 
// Design Name: 
// Module Name:    Ultrasonic_PDM_FIFO_MUL 
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
module Ultrasonic_PDM_FIFO_MUL(
   input clk,
	input reset,
	input [17:0] fe_rx,
	input start_flag,
	output reg [17:0] fe_rx_data,
	output reg [15:0] byte_num,
	output reg fe_rx_data_valid,
	output reg fe_rx_data_done
    );

localparam len = 1485;
localparam cnt_num = 660;  //1485*8/18  1485*8/18
localparam rx_num = 40920; //1e-2


reg [15:0] fe_rx_cnt = 0;

reg push_flag = 0;
reg [15:0] rx_cnt = 0;

reg start_flag_delay = 0;

always@(posedge clk)begin
	start_flag_delay <= start_flag;
end

always@(posedge clk or negedge reset)begin
	if(!reset)begin
		byte_num <= len;
		fe_rx_cnt <= 0;
		fe_rx_data <= 0;
		fe_rx_data_valid <= 0;
		fe_rx_data_done <= 0;
	end
	else begin
		byte_num <= len;
		fe_rx_data_done <= 0;
		fe_rx_data <= fe_rx;
		fe_rx_data_valid <= 0;
		if(start_flag && (~start_flag_delay))begin
			push_flag <= 1;
		end
		if(push_flag)begin
			fe_rx_data_valid <= 1;
			fe_rx_cnt <= fe_rx_cnt + 1;
			rx_cnt <= rx_cnt + 1;
			if(fe_rx_cnt == cnt_num-1)begin
				fe_rx_data_done <= 1;
				fe_rx_cnt <= 0;
			end
			if(rx_cnt == rx_num-1)begin
				rx_cnt <= 0;
				push_flag <= 0;
			end
		end	
	end
end

endmodule
