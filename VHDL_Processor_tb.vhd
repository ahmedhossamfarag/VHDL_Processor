library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.constants_pck.all;

entity VHDL_Processor_tb is
end entity VHDL_Processor_tb;

architecture rtl of VHDL_Processor_tb is
    constant period_time : time:= 833333 ps;
    signal   finished    : std_logic := '0';
    signal CLK : std_logic;
    signal memo: insmemotype;
    signal y: std_logic_vector(n-1 downto 0);
    signal interrupt: std_logic := '0';

    -- signal p:std_logic;
begin
    sim_time_proc: process
    begin
        wait for 200 ms;
        finished <= '1';
        wait;
    end process sim_time_proc;

    clk_proc: process
    begin
        while finished /= '1' loop
            CLK <= '0';
            wait for period_time/2;
            CLK <= '1';
            wait for period_time/2;
        end loop;
        wait;
    end process clk_proc;


    run: process
    begin
        -- interrupt program
        memo(0) <= MEMO_WRITE & "0000";
        memo(1) <= AC_WRITE & "0011";
        memo(2) <= MEMO_READ & "0000";
        memo(3) <= INT_RTN & "0000";
        -- main program

        -- memo(4) <= AC_WRITE & "1010";
        -- memo(5) <= ALU_ADD & "0100";
        -- memo(6) <= MEMO_WRITE & "1100";
        -- memo(7) <= AC_WRITE & "0000";
        -- memo(8) <= MEMO_READ & "1100";
        -- memo(9) <= JMP & "0010";
        -- memo(11) <= AC_WRITE & "1111";
        -- memo(12) <= ALU_CMP & "1010";
        -- memo(13) <= JMP_GE & "0010";
        -- memo(15) <= GOTO & x"4";

        -- memo(4) <= AC_WRITE & x"F";
        -- memo(5) <= MEMO_WRITE& x"C";
        -- memo(6) <= AC_WRITE & x"5";
        -- memo(7) <= MEMO_WRITE & x"D";
        -- memo(8) <= PRO_CALL & x"B";
        -- memo(9) <= MEMO_READ & x"C";
        -- memo(10) <= GOTO & x"4";
        -- memo(11) <= MEMO_READ & x"C";
        -- memo(12) <= ALU_IXOR & x"D";
        -- memo(13) <= MEMO_WRITE & x"C";
        -- memo(14) <= AC_WRITE & x"0";
        -- memo(15) <= PRO_RTN & x"0";

        memo(4) <= AC_WRITE & x"B";
        memo(5) <= MAR_WRITE & x"0";
        memo(6) <= AC_WRITE & x"5";
        memo(7) <= MEMO_IWRITE & x"0";
        memo(8) <= MAR_READ & x"0";
        memo(9) <= MEMO_IREAD & x"0";

        wait;
    end process;

    do_int: process
    begin
        wait for 4 * period_time + period_time / 2;
        interrupt <= '1';
        wait for period_time * 2;
        interrupt <= '0';
        wait;
    end process;

    cpu_inst: entity work.cpu
    port map (
      CLK  => CLK,
      memo => memo,
      interrupt => interrupt,
      y    => y
    );

    -- pcounter_inst: entity work.pcounter
    -- port map (
    --   CLK       => CLK,
    --   memo      => memo,
    --   cmpr      => "--",
    --   interrupt => interrupt
    -- );

    -- intunit_inst: entity work.intunit
    -- port map (
    --     CLK       => CLK,
    --     interrupt => interrupt,
    --     p         => p
    -- );

end architecture rtl;
