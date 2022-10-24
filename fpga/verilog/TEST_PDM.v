`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:50:34 09/25/2022
// Design Name:   PDM_MIC
// Module Name:   /home/ise/ultrasonicRadar/TEST_PDM.v
// Project Name:  ultrasonicRadar
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PDM_MIC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TEST_PDM;

	// Inputs
	reg CLK;
	reg RESET;
	reg RX_DATA_BIT;

	// Outputs
	wire MIC_CLK;
	wire MIC_SELECT;
	wire [31:0] DATA_MIC;
	wire TX_START_EN;
	wire [15:0] TX_BYTE_NUM;
	
	// Instantiate the Unit Under Test (UUT)
	PDM_MIC uut (
		.CLK(CLK), 
		.RESET(RESET), 
		.RX_DATA_BIT(RX_DATA_BIT), 
		.MIC_CLK(MIC_CLK), 
		.MIC_SELECT(MIC_SELECT), 
		.DATA_MIC(DATA_MIC), 
		.TX_START_EN(TX_START_EN), 
		.TX_BYTE_NUM(TX_BYTE_NUM)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		RESET = 0;
		RX_DATA_BIT = 0;

		// Wait 100 ns for global reset to finish
		#5;
		RESET = 1;
		#5
		forever begin
			#10;
			RX_DATA_BIT = {$random}%2;
		end
        
		// Add stimulus here

	end
	
	always #5 CLK = ~CLK;
      
endmodule

