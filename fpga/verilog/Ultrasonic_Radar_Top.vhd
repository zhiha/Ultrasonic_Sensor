----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:24:32 10/04/2022 
-- Design Name: 
-- Module Name:    Ultrasonic_Radar_Top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Ultrasonic_Radar_Top is
Port(
		RF215_CLKO: in STD_LOGIC;
		RMII_TXEN: in STD_LOGIC;
		RMII_TXD0: in STD_LOGIC;
		RMII_TXD1: in STD_LOGIC;
		RMII0: out STD_LOGIC;
		RMII1: out STD_LOGIC;
		RMIIV: out STD_LOGIC;
		RMII_CLK: out STD_LOGIC;
		RMII_RXER_SDIO_D0: out STD_LOGIC;
		
		FE_TXD1: out STD_LOGIC;
		FE_TXD2: out STD_LOGIC;
		FE_TXD3: out STD_LOGIC;
		FE_TXD4: out STD_LOGIC;
		
		FE_RXD1: in STD_LOGIC;
		FE_RXD2: in STD_LOGIC;
		FE_RXD3: in STD_LOGIC;
		FE_RXD4: in STD_LOGIC;
		FE_RXD5: in STD_LOGIC;
		FE_RXD6: in STD_LOGIC;
		FE_RXD7: in STD_LOGIC;
		FE_RXD8: in STD_LOGIC;
		FE_RXD9: in STD_LOGIC;
		FE_RXCLK: out STD_LOGIC;
		
		FPGA_LED: out STD_LOGIC
	);
end Ultrasonic_Radar_Top;

architecture Behavioral of Ultrasonic_Radar_Top is
component Ultrasonic_Reset
port
(
	clk: in std_logic;
	reset: out std_logic
);
end component;

component PLL_IP
port
 (-- Clock in ports
  CLK_IN1           : in     std_logic;
  -- Clock out ports
  CLK_OUT1          : out    std_logic;
  CLK_OUT2          : out    std_logic;
  -- Status and control signals
  RESET             : in     std_logic;
  LOCKED            : out    std_logic
 );
end component;

component Ultrasonic_RMII_RX
port
(
	clk: in STD_LOGIC;
	reset: in STD_LOGIC;
	rmii_tx0: in STD_LOGIC;
	rmii_tx1: in STD_LOGIC;
	rmii_txen: in STD_LOGIC;
	rmii_rec_data: out STD_LOGIC_VECTOR(7 DOWNTO 0);
	rmii_rec_data_update: out STD_LOGIC;
	rmii_rec_byte_num: out STD_LOGIC_VECTOR(15 DOWNTO 0);
	rmii_rec_data_done: out STD_LOGIC;
	config_done: out STD_LOGIC;
	config_ing: out STD_LOGIC
);
end component;

component RMIIRX_TO_RAM
port
(
	clk: in STD_LOGIC;
	reset: in STD_LOGIC;
	data_valid: in STD_LOGIC;
	config_ing: in STD_LOGIC;
	config_done: in STD_LOGIC;
	rec_data: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	addr_write: out STD_LOGIC_VECTOR(12 DOWNTO 0);
	data_write: out STD_LOGIC_VECTOR(15 DOWNTO 0);
	ena: out STD_LOGIC;
	wea: out STD_LOGIC_VECTOR(0 DOWNTO 0)
);
end component; 

component FMCW_RAM
port
(
	clka: in STD_LOGIC;
	wea: in STD_LOGIC_VECTOR(0 DOWNTO 0);
	ena: in STD_LOGIC;
	enb: in STD_LOGIC;
	addra: in STD_LOGIC_VECTOR(12 DOWNTO 0);
	dina: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	clkb: in STD_LOGIC;
	addrb: in STD_LOGIC_VECTOR(12 DOWNTO 0);
	doutb: out STD_LOGIC_VECTOR(15 DOWNTO 0)
);
end component;

component RAM_TO_CFRBDS
port(
	clk: in STD_LOGIC;
	reset: in STD_LOGIC;
	fmcw_data: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	read_start: in STD_LOGIC;
	start_flag: out STD_LOGIC;
	enb: out STD_LOGIC;
	read_addr: out STD_LOGIC_VECTOR(12 DOWNTO 0);
	cfrbds_data: out STD_LOGIC_VECTOR(15 DOWNTO 0);
	cfrbds_reset: out STD_LOGIC;
	cfrbds_flush: out STD_LOGIC
);
end component;

