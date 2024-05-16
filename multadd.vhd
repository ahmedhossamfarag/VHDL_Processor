library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
use work.constants_pck.all;

entity multadd is
  port (
    x1,x2:in std_logic_vector(n-1 downto 0);
    b:in std_logic;
    y:out std_logic_vector(n-1 downto 0);
    cout:out std_logic
  );
end entity;

architecture multadd of multadd is
  signal bext, m: std_logic_vector(n-1 downto 0);
begin
    bext <= (others => b);
    m <= x1 and bext;
    add_inst: entity work.add
    port map (
      x1   => m,
      x2   => x2,
      cin  => '0',
      y    => y,
      cout => cout
    );
end architecture;
