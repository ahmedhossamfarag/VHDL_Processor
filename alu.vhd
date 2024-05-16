library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
use work.constants_pck.all;

entity alu is
  port (
    x1,x2:in std_logic_vector(n-1 downto 0);
    cd: in std_logic_vector(ALU_CL-1 downto 0);
    y:out std_logic_vector(n-1 downto 0)
  );
end entity;

architecture alu of alu is
    signal sbt: std_logic;
    signal yaddsub, ymult, yshiftrot, ycmp: std_logic_vector(n-1 downto 0);
    signal yand, yor, ynot, ynand, ynor, yxor, yxnor: std_logic_vector(n-1 downto 0);
    signal cout: std_logic;
begin
    sbt <= '1' when cd = SUBX or cd = CMPX else '0';

    addsub_inst: entity work.addsub
    port map (
      x1   => x1,
      x2   => x2,
      sbt  => sbt,
      y    => yaddsub,
      cout => cout
    );

    mult_inst: entity work.mult
    port map (
      x1 => x1,
      x2 => x2,
      y  => ymult
    );

    shiftrot_inst: entity work.shiftrot
    port map (
      x  => x1,
      cd => x2(n-1 downto n-2),
      y  => yshiftrot
    );

    cmp_inst: entity work.cmp
    port map (
      x => yaddsub,
      y => ycmp
    );

    yand <= x1 and x2;
    yor <= x1 or x2;
    ynot <= not x2;
    ynand <= x1 nand x2;
    ynor <= x1 nor x2;
    yxor <= x1 xor x2;
    yxnor <= x1 xnor x2;

    with cd select
    y <=
        ymult when MULX,
        yshiftrot when SHROTX,
        ycmp when CMPX,
        yand when ANDX,
        yor when ORX,
        ynot when NOTX,
        ynand when NANDX,
        ynor when NORX,
        yxor when XORX,
        yxnor when XNORX,
        yaddsub when others;


end architecture;
