----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/11/26 14:01:25
-- Design Name: 
-- Module Name: Ultrasonic_Top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies:  +
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Ultrasonic_Top is
  Port ( 	
------------------RMII-------------------------
   RMII_TXEN            : in std_logic;
   RMII_TXD0_SDIO_CMD   : in STD_LOGIC;
   RMII_TXD1_SDIO_CLK   : in STD_LOGIC;
   RMII_CLK             : out std_logic;
	RMII_RXER_SDIO_D0    : out std_logic;
   RMII_RXD0_SDIO_D2    : out STD_LOGIC;
   RMII_RXD1_SDIO_D3    : out STD_LOGIC;
   RMII_RXDV_SDIO_D1    : out std_logic;

	RF215_CLKO    : in std_logic;
	
	MIC_CLK		  : out std_logic;
	MIC_DATA      : in std_logic;
	
	FPGA_LED      : out std_logic
	
   );
end Ultrasonic_Top;


architecture Behavioral of Ultrasonic_Top is

------------pll---------------

component PLL_IP
port
 (-- Clock in ports
  CLK_IN1           : in     std_logic;
  -- Clock out ports
  CLK_OUT1          : out    std_logic;
  CLK_OUT2          : out    std_logic;
  CLK_OUT3          : out    std_logic;
  CLK_OUT4          : out    std_logic;
  -- Status and control signals
  RESET             : in     std_logic;
  LOCKED            : out    std_logic
 );
end component;

-----------RMII_RX------------------
component RMII_RX is 
port
(
   RESET           : in std_logic; 
	TXEN            : in std_logic;
   RMII_TXD0       : in STD_LOGIC;
   RMII_TXD1       : in STD_LOGIC;
   CLK             : in std_logic;
	REC_DATA        : out STD_LOGIC_VECTOR(31 DOWNTO 0);
	DATA_UPDATE     : out std_logic;
	REC_PKT_DONE    : out std_logic;
	REC_BYTE_NUM    : out STD_LOGIC_VECTOR(15 DOWNTO 0)
);
end component;

-----------RMII_TX------------------
component RMII_TX is 
port
(
   RESET           : in std_logic; 
	CLK             : in std_logic;
	TX_START_EN     : in std_logic;
	TX_DATA         : in STD_LOGIC_VECTOR(31 DOWNTO 0);
	TX_DATA_MIC         : in STD_LOGIC_VECTOR(31 DOWNTO 0);
	TX_BYTE_NUM     : in STD_LOGIC_VECTOR(15 DOWNTO 0);
   CRC_DATA        : in STD_LOGIC_VECTOR(31 DOWNTO 0);
   CRC_NEXT        : in STD_LOGIC_VECTOR(3 DOWNTO 0);
	
	TX_DONE         : out STD_LOGIC;
	TX_REQ          : out STD_LOGIC;
	RMII_RXDV       : out STD_LOGIC;
   RMII_RXD0       : out STD_LOGIC;
   RMII_RXD1       : out STD_LOGIC;
   CRC_EN          : out STD_LOGIC;
   CRC_CLR         : out STD_LOGIC;
	FIFO_RD_EN		 : out STD_LOGIC
);
end component;

-----------CRC32------------------
component CRC32_D2 is 
port
(
   CLK             : in std_logic;
   RESET           : in std_logic; 
   RMII_RXD0       : in STD_LOGIC;
   RMII_RXD1       : in STD_LOGIC;
	CRC_EN          : in STD_LOGIC;
	CRC_CLR         : in STD_LOGIC;
	C               : out STD_LOGIC_VECTOR(31 DOWNTO 0); --CRC_DATA
	NEWCRC          : out STD_LOGIC_VECTOR(31 DOWNTO 0)
);
end component;

component PDM_MIC is
port
(
	CLK				 : in std_logic;
	RESET			    : in std_logic;
	RX_DATA_BIT	    : in std_logic;
	DATA_MIC        : out STD_LOGIC_VECTOR(31 DOWNTO 0);
	TX_START_EN     : out std_logic;
	TX_BYTE_NUM     : out STD_LOGIC_VECTOR(15 DOWNTO 0);
	FIFO_WR_EN      : out std_logic
);
end component;

