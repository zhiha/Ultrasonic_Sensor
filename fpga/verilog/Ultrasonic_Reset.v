`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:40:25 10/06/2022 
// Design Name: 
// Module Name:    Ultrasonic_Reset 
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
module Ultrasonic_Reset(
	input clk,
	output reg reset
    );

reg [2:0] reset_cnt = 0; 

always@(posedge clk)begin
	reset <= 0;
	reset_cnt <= reset_cnt + 1;
	if(reset_cnt == 7)begin
		reset <= 1;
		reset_cnt <= reset_cnt;
	end
	
end

endmodule
