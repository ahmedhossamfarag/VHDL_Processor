library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
use work.constants_pck.all;

entity add is
  port (
    x1,x2:in std_logic_vector(n-1 downto 0);
    cin:in std_logic;
    y:out std_logic_vector(n-1 downto 0);
    cout:out std_logic
  );
end entity;

architecture add of add is
  signal s:std_logic_vector(n downto 0);
  component fulladder is
      port (
          x1   : in std_logic;
          x2   : in std_logic;
          cin  : in std_logic;
          y    : out std_logic;
          cout : out std_logic
      );
  end component fulladder;
begin
    s(0) <= cin;
    F: for i in 0 to n-1 generate
        fulladder_ins: fulladder
        port map (
          x1   => x1(i),
          x2   => x2(i),
          cin  => s(i),
          y    => y(i),
          cout => s(i+1)
        );
    end generate;
    cout <= s(n);
end architecture;
