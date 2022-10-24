`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:51:06 07/29/2021 
// Design Name: 
// Module Name:    RMII_tx 
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
module RMII_TX(
    input                CLK        ,    
    input                RESET      ,    
    input                TX_START_EN,    
    input        [31:0]  TX_DATA    ,  
	 input 		  [31:0]  TX_DATA_MIC,
    input        [15:0]  TX_BYTE_NUM,   
	 input        [31:0]  CRC_DATA   ,   
    input        [3:0]   CRC_NEXT   ,   
    output  reg          TX_DONE    ,   
    output  reg          TX_REQ     ,   
    output  reg          RMII_RXDV  ,   
    output  reg          RMII_RXD0  ,   
	 output  reg          RMII_RXD1  ,  
	 output  reg          CRC_EN     ,   
    output  reg          CRC_CLR    ,
	 output  reg          FIFO_RD_EN 
    );

// parameter define 
localparam BOARD_MAC = 48'h11_22_33_44_55_66;
localparam DES_MAC = 48'hd6_22_2f_cf_7e_d1;
localparam ETH_TYPE = 16'h0900; //IP PROTOCOL
localparam MIN_DATA_NUM = 16'd46; 

// ETH PROTOCOL
localparam ST_IDLE = 7'b000_0001;
localparam ST_PREAMBLE = 7'b000_0010;
localparam ST_ETH_HEAD = 7'b000_0100;
localparam ST_LEN = 7'b000_1000;
localparam ST_TX_DATA = 7'b001_0000;
localparam ST_CRC = 7'b010_0000;

//resource
reg [6:0] CUR_STATE;
reg [6:0] NEXT_STATE;
reg [7:0] PREAMBLE[7:0];
reg [7:0] ETH_HEAD[13:0];
reg START_EN_D0;
reg START_EN_D1;
reg [15:0] TX_DATA_NUM;
reg SKIP_EN;
reg [4:0] CNT = 5'd0;
reg [2:0] TX_BIT_SEL = 3'b0;
reg [15:0] DATA_CNT = 16'b0;
reg TX_DONE_T;
reg [5:0] REAL_ADD_CNT = 6'b0;
reg [31:0] DEBUG_CNT = 32'b0;

//wire define
wire POS_START_EN;
wire [15:0] REAL_TX_DATA_NUM;

initial begin 
	PREAMBLE[0] <= 8'h55;                 
	PREAMBLE[1] <= 8'h55;
	PREAMBLE[2] <= 8'h55;
	PREAMBLE[3] <= 8'h55;
	PREAMBLE[4] <= 8'h55;
	PREAMBLE[5] <= 8'h55;
	PREAMBLE[6] <= 8'h55;
	PREAMBLE[7] <= 8'hd5;
	//
	ETH_HEAD[0] <= DES_MAC[47:40];
	ETH_HEAD[1] <= DES_MAC[39:32];
	ETH_HEAD[2] <= DES_MAC[31:24];
	ETH_HEAD[3] <= DES_MAC[23:16];
	ETH_HEAD[4] <= DES_MAC[15:8];
	ETH_HEAD[5] <= DES_MAC[7:0];
	//
	ETH_HEAD[6] <= BOARD_MAC[47:40];
	ETH_HEAD[7] <= BOARD_MAC[39:32];
	ETH_HEAD[8] <= BOARD_MAC[31:24];
	ETH_HEAD[9] <= BOARD_MAC[23:16];
	ETH_HEAD[10] <= BOARD_MAC[15:8];
	ETH_HEAD[11] <= BOARD_MAC[7:0];
	//
	ETH_HEAD[12] <= ETH_TYPE[15:8];
	ETH_HEAD[13] <= ETH_TYPE[7:0];      
end

//**********************************************//
//**						MAIN PART                **//
//**********************************************//
//					TRANSMIT DATA TO ARM            //
assign POS_START_EN = (~START_EN_D1) & (START_EN_D0); //THE POSEDGE OF STARTING TRANSMITTING DATA
assign REAL_TX_DATA_NUM = (TX_DATA_NUM >= MIN_DATA_NUM) ? TX_DATA_NUM : MIN_DATA_NUM;

//find the posedge of TX_START_EN
always@(posedge CLK or negedge RESET) begin
	if(!RESET) begin
		START_EN_D0 <= 1'b0;
		START_EN_D1 <= 1'b0;
	end
	else begin
		START_EN_D0 <= TX_START_EN;
		START_EN_D1 <= START_EN_D0;
	end
end

//SAVE EFFECTIVE DATA
always@(posedge CLK or negedge RESET) begin
	if(!RESET)begin
		TX_DATA_NUM <= 16'b0;
	end
	else begin
		if(POS_START_EN && CUR_STATE==ST_IDLE)
			TX_DATA_NUM <= TX_BYTE_NUM;
	end
end

always@(posedge CLK or negedge RESET) begin
	if(!RESET)
		CUR_STATE <= ST_IDLE;
	else
		CUR_STATE <= NEXT_STATE;
		
//	if(RMII_RXDV == 1)
//		DEBUG_CNT <= DEBUG_CNT + 1;
		
end

always@(*)begin
	NEXT_STATE = ST_IDLE;
	case(CUR_STATE)
		ST_IDLE:begin
			if(SKIP_EN)
				NEXT_STATE = ST_PREAMBLE;
			else
				NEXT_STATE = ST_IDLE;
		end
		ST_PREAMBLE:begin
			if(SKIP_EN)
				NEXT_STATE = ST_ETH_HEAD;
			else
				NEXT_STATE = ST_PREAMBLE;
		end
		ST_ETH_HEAD:begin
			if(SKIP_EN)
				NEXT_STATE = ST_LEN;
			else
				NEXT_STATE = ST_ETH_HEAD;
		end
		ST_LEN:begin
			if(SKIP_EN)
				NEXT_STATE = ST_TX_DATA;
			else
				NEXT_STATE = ST_LEN;
		end
		ST_TX_DATA:begin
			if(SKIP_EN)
				NEXT_STATE = ST_CRC;
			else 
				NEXT_STATE = ST_TX_DATA;
		end
		ST_CRC:begin
			if(SKIP_EN)
				NEXT_STATE = ST_IDLE;
			else
				NEXT_STATE = ST_CRC;
		end
		default: NEXT_STATE = ST_IDLE;
	endcase
end

always@(posedge CLK or negedge RESET) begin
	if(!RESET) begin
		SKIP_EN <= 1'b0;
		CRC_EN <= 1'b0;
		CNT <= 5'd0;
		TX_BIT_SEL <= 3'b0;
		RMII_RXDV <= 1'b0;
		RMII_RXD0 <= 1'b0;
		RMII_RXD1 <= 1'b0;
		TX_REQ <= 1'b0;
		TX_DONE_T <= 1'b0;
		DATA_CNT <= 16'd0;
		REAL_ADD_CNT <= 6'd0;
		//
		PREAMBLE[0] <= 8'h55;                 
      PREAMBLE[1] <= 8'h55;
      PREAMBLE[2] <= 8'h55;
      PREAMBLE[3] <= 8'h55;
      PREAMBLE[4] <= 8'h55;
      PREAMBLE[5] <= 8'h55;
      PREAMBLE[6] <= 8'h55;
      PREAMBLE[7] <= 8'hd5;
      //
      ETH_HEAD[0] <= DES_MAC[47:40];
      ETH_HEAD[1] <= DES_MAC[39:32];
      ETH_HEAD[2] <= DES_MAC[31:24];
      ETH_HEAD[3] <= DES_MAC[23:16];
      ETH_HEAD[4] <= DES_MAC[15:8];
      ETH_HEAD[5] <= DES_MAC[7:0];
      //
      ETH_HEAD[6] <= BOARD_MAC[47:40];
      ETH_HEAD[7] <= BOARD_MAC[39:32];
      ETH_HEAD[8] <= BOARD_MAC[31:24];
      ETH_HEAD[9] <= BOARD_MAC[23:16];
      ETH_HEAD[10] <= BOARD_MAC[15:8];
      ETH_HEAD[11] <= BOARD_MAC[7:0];
      //
      ETH_HEAD[12] <= ETH_TYPE[15:8];
      ETH_HEAD[13] <= ETH_TYPE[7:0];        
	end
	else begin
		SKIP_EN <= 1'b0;
		TX_REQ <= 1'b0;
		CRC_EN <= 1'b0;
		RMII_RXDV <= 1'b0;
		TX_DONE_T <= 1'b0;
		case(CUR_STATE)
			ST_IDLE:begin
				if(POS_START_EN)
					SKIP_EN <= 1'b1;
			end
			ST_PREAMBLE:begin
				RMII_RXDV <= 1'b1;
				if(TX_BIT_SEL == 3'd0) begin
					TX_BIT_SEL <= TX_BIT_SEL + 3'd1;
					RMII_RXD0 <= PREAMBLE[CNT][0];
					RMII_RXD1 <= PREAMBLE[CNT][1];
				end
				else if(TX_BIT_SEL == 3'd1) begin
					TX_BIT_SEL <= TX_BIT_SEL + 3'd1;
					RMII_RXD0 <= PREAMBLE[CNT][2];
					RMII_RXD1 <= PREAMBLE[CNT][3];
				end
				else if(TX_BIT_SEL == 3'd2) begin
					TX_BIT_SEL <= TX_BIT_SEL + 3'd1;
					RMII_RXD0 <= PREAMBLE[CNT][4];
					RMII_RXD1 <= PREAMBLE[CNT][5];
					if(CNT == 5'd7)
						SKIP_EN <= 1'b1;
				end
				else begin
					TX_BIT_SEL <= 3'b0;
					RMII_RXD0 <= PREAMBLE[CNT][6];
					RMII_RXD1 <= PREAMBLE[CNT][7];
					if(CNT == 5'd7) begin
						CNT <= 0;
					end
					else
						CNT <= CNT + 1;
				end
			end
			ST_ETH_HEAD:begin
				RMII_RXDV <= 1'b1;
				CRC_EN <= 1'b1;
				if(TX_BIT_SEL == 3'd0) begin
					TX_BIT_SEL <= TX_BIT_SEL + 3'd1;
					RMII_RXD0 <= ETH_HEAD[CNT][0];
					RMII_RXD1 <= ETH_HEAD[CNT][1];
				end
				else if(TX_BIT_SEL == 3'd1) begin
					TX_BIT_SEL <= TX_BIT_SEL + 3'd1;
					RMII_RXD0 <= ETH_HEAD[CNT][2];
					RMII_RXD1 <= ETH_HEAD[CNT][3];
				end
				else if(TX_BIT_SEL == 3'd2) begin
					TX_BIT_SEL <= TX_BIT_SEL + 3'd1;
					RMII_RXD0 <= ETH_HEAD[CNT][4];
					RMII_RXD1 <= ETH_HEAD[CNT][5];
					if(CNT == 5'd13)
						SKIP_EN <= 1'b1;
				end
				else begin
					TX_BIT_SEL <= 3'd0;
					RMII_RXD0 <= ETH_HEAD[CNT][6];
					RMII_RXD1 <= ETH_HEAD[CNT][7];
					if(CNT == 5'd13) begin
						CNT <= 0;
					end
					else
						CNT <= CNT + 1;
				end
			end
			ST_LEN:begin
				RMII_RXDV <= 1'b1;
				CRC_EN <= 1'b1;
				if(TX_BIT_SEL == 3'd0) begin
					TX_BIT_SEL <= TX_BIT_SEL + 3'd1;
					RMII_RXD0 <= TX_BYTE_NUM[8-CNT*8+0];
					RMII_RXD1 <= TX_BYTE_NUM[8-CNT*8+1];
				end
				else if(TX_BIT_SEL == 3'd1) begin
					TX_BIT_SEL <= TX_BIT_SEL + 3'd1;
					RMII_RXD0 <= TX_BYTE_NUM[8-CNT*8+2];
					RMII_RXD1 <= TX_BYTE_NUM[8-CNT*8+3];
				end
				else if(TX_BIT_SEL == 3'd2) begin
					TX_BIT_SEL <= TX_BIT_SEL + 3'd1;
					RMII_RXD0 <= TX_BYTE_NUM[8-CNT*8+4];
					RMII_RXD1 <= TX_BYTE_NUM[8-CNT*8+5];
					if(CNT == 5'd1)begin
						FIFO_RD_EN <= 1'b1;
						SKIP_EN <= 1'b1;
					end
				end
				else begin
					TX_BIT_SEL <= 3'd0;
					RMII_RXD0 <= TX_BYTE_NUM[8-CNT*8+6];
					RMII_RXD1 <= TX_BYTE_NUM[8-CNT*8+7];
					if(CNT == 5'd1) begin
						CNT <= 0;
						FIFO_RD_EN <= 1'b0;
					end
					else
						CNT <= CNT + 1;
				end
			end
			ST_TX_DATA:begin
				RMII_RXDV <= 1'b1;
				CRC_EN <= 1'b1;
				TX_BIT_SEL <= TX_BIT_SEL + 3'd1;
				FIFO_RD_EN <= 1'b0;
				if(TX_BIT_SEL == 3'd2) begin
					FIFO_RD_EN <= 1'b1;
					if(DATA_CNT < TX_DATA_NUM - 16'd1)
						DATA_CNT <= DATA_CNT + 16'd1;
					else if(DATA_CNT == TX_DATA_NUM - 16'd1)begin
						if(DATA_CNT + REAL_ADD_CNT < REAL_TX_DATA_NUM - 16'd1)
							REAL_ADD_CNT <= REAL_ADD_CNT + 1;
						else
							SKIP_EN <= 1'b1;
							FIFO_RD_EN <= 1'b0;
					end
				end
				if(TX_BIT_SEL == 3'd0) begin
					RMII_RXD0 <= TX_DATA_MIC[24-CNT*8+0];//TX_DATA[24-CNT*8+0];
					RMII_RXD1 <= TX_DATA_MIC[24-CNT*8+1];//TX_DATA[24-CNT*8+1];
				end
				else if(TX_BIT_SEL == 3'd1) begin
					RMII_RXD0 <= TX_DATA_MIC[24-CNT*8+2];//TX_DATA[24-CNT*8+2];
					RMII_RXD1 <= TX_DATA_MIC[24-CNT*8+3];//TX_DATA[24-CNT*8+3];
				end
				else if(TX_BIT_SEL == 3'd2) begin
					RMII_RXD0 <= TX_DATA_MIC[24-CNT*8+4];//TX_DATA[24-CNT*8+4];
					RMII_RXD1 <= TX_DATA_MIC[24-CNT*8+5];//TX_DATA[24-CNT*8+5];
				end
				else begin
					RMII_RXD0 <= TX_DATA_MIC[24-CNT*8+6];
					RMII_RXD1 <= TX_DATA_MIC[24-CNT*8+7];
					if(DATA_CNT == 1)begin
						RMII_RXD0 <= 1;
						RMII_RXD1 <= 1;
					end
					TX_BIT_SEL <= 3'd0;
					if(CNT == 5'd3)begin
						CNT <= 0;
					end
					else
						CNT <= CNT + 1;
				end
				if(SKIP_EN) begin
					DATA_CNT <= 16'd0;
					REAL_ADD_CNT <= 5'd0;
					TX_BIT_SEL <= 3'd0;
					CNT <= 5'd0;
					FIFO_RD_EN <= 1'b0;
				end
			end
			ST_CRC:begin
				RMII_RXDV <= 1'b1;
				CNT <= CNT + 1;
				case(CNT)
					4'd0:begin
						RMII_RXD0 <= ~CRC_NEXT[3];
						RMII_RXD1 <= ~CRC_NEXT[2];
					end
					4'd1:begin
						RMII_RXD0 <= ~CRC_NEXT[1];
						RMII_RXD1 <= ~CRC_NEXT[0];
					end
					4'd2:begin
						RMII_RXD0 <= ~CRC_DATA[27];
						RMII_RXD1 <= ~CRC_DATA[26];
					end
					4'd3:begin
						RMII_RXD0 <= ~CRC_DATA[25];
						RMII_RXD1 <= ~CRC_DATA[24];
					end
					4'd4:begin
						RMII_RXD0 <= ~CRC_DATA[23];
						RMII_RXD1 <= ~CRC_DATA[22];
					end
					4'd5:begin
						RMII_RXD0 <= ~CRC_DATA[21];
						RMII_RXD1 <= ~CRC_DATA[20];
					end
					4'd6:begin
						RMII_RXD0 <= ~CRC_DATA[19];
						RMII_RXD1 <= ~CRC_DATA[18];
					end
					4'd7:begin
						RMII_RXD0 <= ~CRC_DATA[17];
						RMII_RXD1 <= ~CRC_DATA[16];
					end
					4'd8:begin
						RMII_RXD0 <= ~CRC_DATA[15];
						RMII_RXD1 <= ~CRC_DATA[14];
					end
					4'd9:begin
						RMII_RXD0 <= ~CRC_DATA[13];
						RMII_RXD1 <= ~CRC_DATA[12];
					end
					4'd10:begin
						RMII_RXD0 <= ~CRC_DATA[11];
						RMII_RXD1 <= ~CRC_DATA[10];
					end
					4'd11:begin
						RMII_RXD0 <= ~CRC_DATA[9];
						RMII_RXD1 <= ~CRC_DATA[8];
					end
					4'd12:begin
						RMII_RXD0 <= ~CRC_DATA[7];
						RMII_RXD1 <= ~CRC_DATA[6];
					end
					4'd13:begin
						RMII_RXD0 <= ~CRC_DATA[5];
						RMII_RXD1 <= ~CRC_DATA[4];
					end
					4'd14:begin
						RMII_RXD0 <= ~CRC_DATA[3];
						RMII_RXD1 <= ~CRC_DATA[2];
						SKIP_EN <= 1'b1;
					end
					4'd15:begin
						RMII_RXD0 <= ~CRC_DATA[1];
						RMII_RXD1 <= ~CRC_DATA[0];
						TX_DONE_T <= 1'b1;
						CNT <= 5'd0;
					end
					default:;
				endcase
			end
			default:;
		endcase
	end
end

always@(posedge CLK or negedge RESET)begin
	if(!RESET) begin
		TX_DONE <= 1'b0;
		CRC_CLR <= 1'b0;
	end
	else begin
		TX_DONE <= TX_DONE_T;
		CRC_CLR <= TX_DONE_T;
	end
end

endmodule

