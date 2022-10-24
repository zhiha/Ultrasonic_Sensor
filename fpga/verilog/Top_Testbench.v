`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   05:42:45 09/26/2022
// Design Name:   Ultrasonic_Top
// Module Name:   /home/ise/ultrasonicRadar/Top_Testbench.v
// Project Name:  ultrasonicRadar
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ultrasonic_Top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Top_Testbench;

	// Inputs
	reg RMII_TXEN;
	reg RMII_TXD0_SDIO_CMD;
	reg RMII_TXD1_SDIO_CLK;
	reg RF215_CLKO;
	reg MIC_DATA;

	// Outputs
	wire RMII_CLK;
	wire RMII_RXER_SDIO_D0;
	wire RMII_RXD0_SDIO_D2;
	wire RMII_RXD1_SDIO_D3;
	wire RMII_RXDV_SDIO_D1;
	wire MIC_CLK;
	wire FPGA_LED;
	
	integer outfile;
	reg [4:0] cnt = 0;
	reg [7:0] data_byte = 0;
	reg [7:0] data_valid = 0;

	// Instantiate the Unit Under Test (UUT)
	Ultrasonic_Top uut (
		.RMII_TXEN(RMII_TXEN), 
		.RMII_TXD0_SDIO_CMD(RMII_TXD0_SDIO_CMD), 
		.RMII_TXD1_SDIO_CLK(RMII_TXD1_SDIO_CLK), 
		.RMII_CLK(RMII_CLK), 
		.RMII_RXER_SDIO_D0(RMII_RXER_SDIO_D0), 
		.RMII_RXD0_SDIO_D2(RMII_RXD0_SDIO_D2), 
		.RMII_RXD1_SDIO_D3(RMII_RXD1_SDIO_D3), 
		.RMII_RXDV_SDIO_D1(RMII_RXDV_SDIO_D1), 
		.RF215_CLKO(RF215_CLKO), 
		.MIC_CLK(MIC_CLK), 
		.MIC_DATA(MIC_DATA), 
		.FPGA_LED(FPGA_LED)
	);

	initial begin
		// Initialize Inputs
		RMII_TXEN = 0;
		RMII_TXD0_SDIO_CMD = 0;
		RMII_TXD1_SDIO_CLK = 0;
		RF215_CLKO = 0;
		MIC_DATA = 0;

		// Wait 100 ns for global reset to finish
		#5;
        
		// Add stimulus here
		forever begin
			#10;
			MIC_DATA = {$random}%2;
		end
		
	end
	
	always #5 RF215_CLKO = ~RF215_CLKO;
	
	initial begin 
		outfile = $fopen("/home/ise/data/EthData.txt");
		if(outfile == 0) begin
			$display("can not open the file!");
			$stop;
		end
	end
	
	always@(posedge RMII_CLK)begin
		if(RMII_RXDV_SDIO_D1) begin
			cnt <= cnt + 1;
			data_byte = {RMII_RXD1_SDIO_D3,RMII_RXD0_SDIO_D2,data_byte[7:2]};
		end
		if (cnt == 3) begin
			cnt <= 0;
			$fdisplay(outfile,"%h",data_byte);
		end
	end
      
endmodule

