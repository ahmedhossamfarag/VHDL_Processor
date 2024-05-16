library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
use work.constants_pck.all;

entity processor is
  port (
    CLK: in std_logic;
    ins:in std_logic_vector(INS_LN-1 downto 0);
    y:out std_logic_vector(n-1 downto 0)
  );
end entity;

architecture processor of processor is
    signal x: std_logic_vector(n-1 downto 0);
    signal opr: std_logic_vector(n-1 downto 0);
    signal memo_addr: std_logic_vector(n-1 downto 0);
    signal bs, ymemo, yalu, ymar : std_logic_vector(n-1 downto 0);
    signal ac : std_logic_vector(n-1 downto 0);
    signal ac_rw, memo_rw, mar_rw, mar_addr : std_logic;
    signal bs_sl: std_logic_vector(1 downto 0);
begin

    x <= ins(n-1 downto 0);

    control_inst: entity work.control
    port map (
      code    => ins(INS_LN-1 downto n),
      ac_rw   => ac_rw,
      memo_rw => memo_rw,
      mar_rw => mar_rw,
      mar_addr => mar_addr,
      bs_sl   => bs_sl
    );

    memo_addr <= ymar when mar_addr = '1' else x;

    memory_inst: entity work.memory
    port map (
      CLK  => CLK,
      x    => ac,
      addr => memo_addr,
      rw   => memo_rw,
      y    => ymemo
    );

    reg_ac: entity work.reg
    port map (
      CLK => CLK,
      x   => bs,
      rw  => ac_rw,
      y   => ac
    );

    reg_mar: entity work.reg
    port map (
      CLK => CLK,
      x   => ac,
      rw  => mar_rw,
      y   => ymar
    );

    opr <= x when ins(INS_LN-2) = '0' else ymemo;

    alu_inst: entity work.alu
    port map (
      x1 => ac,
      x2 => opr,
      cd => ins(ALU_CL+n-1 downto n),
      y  => yalu
    );


    with bs_sl select
    bs <=
        yalu when BALU,
        ymemo when BMEMO,
        ymar when BMAR,
        x when others;

    y <= ac;

end architecture;
