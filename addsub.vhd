library ieee;
  use ieee.std_logic_1164.all;
use work.constants_pck.all;

entity addsub is
  port (
    x1,x2:in std_logic_vector(n-1 downto 0);
    sbt:in std_logic;
    y:out std_logic_vector(n-1 downto 0);
    cout:out std_logic
  );
end entity;

architecture addsub of addsub is
  signal sbtext,s:std_logic_vector(n-1 downto 0);
begin
    sbtext <= (others => sbt);
    s <= x2 xor sbtext;
    add_inst: entity work.add
    port map (
      x1   => x1,
      x2   => s,
      cin  => sbt,
      y    => y,
      cout => cout
    );
end architecture;
