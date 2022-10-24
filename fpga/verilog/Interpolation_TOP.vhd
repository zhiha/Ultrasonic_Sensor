----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:56:28 10/10/2022 
-- Design Name: 
-- Module Name:    Interpolation_TOP - Behavioral 
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

entity Interpolation_TOP is
Port(
		CLK: in STD_LOGIC
	);
end Interpolation_TOP;

architecture Behavioral of Interpolation_TOP is
component Interpolation_Bram
port(
	clka: in STD_LOGIC;
	ena: in STD_LOGIC;
	wea: in STD_LOGIC_VECTOR(0 DOWNTO 0);
	addra: in STD_LOGIC_VECTOR(12 DOWNTO 0);
	dina: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	clkb: in STD_LOGIC;
	enb: in STD_LOGIC;
	addrb: in STD_LOGIC_VECTOR(12 DOWNTO 0);
	doutb: out STD_LOGIC_VECTOR(15 DOWNTO 0) 
);
end component;

component LinearInterpolation_Part
port(
	clk: in STD_LOGIC;
	enb: out STD_LOGIC;
	wea: out STD_LOGIC_VECTOR(0 DOWNTO 0);
	read_addr: out STD_LOGIC_VECTOR(12 DOWNTO 0);
	fmcw_data: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	cfrbds_data: out STD_LOGIC_VECTOR(15 DOWNTO 0)
);
end component;

signal enb: STD_LOGIC;
signal ena: STD_LOGIC := '0';
signal wea: STD_LOGIC_VECTOR(0 DOWNTO 0) ;
signal addra: STD_LOGIC_VECTOR(12 DOWNTO 0) ;
signal addrb: STD_LOGIC_VECTOR(12 DOWNTO 0);
signal Rdata: STD_LOGIC_VECTOR(15 DOWNTO 0);
signal Wdata: STD_LOGIC_VECTOR(15 DOWNTO 0);
signal cfrbds_data: STD_LOGIC_VECTOR(15 DOWNTO 0);

begin


Interpolation_Bram_1: Interpolation_Bram
port map
(
	clka => CLK,
	ena => ena,
	wea => wea,
	addra => addra,
	dina => Wdata,
	clkb => CLK,
	enb => enb,
	addrb => addrb,
	doutb => Rdata
);

LinearInterpolation_Part_1: LinearInterpolation_Part
port map
(
	clk => CLK,
	enb => enb,
	wea => wea,
	read_addr => addrb,
	fmcw_data => Rdata,
	cfrbds_data => cfrbds_data
);



end Behavioral;