component RAM_TO_CFRBDS_With_Interpolation
port(
	clk: in STD_LOGIC;
	reset: in STD_LOGIC;
	fmcw_data: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	read_start: in STD_LOGIC;
	start_flag: out STD_LOGIC;
	enb: out STD_LOGIC;
	read_addr: out STD_LOGIC_VECTOR(12 DOWNTO 0);
	cfrbds_data: out STD_LOGIC_VECTOR(15 DOWNTO 0);
	cfrbds_reset: out STD_LOGIC;
	cfrbds_flush: out STD_LOGIC
);
end component;

component CFRBDS
port
(
	io_d_d: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	io_v: out STD_LOGIC;
	io_flush: in STD_LOGIC;
	clk: in STD_LOGIC;
	reset: in STD_LOGIC
);
end component;

component Ultrasonic_PDM_FIFO_MUL
port
(
	clk: in STD_LOGIC;
	reset: in STD_LOGIC;
	fe_rx: in STD_LOGIC_VECTOR(17 DOWNTO 0);
	start_flag: in STD_LOGIC;
	fe_rx_data: out STD_LOGIC_VECTOR(17 DOWNTO 0);
	fe_rx_data_valid: out STD_LOGIC;
	fe_rx_data_done: out STD_LOGIC;
	byte_num: out STD_LOGIC_VECTOR(15 DOWNTO 0)
);
end component;

component MIC_MULCHANNEL_FIFO
port
(
	rst             : in std_logic;
   wr_clk          : in std_logic;
	rd_clk          : in std_logic;
   din             : in STD_LOGIC_VECTOR(17 DOWNTO 0);
   wr_en           : in std_logic;
   rd_en           : in std_logic;
   dout            : out STD_LOGIC_VECTOR(17 DOWNTO 0);
   full            : out std_logic;
   empty           : out std_logic
);
end component;

component Ultrasonic_RMII_TX_MULCHN
port
(
	clk: in STD_LOGIC;
	reset: in STD_LOGIC;
	rmii_tx_len : in STD_LOGIC_VECTOR(15 DOWNTO 0);
	rmii_tx_data : in STD_LOGIC_VECTOR(17 DOWNTO 0);
	rmii_tx_en: out STD_LOGIC;
	rmii_tx_done: in STD_LOGIC;
	rmii0: out STD_LOGIC;
	rmii1: out STD_LOGIC;
	rmiiv: out STD_LOGIC;
	crc_dout: in STD_LOGIC_VECTOR(31 DOWNTO 0);
	crc_mode: out STD_LOGIC_VECTOR(0 DOWNTO 0);
	crc_din: out STD_LOGIC_VECTOR(7 DOWNTO 0);
	crc_din_valid: out STD_LOGIC;
	start_flag: in STD_LOGIC
);
end component;

component CRCCombinational
port
(
	clk: in STD_LOGIC;
	reset: in STD_LOGIC;
	io_cmd_valid: in STD_LOGIC;
	io_cmd_payload_mode: in STD_LOGIC_VECTOR(0 DOWNTO 0);
	io_cmd_payload_data: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	io_crc: out STD_LOGIC_VECTOR(31 DOWNTO 0)
);
end component;

component ICON
  PORT (
    CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0)
	 );

end component;

component ILA
  PORT (
    CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CLK : IN STD_LOGIC;
    TRIG0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	 TRIG1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	 TRIG2 : IN STD_LOGIC_VECTOR(12 DOWNTO 0));

end component;

signal CLK1: STD_LOGIC; --50M
signal CLK2: STD_LOGIC; --4M
signal RESET:  STD_LOGIC := '0';
signal LOCKED:  STD_LOGIC := '0';

signal SYSRESET:  STD_LOGIC;
signal rec_data_update: STD_LOGIC; 
signal rec_data_done: STD_LOGIC; 
signal rec_data: STD_LOGIC_VECTOR(7 DOWNTO 0);
signal rec_byte_num: STD_LOGIC_VECTOR(15 DOWNTO 0);
signal config_done_flag: STD_LOGIC;
signal config_ing_flag: STD_LOGIC;
signal addr_write: STD_LOGIC_VECTOR(12 DOWNTO 0);
signal data_write: STD_LOGIC_VECTOR(15 DOWNTO 0);
signal addr_read: STD_LOGIC_VECTOR(12 DOWNTO 0);
signal data_read: STD_LOGIC_VECTOR(15 DOWNTO 0);
signal wea_en: STD_LOGIC_VECTOR(0 DOWNTO 0);
signal ena: STD_LOGIC;
signal enb: STD_LOGIC;


