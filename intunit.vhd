library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity intunit is
  port (
    CLK:in std_logic;
    interrupt:in std_logic;
    p:inout std_logic := '0'
  );
end entity;

architecture intunit of intunit is
    signal p_clk: std_logic;
    signal cnt_clk: std_logic:='0';
    signal int_on: std_logic:='1';
    signal cnt_on: std_logic:='0';
begin

    -- cnt_clk <= cnt_on and not CLK;

    p_clk <= (interrupt and int_on) or  (cnt_clk);


    p_process: process(p_clk)
    begin
        if p_clk'event and p_clk = '1' then
            p <= not p;
        end if;
    end process;

    clk_process: process(CLK)
    begin
        if CLK'event and CLK = '1' then
            if p = '1' then
                int_on <= '0';
                cnt_on <= '1';
            end if;
            if cnt_on = '1' then
                cnt_clk <= not cnt_clk;
                cnt_on <= not cnt_clk;
            end if;
        end if;
    end process;

    -- clk_process: process(CLK)
    -- begin
    --     if CLK'event and CLK = '1' then
    --         if p = '1' then
    --             int_on <= '0';
    --             cnt_on <= '1';
    --         end if;
    --     end if;

    --     if CLK'event and CLK = '0' then
    --         cnt_on <= p and not p_clk;
    --     end if;
    -- end process;
end architecture;
