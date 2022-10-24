`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:51:56 09/25/2022 
// Design Name: 
// Module Name:    PDM_MIC 
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
module PDM_MIC(
	input CLK,
	input RESET,
	input RX_DATA_BIT,
	output [31:0] DATA_MIC,
	output TX_START_EN,
	output [15:0]TX_BYTE_NUM,
	output FIFO_WR_EN
    );

//parameter
localparam DATA_LEN = 16'd1440;

//resource	
reg SELECT = 1;
reg [4:0] RX_CNT = 5'd0;  //Record the bit sequence
reg [7:0] RX_DATA;
reg [3:0] BYTE_CNT = 4'b0;
reg [31:0] DATA;
reg [15:0] DATA_CNT = 16'b0;
reg RX_BYTE_DONE_FLAG = 1'b0;
reg START_EN = 0;
reg FIFO_WREN = 1'b0;

//assign DATA = 32'b0101_0101_0101_0101_0101_0101_0101_0101;
assign DATA_MIC = 32'b0100_1110_0111_0011_1011_1110_0110_0000;
assign TX_BYTE_NUM = 16'd1440;
assign MIC_CLK = CLK;
assign TX_START_EN = START_EN;
assign FIFO_WR_EN = FIFO_WREN;

always@(posedge CLK or negedge RESET)begin
	if(!RESET)begin
		RX_CNT <= 0;
		RX_DATA <= 0;
		RX_BYTE_DONE_FLAG <= 0;
	end
	else begin
		if(RX_CNT == 0)begin
			RX_BYTE_DONE_FLAG <= 0;
			RX_DATA[7] <= RX_DATA_BIT;
			RX_CNT <= RX_CNT + 1;
		end
		else if(RX_CNT == 1)begin
			RX_DATA[6] <= RX_DATA_BIT;
			RX_CNT <= RX_CNT + 1;
		end
		else if(RX_CNT == 2)begin
			RX_DATA[5] <= RX_DATA_BIT;
			RX_CNT <= RX_CNT + 1;
		end
		else if(RX_CNT == 3)begin
			RX_DATA[4] <= RX_DATA_BIT;
			RX_CNT <= RX_CNT + 1;
		end
		else if(RX_CNT == 4)begin
			RX_DATA[3] <= RX_DATA_BIT;
			RX_CNT <= RX_CNT + 1;
		end
		else if(RX_CNT == 5)begin
			RX_DATA[2] <= RX_DATA_BIT;
			RX_CNT <= RX_CNT + 1;
		end
		else if(RX_CNT == 6)begin
			RX_DATA[1] <= RX_DATA_BIT;
			RX_CNT <= RX_CNT + 1;
		end
		else if(RX_CNT == 7)begin
			RX_DATA[0] <= RX_DATA_BIT;
			RX_CNT <= 0;
			RX_BYTE_DONE_FLAG <= 1;
		end
	end
end

always@(posedge CLK or negedge RESET)begin
	if(!RESET)begin
		BYTE_CNT <= 0;
		DATA <= 0;
		DATA_CNT <= 0;
	end
	else begin
		START_EN <= 0;
		FIFO_WREN <= 0;
		if(RX_BYTE_DONE_FLAG == 1)begin
			BYTE_CNT <= BYTE_CNT + 1;
			DATA_CNT <= DATA_CNT + 1;
			if(DATA_CNT == DATA_LEN - 1)begin
				BYTE_CNT <= 0;
				DATA_CNT <= 0;
				START_EN <= 1;
			end
			if(BYTE_CNT == 0)
				DATA[31:24] <= RX_DATA;
			else if(BYTE_CNT == 1)
				DATA[23:16] <= RX_DATA;
			else if(BYTE_CNT == 2)
				DATA[15:8] <= RX_DATA;
			else if(BYTE_CNT == 3)begin
				DATA[7:0] <= RX_DATA;
				BYTE_CNT <= 0;
				FIFO_WREN <= 1;
			end
		end
	end
end

endmodule