signal cfrbds_data: STD_LOGIC_VECTOR(15 DOWNTO 0);
signal cfrbds_flush: STD_LOGIC;
signal cfrbds_v: STD_LOGIC;
signal cfrbds_reset: STD_LOGIC;

--signal PDM_byte_data: STD_LOGIC_VECTOR(7 DOWNTO 0);
signal PDM_byte_data: STD_LOGIC_VECTOR(17 DOWNTO 0);
signal PDM_byte_num: STD_LOGIC_VECTOR(15 DOWNTO 0);
signal PDM_byte_data_valid: STD_LOGIC;
signal PDM_byte_data_done: STD_LOGIC;

signal FE_RX_data: STD_LOGIC_VECTOR(17 DOWNTO 0);

signal FIFO_FULL : std_logic;
signal FIFO_EMPTY : std_logic;
--signal FIFO_RD_DATA : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal FIFO_RD_DATA : STD_LOGIC_VECTOR(17 DOWNTO 0);
signal FIFO_RD_EN : std_logic;

signal crc_dout: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal crc_din: STD_LOGIC_VECTOR(7 DOWNTO 0);
signal crc_din_valid: STD_LOGIC;
signal crc_mode: STD_LOGIC_VECTOR(0 DOWNTO 0);
signal rmii0_s: STD_LOGIC;
signal rmii1_s: STD_LOGIC;
signal rmiiv_s: STD_LOGIC;

signal start_flag: STD_LOGIC;

signal CONTROL_ila : STD_LOGIC_VECTOR(35 DOWNTO 0) ;

begin

RMII_CLK <= CLK1;
RMII0 <= rmii0_s;
RMII1 <= rmii1_s;
RMIIV <= rmiiv_s; 
FE_TXD1 <= cfrbds_v;
FE_TXD2 <= cfrbds_v;
FE_TXD3 <= cfrbds_v;
FE_TXD4 <= cfrbds_v;
FE_RXCLK <= CLK2;
--FE_RX_data(0) <= FE_RXD1;
FE_RX_data(1) <= FE_RXD2;
FE_RX_data(2) <= FE_RXD3;
FE_RX_data(3) <= FE_RXD4;
FE_RX_data(4) <= FE_RXD5;
FE_RX_data(5) <= FE_RXD6;
FE_RX_data(6) <= FE_RXD7;
FE_RX_data(7) <= FE_RXD8;
FE_RX_data(8) <= FE_RXD9;
FE_RX_data(0) <= cfrbds_v;
--FE_RX_data(1) <= FE_RXD2;
--FE_RX_data(2) <= FE_RXD3;
--FE_RX_data(3) <= '0';
--FE_RX_data(4) <= '0';
--FE_RX_data(5) <= '0';
--FE_RX_data(6) <= '0';
--FE_RX_data(7) <= '0';
--FE_RX_data(8) <= '0';
--FE_RX_data(0) <= cfrbds_v;
--FE_RX_data(1) <= '0';
--FE_RX_data(2) <= '0';
--FE_RX_data(3) <= '0';
--FE_RX_data(4) <= '0';
--FE_RX_data(5) <= '0';
--FE_RX_data(6) <= '0';
--FE_RX_data(7) <= '0';
--FE_RX_data(8) <= '0';

FE_RX_data(9) <= '0';
FE_RX_data(10) <= '0';
FE_RX_data(11) <= '0';
FE_RX_data(12) <= '0';
FE_RX_data(13) <= '0';
FE_RX_data(14) <= '0';
FE_RX_data(15) <= '0';
FE_RX_data(16) <= '0';
FE_RX_data(17) <= '0';

Ultrasonic_Reset_1: Ultrasonic_Reset
port map
(
	clk => RF215_CLKO,
	reset => SYSRESET
);

PLL_IP_1 : PLL_IP
  port map
   (-- Clock in ports
    CLK_IN1 => RF215_CLKO,
    -- Clock out ports
    CLK_OUT1 => CLK1,
	 CLK_OUT2 => CLK2,
    -- Status and control signals
    RESET  => RESET,
    LOCKED => LOCKED);

