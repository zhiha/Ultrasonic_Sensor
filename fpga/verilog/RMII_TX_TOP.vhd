----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:26:55 09/28/2022 
-- Design Name: 
-- Module Name:    RMII_TX_TOP - Behavioral 
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

entity RMII_TX_TOP is
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
		FPGA_LED: out STD_LOGIC
	);
end RMII_TX_TOP;

architecture Behavioral of RMII_TX_TOP is

component PLL_2
port
 (-- Clock in ports
  CLK_IN1           : in     std_logic;
  -- Clock out ports
  CLK_OUT1          : out    std_logic;
  -- Status and control signals
  RESET             : in     std_logic;
  LOCKED            : out    std_logic
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

component RMII_SINGLE_TX
port
(
	clk: in STD_LOGIC;
	reset: in STD_LOGIC;
	rmii0: out STD_LOGIC;
	rmii1: out STD_LOGIC;
	rmiiv: out STD_LOGIC;
	crc_dout: in STD_LOGIC_VECTOR(31 DOWNTO 0);
	crc_mode: out STD_LOGIC_VECTOR(0 DOWNTO 0);
	crc_din: out STD_LOGIC_VECTOR(7 DOWNTO 0);
	crc_din_valid: out STD_LOGIC
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

signal crc_dout: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal crc_din: STD_LOGIC_VECTOR(7 DOWNTO 0);
signal crc_din_valid: STD_LOGIC;
signal crc_mode: STD_LOGIC_VECTOR(0 DOWNTO 0);
signal rmii0_s: STD_LOGIC;
signal rmii1_s: STD_LOGIC;
signal rmiiv_s: STD_LOGIC;
signal SYSRESET:  STD_LOGIC;
signal RESET:  STD_LOGIC := '0';
signal LOCKED:  STD_LOGIC := '0';
signal CLK:   STD_LOGIC;

signal CONTROL_ila : STD_LOGIC_VECTOR(35 DOWNTO 0) ;


begin

RMII0 <= rmii0_s;
RMII1 <= rmii1_s;
RMIIV <= rmiiv_s; 
RMII_CLK <= CLK;

PLL_2_1 : PLL_2
  port map
   (-- Clock in ports
    CLK_IN1 => RF215_CLKO,
    -- Clock out ports
    CLK_OUT1 => CLK,
    -- Status and control signals
    RESET  => RESET,
    LOCKED => LOCKED);

CRCCombinational_1 : CRCCombinational
port map(
	clk => CLK,
	reset => SYSRESET,
	io_cmd_payload_data => crc_din,
	io_cmd_valid => crc_din_valid,
	io_cmd_payload_mode => crc_mode,
	io_crc => crc_dout
);

RMII_SINGLE_TX_1 : RMII_SINGLE_TX
port map(
	clk => CLK,
	reset => SYSRESET,
	rmii0 => rmii0_s,
	rmii1 => rmii1_s,
	rmiiv => rmiiv_s,
	crc_mode => crc_mode,
	crc_din => crc_din,
	crc_dout => crc_dout,
	crc_din_valid => crc_din_valid
);

-------ILA-------------------

myicon : ICON
  port map (
    CONTROL0 => CONTROL_ila
	 );

myila : ILA
  port map (
    CONTROL => CONTROL_ila,
    CLK =>  CLK,
	 TRIG0(0) => RMII_TXEN,
    TRIG0(1) => RMII_TXD0,
	 TRIG0(2) => RMII_TXD1,
	 TRIG0(3) => rmii0_s,
	 TRIG0(4) => rmii1_s,
	 TRIG0(5) => rmiiv_s,
	 TRIG0(6) => rmiiv_s,
	 TRIG0(7) => rmiiv_s
   	 );

SYSRESET <= '1';
RMII_RXER_SDIO_D0 <= '0';
FPGA_LED <= '1';
end Behavioral;

