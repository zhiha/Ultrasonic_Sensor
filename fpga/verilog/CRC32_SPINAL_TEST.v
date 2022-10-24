`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:35:10 10/05/2022
// Design Name:   CRCCombinational
// Module Name:   /home/ise/ultrasonicRadar_Debug/CRC32_SPINAL_TEST.v
// Project Name:  ultrasonicRadar
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CRCCombinational
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CRC32_SPINAL_TEST;

	// Inputs
	reg io_cmd_valid;
	reg [0:0] io_cmd_payload_mode;
	reg [7:0] io_cmd_payload_data;
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] io_crc;

	// Instantiate the Unit Under Test (UUT)
	CRCCombinational uut (
		.io_cmd_valid(io_cmd_valid), 
		.io_cmd_payload_mode(io_cmd_payload_mode), 
		.io_cmd_payload_data(io_cmd_payload_data), 
		.io_crc(io_crc), 
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		io_cmd_valid = 0;
		io_cmd_payload_mode = 0;
		io_cmd_payload_data = 0;
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
		io_cmd_payload_mode = 0;
		io_cmd_valid = 1;
		#20;
		io_cmd_payload_mode = 1;
		io_cmd_valid = 1;
		io_cmd_payload_data = 8'h11;

        
		// Add stimulus here

	end
	
	always #5 clk = ~clk;

