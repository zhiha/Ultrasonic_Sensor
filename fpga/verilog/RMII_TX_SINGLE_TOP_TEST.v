`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:02:54 09/28/2022
// Design Name:   RMII_TX_TOP
// Module Name:   /home/ise/ultrasonicRadar/RMII_TX_SINGLE_TOP_TEST.v
// Project Name:  ultrasonicRadar
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RMII_TX_TOP
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RMII_TX_SINGLE_TOP_TEST;

	// Inputs
	reg CLK;
	reg RESET;

	// Outputs
	wire RMII0;
	wire RMII1;
	wire RMIIV;

	// Instantiate the Unit Under Test (UUT)
	RMII_TX_TOP uut (
		.CLK(CLK), 
		.RESET(RESET), 
		.RMII0(RMII0), 
		.RMII1(RMII1), 
		.RMIIV(RMIIV)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		RESET = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always #5 CLK = ~CLK;
      
endmodule

