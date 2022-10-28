`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:52:09 10/21/2022
// Design Name:   Ultrasonic_Radar_Top
// Module Name:   /home/ise/ultrasonicRadar_Test_V1.1/Ultrasonic_Radar_MUL_Top_Test.v
// Project Name:  ultrasonicRadar
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ultrasonic_Radar_Top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Ultrasonic_Radar_MUL_Top_Test;

	// Inputs
	reg RF215_CLKO;
	reg RMII_TXEN;
	reg RMII_TXD0;
	reg RMII_TXD1;
	reg FE_RXD1;
	reg FE_RXD2;
	reg FE_RXD3;
	reg FE_RXD4;
	reg FE_RXD5;
	reg FE_RXD6;
	reg FE_RXD7;
	reg FE_RXD8;
	reg FE_RXD9;

	// Outputs
	wire RMII0;
	wire RMII1;
	wire RMIIV;
	wire RMII_CLK;
	wire RMII_RXER_SDIO_D0;
	wire FE_TXD1;
	wire FE_TXD2;
	wire FE_TXD3;
	wire FE_TXD4;
	wire FE_RXCLK;
	wire FPGA_LED;
	
	integer i;

	// Instantiate the Unit Under Test (UUT)
	Ultrasonic_Radar_Top uut (
		.RF215_CLKO(RF215_CLKO), 
		.RMII_TXEN(RMII_TXEN), 
		.RMII_TXD0(RMII_TXD0), 
		.RMII_TXD1(RMII_TXD1), 
		.RMII0(RMII0), 
		.RMII1(RMII1), 
		.RMIIV(RMIIV), 
		.RMII_CLK(RMII_CLK), 
		.RMII_RXER_SDIO_D0(RMII_RXER_SDIO_D0), 
		.FE_TXD1(FE_TXD1), 
		.FE_TXD2(FE_TXD2), 
		.FE_TXD3(FE_TXD3), 
		.FE_TXD4(FE_TXD4), 
		.FE_RXD1(FE_RXD1), 
		.FE_RXD2(FE_RXD2), 
		.FE_RXD3(FE_RXD3), 
		.FE_RXD4(FE_RXD4), 
		.FE_RXD5(FE_RXD5), 
		.FE_RXD6(FE_RXD6), 
		.FE_RXD7(FE_RXD7), 
		.FE_RXD8(FE_RXD8), 
		.FE_RXD9(FE_RXD9), 
		.FE_RXCLK(FE_RXCLK), 
		.FPGA_LED(FPGA_LED)
	);

	initial begin
		// Initialize Inputs
		RF215_CLKO = 0;
		RMII_TXEN = 0;
		RMII_TXD0 = 0;
		RMII_TXD1 = 0;
		FE_RXD1 = 0;
		FE_RXD2 = 0;
		FE_RXD3 = 0;
		FE_RXD4 = 0;
		FE_RXD5 = 0;
		FE_RXD6 = 0;
		FE_RXD7 = 0;
		FE_RXD8 = 0;
		FE_RXD9 = 0;

		// Wait 100 ns for global reset to finish
		// Wait 100 ns for global reset to finish
		#300;
		RMII_TXEN <= 1;
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
		
		//0a00
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 1;
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
		RMII_TXEN <= 1;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;	
		#10;
		RMII_TXEN <= 1;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;	
		#10;
		RMII_TXEN <= 0;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;		
		
        
		// Add stimulus here
		#800;
		RMII_TXEN <= 1;
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
		
		//0a00
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 1;
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
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 1;
		#10;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 1;
		#10;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 1;
		#10;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 1;
		#10;
		
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 1;
		#10;
		RMII_TXD0 <= 1;
		RMII_TXD1 <= 1;
		#10;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 1;
		#10;
		RMII_TXD0 <= 1;
		RMII_TXD1 <= 1;
		#10;
		RMII_TXEN <= 1;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;
		#10;
		RMII_TXEN <= 1;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;	
		#10;
		RMII_TXEN <= 1;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;	
		#10;
		RMII_TXEN <= 0;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;
		
		
		
		#800;
		RMII_TXEN <= 1;
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
		
		//0a00
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 1;
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
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 1;
		#10;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 1;
		#10;
		
		RMII_TXD0 <= 1;
		RMII_TXD1 <= 1;
		#10;
		RMII_TXD0 <= 1;
		RMII_TXD1 <= 1;
		#10;
		RMII_TXD0 <= 1;
		RMII_TXD1 <= 0;
		#10;
		RMII_TXD0 <= 1;
		RMII_TXD1 <= 0;
		#10;
		RMII_TXEN <= 1;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;
		#10;
		RMII_TXEN <= 1;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;	
		#10;
		RMII_TXEN <= 1;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;	
		#10;
		RMII_TXEN <= 0;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;
		
		#800;
		RMII_TXEN <= 1;
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
		
		//0a00
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 1;
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
		RMII_TXEN <= 1;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;
		#10;
		RMII_TXEN <= 1;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;	
		#10;
		RMII_TXEN <= 1;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;	
		#10;
		RMII_TXEN <= 0;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;
		
		#800;
		RMII_TXEN <= 1;
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
		
		//0b00
		RMII_TXD0 <= 1;
		RMII_TXD1 <= 1;
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
		RMII_TXEN <= 1;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;
		#10;
		RMII_TXEN <= 1;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;	
		#10;
		RMII_TXEN <= 1;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;	
		#10;
		RMII_TXEN <= 0;
		RMII_TXD0 <= 0;
		RMII_TXD1 <= 0;		
	end
	
	always #5 RF215_CLKO = ~ RF215_CLKO;
        
		// Add stimulus here


      
endmodule