Ultrasonic_RMII_RX_1 : Ultrasonic_RMII_RX
port map(
	clk => CLK1,
	reset => SYSRESET,
	rmii_tx0 => RMII_TXD0,
	rmii_tx1 => RMII_TXD1,
	rmii_txen => RMII_TXEN,
	rmii_rec_data => rec_data,
	rmii_rec_data_update => rec_data_update,
	rmii_rec_data_done => rec_data_done,
	rmii_rec_byte_num => rec_byte_num,
	config_done => config_done_flag,
	config_ing => config_ing_flag
);


RMIIRX_TO_RAM_1: RMIIRX_TO_RAM
port map
(
	clk => CLK1,
	reset => SYSRESET,
	data_valid => rec_data_update,
	COnfig_ing => config_ing_flag,
	config_done => config_done_flag, 
	rec_data => rec_data,
	addr_write => addr_write,
	data_write => data_write,
	ena => ena,
	wea => wea_en
);

FMCW_RAM_1: FMCW_RAM
port map(
	clka => CLK1,
	wea => wea_en,
	addra => addr_write,
	dina => data_write,
	ena => ena,
	enb => enb,
	clkb => CLK2,
	addrb => addr_read,
	doutb => data_read
);

RAM_TO_CFRBDS_With_Interpolation_1: RAM_TO_CFRBDS_With_Interpolation
port map(
	clk => CLK2,
	reset => SYSRESET,
	enb => enb,
	start_flag => start_flag,
	fmcw_data => data_read,
	read_start => config_done_flag,
	read_addr => addr_read,
	cfrbds_data => cfrbds_data,
	cfrbds_reset => cfrbds_reset,
	cfrbds_flush => cfrbds_flush
);

CFRBDS_1: CFRBDS
port map(
	clk => CLK2,
	reset => cfrbds_reset,
	io_d_d => cfrbds_data,
	io_flush => cfrbds_flush,
	io_v => cfrbds_v
);

Ultrasonic_PDM_FIFO_MUL_1: Ultrasonic_PDM_FIFO_MUL
port map(
	clk => CLK2,
	reset => SYSRESET,
	fe_rx => FE_RX_data,
	start_flag => start_flag,
	fe_rx_data => PDM_byte_data,
	byte_num => PDM_byte_num,
	fe_rx_data_valid => PDM_byte_data_valid,
	fe_rx_data_done => PDM_byte_data_done
);

MIC_MULCHANNEL_FIFO_1: MIC_MULCHANNEL_FIFO
port map
(
	rst  => RESET,
   wr_clk  => CLK2,
	rd_clk  => CLK1,
   din  => PDM_byte_data,
   wr_en => PDM_byte_data_valid,
   rd_en => FIFO_RD_EN,
   dout => FIFO_RD_DATA,
   full => FIFO_FULL,
   empty => FIFO_EMPTY
);


Ultrasonic_RMII_TX_MULCHN_1: Ultrasonic_RMII_TX_MULCHN
port map
(
	clk => CLK1,
	reset => SYSRESET,
	rmii_tx_len => PDM_byte_num,
	rmii_tx_data => FIFO_RD_DATA,
	rmii_tx_en => FIFO_RD_EN,
	rmii_tx_done => PDM_byte_data_done,
	rmii0 => rmii0_s,
	rmii1 => rmii1_s,
	rmiiv => rmiiv_s,
	crc_dout=> crc_dout,
	crc_mode => crc_mode,
	crc_din => crc_din,
	crc_din_valid => crc_din_valid,
	start_flag => start_flag
);

CRCCombinational_1 : CRCCombinational
port map(
	clk => CLK1,
	reset => SYSRESET,
	io_cmd_payload_data => crc_din,
	io_cmd_valid => crc_din_valid,
	io_cmd_payload_mode => crc_mode,
	io_crc => crc_dout
);

myicon : ICON
  port map (
    CONTROL0 => CONTROL_ila
	 );

myila : ILA
  port map (
    CONTROL => CONTROL_ila,
    CLK =>  CLK1,
	 TRIG0(0) => RMII_TXD0,
    TRIG0(1) => RMII_TXD1,
	 TRIG0(2) => config_ing_flag,
	 TRIG0(3) => config_done_flag,
	 TRIG0(4) => FIFO_FULL,
	 TRIG0(5) => rmii0_s,
	 TRIG0(6) => rmii1_s,
	 TRIG0(7) => FE_RXD1,
	 TRIG1 => cfrbds_data,
	 TRIG2 => addr_read
   	 );

RMII_RXER_SDIO_D0 <= '0';
FPGA_LED <= '1';


end Behavioral;

