library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
use work.constants_pck.all;

entity jump is
  port (
    x:in std_logic_vector(1 downto 0);
    cd: in std_logic_vector(INS_CL-1 downto 0);
    y:out std_logic
  );
end entity;

architecture jump of jump is
begin
    y <=
        '1' when cd = JMP_GT and x = GT else
        '1' when cd = JMP_GE and (x = GT or x = EQ) else
        '1' when cd = JMP_LT and x = LT else
        '1' when cd = JMP_LE and (x = LT or x = EQ) else
        '1' when cd = JMP_EQ and x = EQ else
        '1' when cd = JMP_NE and x /= EQ else
        '1' when cd = JMP else
        '0';

end architecture;
