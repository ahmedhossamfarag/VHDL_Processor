library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
use work.constants_pck.all;

entity pcounter is
  port (
    CLK:in std_logic;
    memo:in insmemotype;
    cmpr:in std_logic_vector(1 downto 0);
    interrupt:in std_logic;
    y:inout std_logic_vector(INS_LN-1 downto 0)
  );
end entity;

architecture pcounter of pcounter is
  signal cd: std_logic_vector(INS_CL-1 downto 0);

  signal yj: std_logic;
  signal inc: integer;
  signal aftercnt: integer;
  signal nextcnt: integer;
  signal cnt: integer:=INTP_LN;
  signal current: integer:=cnt;

  signal int_on: std_logic;
  signal int_in: std_logic := '0';

  signal stack_in: integer;
  signal stack_out: integer;
  signal stack_rd: std_logic;
  signal stack_ld: std_logic;
begin
    cd <= y(INS_LN-1 downto n);

    jump_inst: entity work.jump
    port map (
      x  => cmpr,
      cd => cd,
      y  => yj
    );

    stack_ld <= '1' when int_on = '1' or cd = PRO_CALL else '0';
    stack_rd <= '1' when cd = INT_RTN or cd = PRO_RTN else '0';
    stack_in <= aftercnt when int_on = '1' else cnt+inc;

    stack_inst: entity work.stack
    port map (
      CLK => CLK,
      x   => stack_in,
      rd  => stack_rd,
      ld  => stack_ld,
      y   => stack_out
    );


    int_on <= interrupt and (not int_in);

    inc <=
        to_integer(unsigned(y(n-1 downto 0))) when yj = '1' else
        1 when cnt < memo'high else
        0;

    aftercnt <=
      to_integer(unsigned(y(n-1 downto 0))) when cd = GOTO or cd = PRO_CALL else
      stack_out when stack_rd = '1' else
      cnt + inc;

    nextcnt <=
      0 when int_on = '1' else
      aftercnt;

    count: process(CLK, interrupt)
    begin
        if CLK'event then
            if CLK = '1' then

              cnt <= nextcnt;

              if int_on = '1' then
                int_in <= '1';
              elsif cd = INT_RTN then
                int_in <= '0';
              end if;

            else
              current <= cnt;
            end if;
        end if;
    end process;

    y <= memo(current);

end architecture;
