library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.Std_logic_unsigned.all;

entity gmr is
   port(
        i_clk:         in std_logic;
        i_rst:         in std_logic;
        i_seed_lfsrM:  in std_logic_vector(6 downto 0);
        i_seed_lfsrL:  in std_logic_vector(12 downto 0);
        o_lfsrM:       out std_logic_vector(6 downto 0);
        o_lfsrL:       out std_logic_vector(12 downto 0);
        o_keystream:   out std_logic);
end gmr;

Architecture behavior of gmr is
   signal clk_reg:  std_logic;
   signal lfsrM_reg: std_logic_vector(6 downto 0);
   signal lfsrL_reg:  std_logic_vector(12 downto 0);
   signal keystream_and: std_logic_vector(6 downto 0);
   signal keystream_xor:  std_logic;

begin

DIV: entity work.div_clk
port map(i_clk, clk_reg);

LFSR_L: entity work.lfsrl 
port map(clk_reg, i_rst, i_seed_lfsrL, lfsrL_reg);

LFSR_M: entity work.lfsrm
port map(clk_reg, i_rst, i_seed_lfsrM, lfsrM_reg);

AND_G: entity work.andg 
port map(lfsrM_reg, lfsrL_reg, keystream_and);

XOR_G: entity work.xorg 
port map (keystream_and, keystream_xor);

o_lfsrM <= lfsrM_reg;
o_lfsrL <= lfsrL_reg;
o_keystream <= keystream_xor;
end behavior;