component FIFO_MIC is
port
(
	rst             : in std_logic;
   wr_clk          : in std_logic;
   rd_clk          : in std_logic;
   din             : in STD_LOGIC_VECTOR(31 DOWNTO 0);
   wr_en           : in std_logic;
   rd_en           : in std_logic;
   dout            : out STD_LOGIC_VECTOR(31 DOWNTO 0);
   full            : out std_logic;
   empty           : out std_logic
);
end component;

------ICON˼------------------------

component ICON
  PORT (
    CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0)
	 );

end component;

component ILA
  PORT (
    CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CLK : IN STD_LOGIC;
    TRIG0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0));

end component;


------------signal--------------------
signal RESET : std_logic := '0';
signal LOCKED : std_logic := '0';
signal SYS_RESET : std_logic;
signal RMIICLK  : std_logic;
signal RF_CLK : std_logic;
signal CLK3 : std_logic;
signal MICCLK : std_logic;

signal CONTROL_ila : STD_LOGIC_VECTOR(35 DOWNTO 0) ;

signal REC_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0) ;
signal TX_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0) ;
signal RMII_TXD0 : std_logic;
signal RMII_TXD1 : std_logic;
signal RMII_RXD0 : std_logic;
signal RMII_RXD1 : std_logic;
signal RMII_RXDV : std_logic;
signal REC_PKT_DONE : std_logic;
signal DATA_UPDATE  : std_logic;
signal REC_BYTE_NUM : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal TX_START_EN : std_logic;
signal TX_DONE : std_logic;
signal TX_REQ : std_logic;
signal CRC_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CRC_NEXT : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CRC_EN : std_logic;
signal CRC_CLR : std_logic;

signal FIFO_WR_EN : std_logic;
signal FIFO_RD_EN : std_logic;
signal FIFO_FULL : std_logic;
signal FIFO_EMPTY : std_logic;
signal FIFO_RD_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal RX_DATA_BIT: STD_LOGIC;
signal TX_BYTE_NUM : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal FIFO_WR_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0) ;
signal MICDATA: STD_LOGIC;

signal Debug_d : STD_LOGIC_VECTOR(31 DOWNTO 0) := "10011100101110010111010011000110";


begin  

--------PLL-----------
RMII_CLK <= RMIICLK;  
RMII_TXD0 <= RMII_TXD0_SDIO_CMD;
RMII_TXD1 <= RMII_TXD1_SDIO_CLK;
RMII_RXD0_SDIO_D2 <= RMII_RXD0;
RMII_RXD1_SDIO_D3 <= RMII_RXD1;
RMII_RXDV_SDIO_D1 <= RMII_RXDV;

MIC_CLK <= MICCLK;
MICDATA <= MIC_DATA;

	
PLL_1 : PLL_IP
  port map
   (-- Clock in ports
    CLK_IN1 => RF215_CLKO,
    -- Clock out ports
    CLK_OUT1 => RMIICLK,
	 CLK_OUT2 => RF_CLK ,
	 CLK_OUT3 => CLK3   ,
	 CLK_OUT4 => MICCLK  ,
    -- Status and control signals
    RESET  => RESET,
    LOCKED => LOCKED);

-------RMII_RX-----------------	 
RMII_RX_1 : RMII_RX 
port map(
   RESET => SYS_RESET               ,
	TXEN => RMII_TXEN                ,
   RMII_TXD0 => RMII_TXD0           ,
   RMII_TXD1 => RMII_TXD1           ,
   CLK => RMIICLK                   ,
	
   REC_DATA => REC_DATA             ,
	DATA_UPDATE => DATA_UPDATE       ,
	REC_PKT_DONE => REC_PKT_DONE     ,
	REC_BYTE_NUM => REC_BYTE_NUM
);

