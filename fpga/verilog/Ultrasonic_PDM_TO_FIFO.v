`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:32:16 10/04/2022 
// Design Name: 
// Module Name:    Ultrasonic_PDM_TO_FIFO 
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
module Ultrasonic_PDM_TO_FIFO(
	input clk,
	input reset,
	input [17:0] fe_rx,
	input bit_data,
	output reg [7:0] byte_data,
	output reg [15:0] byte_num,
	output reg byte_data_valid,
	output reg byte_data_done
    );

localparam len = 1494;

reg [3:0] bit_sel = 0;
reg [15:0] byte_cnt = 0;


always@(posedge clk or negedge reset)begin
	if(!reset)begin
		byte_num <= len;
		bit_sel <= 0;
		byte_cnt <= 0;
		byte_data <= 0;
		byte_data_valid <= 0;
		byte_data_done <= 0;
	end
	else begin
		byte_num <= len;
		byte_data_valid <= 0;
		byte_data_done <= 0;
		bit_sel <= bit_sel + 1;
		byte_data[bit_sel] <= bit_data;
		if(bit_sel == 7) begin
			bit_sel <= 0;
			byte_cnt <= byte_cnt + 1;
			byte_data_valid <= 1;
		end
		if(byte_cnt == len-1)begin
			byte_data_done <= 1;
			byte_cnt <= 0;
		end
	end
end

endmodule
