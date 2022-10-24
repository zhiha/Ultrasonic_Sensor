`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:37:18 10/04/2022
// Design Name:   RMII_TX_RX_LOOP_TOP
// Module Name:   /home/ise/ultrasonicRadar_Debug/LOOP_TEST.v
// Project Name:  ultrasonicRadar
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RMII_TX_RX_LOOP_TOP
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module LOOP_TEST;

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
	
	integer i = 0;

	// Instantiate the Unit Under Test (UUT)
	RMII_TX_RX_LOOP_TOP uut (
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
		RMII_TXEN <= 1;
		//sychr code
		for (i = 0; i < 7; i=i+1)begin
			RMII_TXD0 <= 1;
			RMII_TXD1 <= 0;
			#10;
			RMII_TXD0 <= 1;
			RMII_TXD1 <= 0;
			#10;
			RMII_TXD0 <= 1;
			RMII_TXD1 <= 0;
			#10;
			RMII_TXD0 <= 1;
			RMII_TXD1 <= 0;
			#10;
		end
		RMII_TXD0 <= 1;
		RMII_TXD1 <= 0;
		#10;
		RMII_TXD0 <= 1;
		RMII_TXD1 <= 0;
		#10;
		RMII_TXD0 <= 1;
		RMII_TXD1 <= 0;
		#10;
		RMII_TXD0 <= 1;
		RMII_TXD1 <= 1;
		#10;
		
		for (i = 0; i < 2; i=i+1)begin
		//11
			RMII_TXD0 <= 1;
			RMII_TXD1 <= 0;
			#10;
			RMII_TXD0 <= 0;
			RMII_TXD1 <= 0;
			#10;
			RMII_TXD0 <= 1;
			RMII_TXD1 <= 0;
			#10;
			RMII_TXD0 <= 0;
			RMII_TXD1 <= 0;
			#10;
		//22
			RMII_TXD0 <= 0;
			RMII_TXD1 <= 1;
			#10;
			RMII_TXD0 <= 0;
			RMII_TXD1 <= 0;
			#10;
			RMII_TXD0 <= 0;
			RMII_TXD1 <= 1;
			#10;
			RMII_TXD0 <= 0;
			RMII_TXD1 <= 0;
			#10;
		//33
			RMII_TXD0 <= 1;
			RMII_TXD1 <= 1;
			#10;
			RMII_TXD0 <= 0;
			RMII_TXD1 <= 0;
			#10;
			RMII_TXD0 <= 1;
			RMII_TXD1 <= 1;
			#10;
			RMII_TXD0 <= 0;
			RMII_TXD1 <= 0;
			#10;
		//44
			RMII_TXD0 <= 0;
			RMII_TXD1 <= 0;
			#10;
			RMII_TXD0 <= 1;
			RMII_TXD1 <= 0;
			#10;
			RMII_TXD0 <= 0;
			RMII_TXD1 <= 0;
			#10;
			RMII_TXD0 <= 1;
			RMII_TXD1 <= 0;
			#10;
		//55
			RMII_TXD0 <= 1;
			RMII_TXD1 <= 0;
			#10;
			RMII_TXD0 <= 1;
			RMII_TXD1 <= 0;
			#10;
			RMII_TXD0 <= 1;
			RMII_TXD1 <= 0;
			#10;
			RMII_TXD0 <= 1;
			RMII_TXD1 <= 0;
			#10;
		//66
			RMII_TXD0 <= 0;
			RMII_TXD1 <= 1;
			#10;
			RMII_TXD0 <= 1;
			RMII_TXD1 <= 0;
			#10;
			RMII_TXD0 <= 0;
			RMII_TXD1 <= 1;
			#10;
			RMII_TXD0 <= 1;
			RMII_TXD1 <= 0;
			#10;
		end
		
		//0900
		RMII_TXD0 <= 1;
		RMII_TXD1 <= 0;
		#10;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 1;
		#10;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;
		#10;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;
		#10;
		
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;
		#10;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;
		#10;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;
		#10;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;
		#10;
		
		//len  2
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;
		#10;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;
		#10;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;
		#10;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;
		#10;
		
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 1;
		#10;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;
		#10;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;
		#10;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;
		#10;
		
		//data
		RMII_TXD0 <= 1;
		RMII_TXD1 <= 1;
		#10;
		RMII_TXD0 <= 1;
		RMII_TXD1 <= 1;
		#10;
		RMII_TXD0 <= 1;
		RMII_TXD1 <= 1;
		#10;
		RMII_TXD0 <= 1;
		RMII_TXD1 <= 1;
		#10;
		
		RMII_TXD0 <= 1;
		RMII_TXD1 <= 1;
		#10;
		RMII_TXD0 <= 1;
		RMII_TXD1 <= 1;
		#10;
		RMII_TXD0 <= 1;
		RMII_TXD1 <= 1;
		#10;
		RMII_TXD0 <= 1;
		RMII_TXD1 <= 1;
		#10;
		RMII_TXEN <= 0;		
			
        
		// Add stimulus here
		
		
		
		

	end
	
	always #5 RF215_CLKO = ~ RF215_CLKO;
      
endmodule

