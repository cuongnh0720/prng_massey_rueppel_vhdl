library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.Std_logic_unsigned.all;

entity lfsrm is
  port (
    i_clk: in std_logic;
    i_rst: in std_logic;
    i_seed: in std_logic_vector(6 downto 0);
    o_lfsrM: out std_logic_vector(6 downto 0)
  );
end lfsrm;

architecture behavior of lfsrm is
  signal msb_lfsrM: std_logic;
  --signal i_seed: std_logic_vector(6 downto 0) := "1011010";
begin
  process(i_clk, i_rst)
    variable feedback: std_logic;
    variable temp: std_logic_vector(6 downto 0);
  begin
    if i_clk'event and i_clk = '1' then
      if i_rst = '0' then
        temp := msb_lfsrM & temp(6 downto 1);
      else
        temp := i_seed;
      end if;
    end if;
    o_lfsrM <= temp;
    msb_lfsrM <= temp(6) xor temp(0);
  end process;
end behavior;
