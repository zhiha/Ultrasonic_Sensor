`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:05:08 10/10/2022 
// Design Name: 
// Module Name:    LinearInterpolation_Part 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module LinearInterpolation_Part(
	input clk,
	output reg enb,
	output reg [0:0] wea,
	output reg [12:0] read_addr,
	input [15:0] fmcw_data,
	output reg [15:0] cfrbds_data
    );

reg [15:0] d1 = 0;
reg [15:0] d2 = 0;
reg [15:0] d3 = 0;
wire[15:0] d4;
wire[15:0] d5;
wire[15:0] d6;

reg [3:0] cnt = 0;
reg [3:0] inter_cnt = 0;

assign d4 = cnt==3 ? (fmcw_data - d1):(fmcw_data - d3);
assign d5 = (~d4+1);
assign d6 = d5>>3;

always@(posedge clk)begin
	wea <= 1;
	enb <= 0;
	if(cnt == 0)begin
		enb <= 1;
		read_addr <= 0;
		cnt <= cnt + 1;
	end
	else if(cnt == 1)begin
		enb <= 1;
		read_addr <= read_addr + 1;
		cnt <= cnt + 1;
	end
	else if(cnt == 2)begin
		cnt <= cnt + 1;
		d1 <= fmcw_data;
	end
	else if(cnt == 3)begin
		cnt <= cnt + 1;
		if(d4[15]==1)
			d2 <= ~d6+1;
		else
			d2 <= d4>>3;
		d3 <= fmcw_data;
	end
	else if(cnt == 4)begin
		cfrbds_data <= d1;
		d1 <= d1 + d2;
		inter_cnt <= inter_cnt + 1;
		if(inter_cnt == 5)begin
			enb <= 1;
			read_addr <= read_addr + 1;
			if(read_addr == 5999) 
				read_addr <= 0;
		end
		if(inter_cnt == 7)begin
			if(d4[15]==1)
				d2 <= ~d6+1;
			else
				d2 <= d4>>3;
			d1 <= d3;
			d3 <= fmcw_data;
			inter_cnt <= 0;
		end
	end
end



endmodule
