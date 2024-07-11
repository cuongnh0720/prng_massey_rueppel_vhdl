library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.Std_logic_unsigned.all;

entity lfsrl is
  port (
    i_clk:    in std_logic;
    i_rst:    in std_logic;
    i_seed:   in std_logic_vector(12 downto 0);
    o_lfsrL:  out std_logic_vector(12 downto 0)
  );
end lfsrl;

architecture behavior of lfsrl is
  signal msb_lfsrL_sig: std_logic;
  --signal i_seed: std_logic_vector(12 downto 0) := "1010110100111";
begin
  process(i_clk, i_rst)
    variable temp: std_logic_vector (12 downto 0);
    variable msb_lfsrL: std_logic;
  begin
    if i_clk'event and i_clk = '1' then
      if i_rst = '0' then
        temp := msb_lfsrL_sig & temp(12 downto 1);
        msb_lfsrL := temp(12) xor temp(3) xor temp(2) xor temp(0);
        temp := msb_lfsrL & temp(12 downto 1);
      else
        temp := i_seed;
      end if;
    end if;
    o_lfsrL <= temp;
    msb_lfsrL_sig <= temp(12) xor temp(3) xor temp(2) xor temp(0);
  end process;
end behavior;