-------RMII_TX-----------------
--RMII_TX_1 : RMII_TX 
--port map(
--   RESET => SYS_RESET               ,
--	CLK => RMIICLK                   ,
--	TX_START_EN => REC_PKT_DONE       ,
--	TX_DATA => REC_DATA          ,
--	TX_BYTE_NUM => REC_BYTE_NUM       ,
--   CRC_DATA => CRC_DATA             ,      
--   CRC_NEXT => CRC_NEXT(31 downto 28),  
--	
--	TX_DONE => TX_DONE               ,
--	TX_REQ => TX_REQ                 ,
--	RMII_RXDV => RMII_RXDV           ,
--   RMII_RXD0 => RMII_RXD0           ,
--   RMII_RXD1 => RMII_RXD1           ,
--   CRC_EN => CRC_EN                 ,
--   CRC_CLR => CRC_CLR  					,
--	FIFO_RD_EN => FIFO_RD_EN		
--);
RMII_TX_1 : RMII_TX 
port map(
   RESET => SYS_RESET               ,
	CLK => RMIICLK                   ,
	TX_START_EN => TX_START_EN       ,
	TX_DATA => REC_DATA,
	TX_DATA_MIC => FIFO_RD_DATA,
	TX_BYTE_NUM => TX_BYTE_NUM       ,
   CRC_DATA => CRC_DATA             ,      
   CRC_NEXT => CRC_NEXT(31 downto 28),  
	
	TX_DONE => TX_DONE               ,
	TX_REQ => TX_REQ                 ,
	RMII_RXDV => RMII_RXDV           ,
   RMII_RXD0 => RMII_RXD0           ,
   RMII_RXD1 => RMII_RXD1           ,
   CRC_EN => CRC_EN                 ,
   CRC_CLR => CRC_CLR  					,
	FIFO_RD_EN => FIFO_RD_EN		
);

CRC32_D2_1 : CRC32_D2
port map(
   CLK => RMIICLK                   ,
   RESET => SYS_RESET               , 
   RMII_RXD0 => RMII_RXD0           ,
   RMII_RXD1 => RMII_RXD1           ,
	CRC_EN => CRC_EN                 ,
	CRC_CLR => CRC_CLR               ,
	C => CRC_DATA                    ,
	NEWCRC => CRC_NEXT               
);


PDM_MIC_1 : PDM_MIC
port map(
	CLK	=>  MICCLK						,
	RESET	=>	SYS_RESET					,
	RX_DATA_BIT	=> MICDATA  			,
	DATA_MIC   => FIFO_WR_DATA			,
	TX_START_EN  =>  TX_START_EN		,
	TX_BYTE_NUM  => TX_BYTE_NUM		,
	FIFO_WR_EN => FIFO_WR_EN			
);
 
FIFO_MIC_1 : FIFO_MIC
port map(
	rst => RESET							,
	wr_clk => MICCLK						,
	rd_clk => RMIICLK						,
	din => FIFO_WR_DATA					,
	wr_en => FIFO_WR_EN					,
	rd_en => FIFO_RD_EN					,
	dout =>	FIFO_RD_DATA				,
	full => FIFO_FULL						,
	empty => FIFO_EMPTY              
);


-------ILA-------------------

myicon : ICON
  port map (
    CONTROL0 => CONTROL_ila
	 );

myila : ILA
  port map (
    CONTROL => CONTROL_ila,
    CLK =>  RMIICLK,
	 TRIG0(0) => RMII_TXEN,
    TRIG0(1) => RMII_TXD0,
	 TRIG0(2) => RMII_TXD1,
	 TRIG0(3) => RMII_RXD0,
	 TRIG0(4) => RMII_RXD1,
	 TRIG0(5) => RMII_RXDV,
	 TRIG0(6) => REC_PKT_DONE,
	 TRIG0(7) => RMII_RXDV
   	 );
		 
SYS_RESET <= '1';
RMII_RXER_SDIO_D0 <= '0';

FPGA_LED <= '1';

  
end Behavioral;
