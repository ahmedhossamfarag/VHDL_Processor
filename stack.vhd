library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
use work.constants_pck.all;

entity stack is
  port (
    CLK:in std_logic;
    x:in integer;
    rd:in std_logic;
    ld:in std_logic;
    y:out integer
  );
end entity;

architecture stack of stack is
    signal memo: stacktype := (others => 0);
    signal pntr: integer range 0 to memo'high := 0;
begin
    y <= memo(pntr);

    change: process(CLK)
    begin
        if rising_edge(CLK) then
            if rd = '1' and ld = '0' then
                pntr <= pntr-1;
            end if;
            if ld = '1' and rd = '0' then
                memo(pntr+1) <= x;
                pntr <= pntr+1;
            end if;
        end if;
    end process;

end architecture;
