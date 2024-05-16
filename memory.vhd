library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
use work.constants_pck.all;

entity memory is
  port (
    CLK: in std_logic;
    x:in std_logic_vector(n-1 downto 0);
    addr: in std_logic_vector(n-1 downto 0);
    rw: in std_logic;
    y:out std_logic_vector(n-1 downto 0)
  );
end entity;

architecture memory of memory is
    signal memo: memotype := (others => (others => '0'));
begin

    y <= memo(to_integer(unsigned(addr)));

    write: process(CLK)
    begin
        if CLK'event and rw = '1' then
          memo(to_integer(unsigned(addr))) <= x;
        end if;
    end process;

end architecture;
