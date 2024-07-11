library ieee;
use ieee.std_logic_1164.all;

entity xorg is
  port (
    keystream_and: in std_logic_vector(6 downto 0);
    keystream_xor: out std_logic
  );
end xorg;

architecture behavior of xorg is
begin
  process(keystream_and)
    variable temp: std_logic;
  begin
    temp := keystream_and(0);
    for i in 1 to 6 loop
      temp := temp xor keystream_and(i);
    end loop;
    keystream_xor <= temp;
  end process;
end behavior;
