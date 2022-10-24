`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:49:13 09/28/2022
// Design Name:   RMII_TX_TOP
// Module Name:   /home/ise/ultrasonicRadar/RMII_TX_TOP_TEST.v
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

module RMII_TX_TOP_TEST;

	// Inputs
	reg RF215_CLKO;
	reg RMII_TXEN;
	reg RMII_TXD0;
	reg RMII_TXD1;

	// Outputs
	wire RMII0;
	wire RMII1;
	wire RMIIV;
	wire RMII_CLK;
	wire RMII_RXER_SDIO_D0;
	wire FPGA_LED;

	// Instantiate the Unit Under Test (UUT)
	RMII_TX_TOP uut (
		.RF215_CLKO(RF215_CLKO), 
		.RMII_TXEN(RMII_TXEN), 
		.RMII_TXD0(RMII_TXD0), 
		.RMII_TXD1(RMII_TXD1), 
		.RMII0(RMII0), 
		.RMII1(RMII1), 
		.RMIIV(RMIIV), 
		.RMII_CLK(RMII_CLK), 
		.RMII_RXER_SDIO_D0(RMII_RXER_SDIO_D0), 
		.FPGA_LED(FPGA_LED)
	);

	initial begin
		// Initialize Inputs
		RF215_CLKO = 0;
		RMII_TXEN = 0;
		RMII_TXD0 = 0;
		RMII_TXD1 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always #5 RF215_CLKO = ~RF215_CLKO;
      
endmodule

