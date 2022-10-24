`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:54:09 10/04/2022 
// Design Name: 
// Module Name:    RMIIRX_TO_RAM 
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
module RMIIRX_TO_RAM(
	input clk,
	input reset,
	input data_valid,
	input config_ing,
	input config_done,
	input [7:0] rec_data,
	output reg [12:0] addr_write,
	output reg [15:0] data_write,
	output reg ena,
	output reg [0:0] wea
    );

reg [1:0] byte_cnt = 0;

//WEA 为写使能，当 ENA 为 1 同时 WEA 为 0 的时候，为读操作；当 ENA 和 WEA 同时为 1 的时候，为写操作；
always@(posedge clk or negedge reset)begin
	if(!reset)begin
		data_write <= 0;
		wea <= 0;
		addr_write <= 0;
		ena <= 0;
	end
	else begin
		wea <= 0;
		ena <= 0;
		if(config_ing)begin
			if(data_valid)begin
				byte_cnt <= byte_cnt + 1;
				if(byte_cnt == 0)
					data_write[15:8] <= rec_data;
				else if(byte_cnt == 1) begin
					data_write[7:0] <= rec_data;
					ena <= 1;
					wea <= 1;
					byte_cnt <= 0;
				end
			end
			if(wea)begin
				addr_write <= addr_write + 1;
			end
		end
		if(config_done)begin
			addr_write <= 0;
		end
	end
end


endmodule
