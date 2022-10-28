`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:40:15 10/28/2022
// Design Name:   CFRBDS
// Module Name:   /home/ise/Share/Ultrasonic_Sensor/fpga/verilog/CFRBDS_TEST.v
// Project Name:  ultrasonicRadar
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CFRBDS
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CFRBDS_TEST;

   parameter N = 4000;
	integer data,data_read,i;
	integer outfile;

	// Inputs
	reg [15:0] mem[N:1];
	reg [63:0] cnt = 1;
	reg [63:0] cnt_out = 0;
	
	reg [15:0] io_d_d = 0;
	reg io_flush;
	reg clk;
	reg reset;

	// Outputs
	wire io_v;

	// Instantiate the Unit Under Test (UUT)
	CFRBDS uut (
		.io_d_d(io_d_d), 
		.io_v(io_v), 
		.io_flush(io_flush), 
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		io_d_d = 0;
		io_flush = 0;
		clk = 0;;
		reset = 0;
		
		#10;
		io_d_d <= 0;
		reset <= 1;
		io_flush <= 1;
		
		#10;
		io_d_d <= 0;
		reset <= 0;
		
		#10;
		io_d_d <= 0;
		io_flush <= 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	initial begin
		data = $fopen("/home/ise/Share/Ultrasonic_Python/sigmadeltaDataDecimal.txt","r");
		for(i=1;i<N+1;i=i+1)begin
			data_read = $fscanf(data,"%d",mem[i]);
		end
	end
	
	initial begin
		#100
		forever
		begin
			@(posedge clk);
				cnt <= cnt + 1;
				if(cnt==4000) cnt <= 1;
				io_d_d <= mem[cnt];
		end
	end
	
	always #5 clk = ~clk;
	
	initial begin
		outfile = $fopen("/home/ise/Share/Ultrasonic_Python/sigmadeltaDecimalOutput.txt");
		if(outfile==0)begin
			$display("can not openg the file!");
			$stop;
		end
	end
	
	initial begin
		#100;
		forever
		begin
			@(posedge clk)	
			cnt_out <= cnt_out + 1;
			if(cnt_out < 96000)begin
				$fdisplay(outfile,"%d",io_v);
			end
			else begin
				cnt_out <= cnt_out;
			end
		end
	end
	
      
endmodule

