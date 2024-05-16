library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
use work.constants_pck.all;

entity cmp is
  port (
    x:in std_logic_vector(n-1 downto 0);
    y:out std_logic_vector(n-1 downto 0)
  );
end entity;

architecture cmp of cmp is
    signal y0, yn: std_logic;
    signal z: std_logic_vector(n-1 downto 0) := (others=>'0');
begin
    y0 <= '1' when x = z else '0';
    yn <= x(n-1);

    y(1 downto 0) <=
      GT when yn = '0' and y0 ='0' else
      EQ when yn = '0' and y0 = '1' else
      LT;

    y(n-1 downto 2) <= (others => '0');

end architecture;
