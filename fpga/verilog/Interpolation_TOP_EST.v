`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:28:53 10/11/2022
// Design Name:   Interpolation_TOP
// Module Name:   /home/ise/ultrasonicRadar_Debug_1.2/Interpolation_TOP_EST.v
// Project Name:  ultrasonicRadar
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Interpolation_TOP
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Interpolation_TOP_EST;

	// Inputs
	reg CLK;
	
	reg[15:0] result = 0;

	
	integer outfile;

	// Instantiate the Unit Under Test (UUT)
	Interpolation_TOP uut (
		.CLK(CLK)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;

		// Wait 100 ns for global reset to finish
		#100;
      

	end
	
	initial begin
		outfile = $fopen("/home/ise/Share/interpolation_data.txt");
		if(outfile == 0)begin
			$display("can not open the file!");
			$stop;
		end
	end
	
	always@(posedge CLK)
	begin
		result <= uut.LinearInterpolation_Part_1.cfrbds_data;
		$fdisplay(outfile,"%d",$signed(uut.LinearInterpolation_Part_1.cfrbds_data));
	end
	

	
	always #5 CLK = ~CLK;
	
	
      
endmodule

