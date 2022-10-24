`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:30:26 09/23/2022 
// Design Name: 
// Module Name:    PDM_MIC
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
module PDM_MIC(
	input CLK,
	input RESET,
	input DATA_READ,
	output MIC_CLK,
	output MIC_SELECT,
	output [31:0] DATA_MIC,
    );
	
reg SELECT = 0;
assign MIC_SELECT = SELECT;
assign DATA_MIC = DATA_READ;

always@(CLK)begin
	SELECT <= SELECT + 1;
end


endmodule
