library ieee;
use ieee.std_logic_1164.all;

entity andg is
  port (
    lfsrM: in std_logic_vector(6 downto 0);
    lfsrL: in std_logic_vector(12 downto 0);
    keystream_and: out std_logic_vector(6 downto 0)
  );
end andg;

architecture behavior of andg is
begin
  keystream_and <= lfsrM and lfsrL(6 downto 0);
end behavior;
