library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
use work.constants_pck.all;

entity mult is
  port (
    x1,x2:in std_logic_vector(n-1 downto 0);
    y:out std_logic_vector(n-1 downto 0)
  );
end entity;

architecture mult of mult is
    signal s: std_logic_vector(n*n+2*n-1 downto 0);
begin
    s(n-1 downto 0) <= (others => '0');
    G: for i in 0 to n-1 generate
        multadd_inst: entity work.multadd
        port map (
          x1   => x1,
          x2   => s(n-1+(n+1)*i downto (n+1)*i),
          b    => x2(i),
          y    => s(2*n-1+(n+1)*i downto n+(n+1)*i),
          cout => s(2*n+(n+1)*i)
        );
        y(i) <= s(n+(n+1)*i);
    end generate;
end architecture;
