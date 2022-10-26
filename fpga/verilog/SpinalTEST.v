`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   05:32:00 10/26/2022
// Design Name:   RMII_Ethernet
// Module Name:   /home/ise/Share/Ultrasonic_Sensor/fpga/verilog/SpinalTEST.v
// Project Name:  ultrasonicRadar
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RMII_Ethernet
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SpinalTEST;

	// Inputs
	reg [1:0] rmii_rx_1;
	reg rmii_rxen;
	reg [15:0] tx_data_payload;
	reg tx_data_valid;
	reg clk;
	reg reset;

	// Outputs
	wire [1:0] rmii_tx;
	wire rmii_txv;
	wire [15:0] rx_data_payload;
	wire rx_data_valid;
	wire fe_flag;

	// Instantiate the Unit Under Test (UUT)
	RMII_Ethernet uut (
		.rmii_rx_1(rmii_rx_1), 
		.rmii_rxen(rmii_rxen), 
		.rmii_tx(rmii_tx), 
		.rmii_txv(rmii_txv), 
		.rx_data_payload(rx_data_payload), 
		.rx_data_valid(rx_data_valid), 
		.tx_data_payload(tx_data_payload), 
		.tx_data_valid(tx_data_valid), 
		.fe_flag(fe_flag), 
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		rmii_rx_1 = 0;
		rmii_rxen = 0;
		tx_data_payload = 0;
		tx_data_valid = 0;
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

