library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
use work.constants_pck.all;

entity cpu is
  port (
    CLK:in std_logic;
    memo:in insmemotype;
    interrupt:in std_logic;
    y:out std_logic_vector(n-1 downto 0)
  );
end entity;

architecture cpu of cpu is
    signal ins : std_logic_vector(INS_LN-1 downto 0);
    signal yp : std_logic_vector(n-1 downto 0);
begin

    pcounter_inst: entity work.pcounter
    port map (
      CLK  => CLK,
      memo => memo,
      cmpr => yp(1 downto 0),
      interrupt => interrupt,
      y    => ins
    );

    processor_inst: entity work.processor
    port map (
      CLK => CLK,
      ins => ins,
      y   => yp
    );

    y <= yp;

end architecture;
