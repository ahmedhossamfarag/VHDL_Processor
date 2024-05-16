library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity counter is
  port (
    CLK: in std_logic;
    y1: out std_logic_vector(1 downto 0);
    y2,y3: out std_logic_vector(3 downto 0)
  );
end entity;

architecture counter of counter is
    signal cnt: integer := 0;
    signal s: std_logic_vector(9 downto 0);
begin

    count: process(CLK)
    begin
        if CLK'event then
            cnt <= cnt +1;
            s <= std_logic_vector(to_unsigned(cnt, 10));
        end if;
    end process;

    y1 <= s(1 downto 0);
    y2 <= s(5 downto 2);
    y3 <= s(9 downto 6);

end architecture;
