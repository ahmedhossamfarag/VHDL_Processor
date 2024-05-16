library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
use work.constants_pck.all;

entity shiftrot is
  port (
    x:in std_logic_vector(n-1 downto 0);
    cd:in std_logic_vector(1 downto 0);
    y:out std_logic_vector(n-1 downto 0)
  );
end entity;

architecture shiftrot of shiftrot is
begin
    with cd select
    y <=
        x(n-2 downto 0) & '0' when SHL,
        '0' & x(n-1 downto 1) when SHR,
        x(n-2 downto 0) & x(n-1) when RTL,
        x(0) & x(n-1 downto 1) when others;
end architecture;
