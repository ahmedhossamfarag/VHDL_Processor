library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
use work.constants_pck.all;

entity control is
  port (
    code: in std_logic_vector(INS_CL-1 downto 0);
    ac_rw, memo_rw, mar_rw, mar_addr: out std_logic;
    bs_sl: out std_logic_vector(1 downto 0)
  );
end entity;

architecture control of control is
begin

    bs_sl <=
        BALU when code(code'high) = ALU_OP(ALU_OP'high) else
        BMEMO when code = MEMO_READ or code = MEMO_IREAD else
        BMAR when code = MAR_READ else
        BX;

    ac_rw <=
        '1' when code(code'high) = ALU_OP(ALU_OP'high) or
                  code = MEMO_READ or code = MEMO_IREAD or
                  code = MAR_READ or code = AC_WRITE else
        '0';


    memo_rw <=
        '1' when code = MEMO_WRITE or code = MEMO_IWRITE else
        '0';

    mar_rw <=
        '1' when code = MAR_WRITE else
        '0';

    mar_addr <=
        '1' when code = MEMO_IREAD or code = MEMO_IWRITE else
        '0';

end architecture;
