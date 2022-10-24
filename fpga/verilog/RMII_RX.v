`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module RMII_RX(
   input RESET                  ,    
	input TXEN                   ,   
   input RMII_TXD0              ,
   input RMII_TXD1              , 
   input CLK                    ,    
	output reg [31:0] REC_DATA   ,    
	output reg DATA_UPDATE       ,
	output reg REC_PKT_DONE      ,    
	output reg [15:0]REC_BYTE_NUM           

    );

// parameter define 
localparam BOARD_MAC = 48'h11_22_33_44_55_66;
// ETH PROTOCOL
localparam ST_IDLE = 7'b000_0001;
localparam ST_PREAMBLE = 7'b000_0010;
localparam ST_ETH_HEAD = 7'b000_0100;
localparam ST_LEN = 7'b000_1000;
localparam ST_RX_DATA = 7'b001_0000;
localparam ST_RX_END = 7'b010_0000;
// DATA
localparam DATA_WIDTH = 16;
localparam DATA_SAVE_BIT = 5; //Need 5 bit to save one val 
// resource
reg SKIP_EN;
reg ERROR_EN;
reg RX_BYTE_DONE_FLAG = 1'b0;   //RX_ONE_DONE_FLAG = 1 if one val is finishing received
reg [6:0] CUR_STATE;
reg [6:0] NEXT_STATE;
reg [2:0] RX_CNT = 3'd0;  //Record the bit sequence
reg [7:0] RX_DATA;
reg [47:0] DES_MAC;
reg [15:0] ETH_TYPE;
reg [15:0] DATA_LEN;
reg [4:0] CNT = 5'b0;
reg [15:0] DATA_CNT = 16'b0;

//**********************************************//
//**						MAIN PART                **//
//**********************************************//
//					RECEIVE DATA FROM ARM            //

always@(posedge CLK or negedge RESET)begin
	if(!RESET) begin
		RX_CNT <= 1'b0;
		RX_BYTE_DONE_FLAG <= 1'b0;
		RX_DATA <= 1'b0;
	end
	else begin
		if(TXEN) begin
			if(RX_CNT == 0)begin
				RX_BYTE_DONE_FLAG <= 0;
				RX_DATA[0] <= RMII_TXD0;
				RX_DATA[1] <= RMII_TXD1;
				RX_CNT <= RX_CNT + 1;
			end
			else if(RX_CNT == 1)begin
				RX_DATA[2] <= RMII_TXD0;
				RX_DATA[3] <= RMII_TXD1;
				RX_CNT <= RX_CNT + 1;
			end
			else if(RX_CNT == 2)begin
				RX_DATA[4] <= RMII_TXD0;
				RX_DATA[5] <= RMII_TXD1;
				RX_CNT <= RX_CNT + 1;
			end
			else if(RX_CNT == 3)begin
				RX_DATA[6] <= RMII_TXD0;
				RX_DATA[7] <= RMII_TXD1;
				RX_CNT <= 0;
				RX_BYTE_DONE_FLAG <= 1'b1;
			end
		end
		else begin
			RX_CNT <= 0;
			RX_BYTE_DONE_FLAG <= 0;
		end
	end
end

always@(posedge CLK or negedge RESET) begin
	if(!RESET)begin
		CUR_STATE <= ST_IDLE;
	end
	else begin
		CUR_STATE <= NEXT_STATE;
	end
end

always@(*) begin
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
			else if(ERROR_EN)
				NEXT_STATE = ST_RX_END;
			else
				NEXT_STATE = ST_PREAMBLE;
		end
		ST_ETH_HEAD:begin
			if(SKIP_EN)
				NEXT_STATE = ST_LEN;
			else if(ERROR_EN)
				NEXT_STATE = ST_RX_END;
			else
				NEXT_STATE = ST_ETH_HEAD;
		end
		ST_LEN:begin
			if(SKIP_EN)
				NEXT_STATE = ST_RX_DATA;
			else
				NEXT_STATE = ST_LEN;
		end
		ST_RX_DATA:begin
			if(SKIP_EN)
				NEXT_STATE = ST_RX_END;
			else
				NEXT_STATE = ST_RX_DATA;
		end
		ST_RX_END:begin
			if(SKIP_EN)
				NEXT_STATE = ST_IDLE;
			else
				NEXT_STATE = ST_RX_END;
		end
		default: NEXT_STATE = ST_IDLE;
	endcase	
end

always @(posedge CLK or negedge RESET)begin
	if(!RESET)begin
		SKIP_EN <= 1'b0;
		ERROR_EN <= 1'b0;
		CNT <= 5'd0;
		DES_MAC <= 48'd0;
		ETH_TYPE <= 16'd0;
		DATA_LEN <= 16'd0;
		DATA_CNT <= 16'd0;
		REC_DATA <= 32'd0;
		REC_PKT_DONE <= 1'b0;
		REC_BYTE_NUM <= 16'd0;
	end
	else begin
		SKIP_EN <= 1'b0;
		ERROR_EN <= 1'b0;
		REC_PKT_DONE <= 1'b0;
		case(CUR_STATE)
			ST_IDLE:begin
				if((RX_BYTE_DONE_FLAG == 1'b1) && (RX_DATA == 8'h55))
					SKIP_EN <= 1'b1;
			end
			ST_PREAMBLE:begin
				if(RX_BYTE_DONE_FLAG) begin
					CNT <= CNT + 1;
					if((CNT < 5'd6) && (RX_DATA != 8'h55))
						ERROR_EN <= 1;
					else if(CNT == 5'd6) begin
						CNT <= 5'd0;
						if(RX_DATA==8'hd5)
							SKIP_EN <= 1'b1;
						else
							ERROR_EN <= 1'b1;
					end
				end
			end
			ST_ETH_HEAD:begin
				if(RX_BYTE_DONE_FLAG)begin
					CNT <= CNT + 1;
					if(CNT < 5'd6)
						DES_MAC <= {DES_MAC[39:0],RX_DATA};
					else if(CNT == 5'd12)
						ETH_TYPE[15:8] <= RX_DATA;
					else if(CNT == 5'd13) begin
						ETH_TYPE[7:0] <= RX_DATA;
						CNT <= 0;
						if(DES_MAC == BOARD_MAC)
							SKIP_EN <= 1'b1;
						else
							ERROR_EN <= 1'b1;
					end
				end
			end
			ST_LEN:begin
				if(RX_BYTE_DONE_FLAG)begin
					CNT <= CNT + 1;
					if(CNT == 0)
						DATA_LEN[15:8] <= RX_DATA;
					else if(CNT == 1) begin
						DATA_LEN[7:0] <= RX_DATA;
						CNT <= 0;
						SKIP_EN <= 1'b1;
					end
				end
			end
			ST_RX_DATA:begin
				REC_BYTE_NUM <= DATA_LEN;
				if(RX_BYTE_DONE_FLAG)begin
					DATA_CNT <= DATA_CNT + 16'd1;
					CNT <= CNT + 5'd1;
					if(DATA_CNT == DATA_LEN - 1)begin
						SKIP_EN <= 1;
						DATA_CNT <= 0;
						CNT <= 0;
						REC_PKT_DONE <= 1'b1;
					end
					if(CNT == 5'd0)begin
						REC_DATA[31:24] <= RX_DATA;
						DATA_UPDATE <= 1'b0;
					end
					else if(CNT == 5'd1)begin
						REC_DATA[23:16] <= RX_DATA;
					end
					else if(CNT == 5'd2)begin
						REC_DATA[15:8] <= RX_DATA;
					end
					else if(CNT == 5'd3)begin
						CNT <= 0;
						REC_DATA[7:0] <= RX_DATA;
						DATA_UPDATE <= 1'b1;
					end
				end
			end
			ST_RX_END:begin
				if(TXEN == 1'b0 && SKIP_EN == 1'b0)
					SKIP_EN <= 1'b1;
			end
			default: ;
		endcase
	end
end

endmodule
