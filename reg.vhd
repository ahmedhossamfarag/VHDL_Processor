library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
use work.constants_pck.all;

entity reg is
  port (
    CLK: in std_logic;
    x:in std_logic_vector(n-1 downto 0);
    rw: in std_logic;
    y:out std_logic_vector(n-1 downto 0)
  );
end entity;

architecture reg of reg is
begin
    write: process(CLK)
    begin
        if CLK'event and CLK = '1' and rw = '1' then
            y <= x;
        end if;
    end process;
end architecture;
