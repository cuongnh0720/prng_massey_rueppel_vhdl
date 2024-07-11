library ieee;
use ieee.Std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.Std_logic_unsigned.ALL;
-----------------------------------------
entity div_clk Is
port (
    i_clk: in std_logic;
	o_clk: out std_logic);
end div_clk;

architecture behavior of div_clk is 
constant n: integer := 8; 
signal d1hz_r, d1hz_n: integer range 0 to n := 1;
begin
--register-------------------------------------
	process (i_clk)
	 begin
		if i_clk'event and i_clk = '0' then 
		  d1hz_r <= d1hz_n;
		end if;
	end process;
--next state logic------------------------------
	d1hz_n <= 1 when d1hz_r = n else d1hz_r+1;
--output logic-----------------------------------
	o_clk <= '1' when d1hz_r = n/2 else
			  '0';
end behavior;
