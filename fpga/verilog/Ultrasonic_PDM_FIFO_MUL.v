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
	//input [7:0] fe_rx,
	output reg [17:0] fe_rx_data,
	output reg [15:0] byte_num,
	output reg fe_rx_data_valid,
	output reg fe_rx_data_done
    );

localparam len = 1485;
localparam cnt_num = 660;  //1485*8/18  1485*8/18


reg [15:0] fe_rx_cnt = 0;


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
		fe_rx_data_valid <= 1;
		fe_rx_cnt <= fe_rx_cnt + 1;
		if(fe_rx_cnt == cnt_num-1)begin
			fe_rx_data_done <= 1;
			fe_rx_cnt <= 0;
		end
	end
end

endmodule
