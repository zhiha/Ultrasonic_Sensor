`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:43:30 09/28/2022
// Design Name:   RMII_SINGLE_TX
// Module Name:   /home/ise/ultrasonicRadar/RMII_SINGLE_TX_TEST.v
// Project Name:  ultrasonicRadar
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RMII_SINGLE_TX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RMII_SINGLE_TX_TEST;

	// Inputs
	reg clk;
	reg reset;
	reg [31:0] crc_dout;
	reg crc_dout_valid;

	// Outputs
	wire rmii0;
	wire rmii1;
	wire rmiiv;
	wire crc_clear;
	wire [7:0] crc_din;
	wire crc_din_valid;

	// Instantiate the Unit Under Test (UUT)
	RMII_SINGLE_TX uut (
		.clk(clk), 
		.reset(reset), 
		.rmii0(rmii0), 
		.rmii1(rmii1), 
		.rmiiv(rmiiv), 
		.crc_dout(crc_dout), 
		.crc_dout_valid(crc_dout_valid), 
		.crc_clear(crc_clear), 
		.crc_din(crc_din), 
		.crc_din_valid(crc_din_valid)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		crc_dout = 0;
		crc_dout_valid = 0;
		#10
		reset = 0;
		#10
		reset = 1;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always #5 clk = ~clk;
      
endmodule

