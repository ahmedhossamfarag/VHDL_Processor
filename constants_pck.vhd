library ieee;
  use ieee.std_logic_1164.all;

package constants_pck is

    constant n : integer := 4;

    -- ALU Codes
    constant ALU_CL: integer := 4;  --ALU Code Ln
    constant ADDX : std_logic_vector(ALU_CL-1 downto 0) := "0000";
    constant SUBX : std_logic_vector(ALU_CL-1 downto 0) := "0001";
    constant MULX : std_logic_vector(ALU_CL-1 downto 0) := "0010";
    constant SHROTX : std_logic_vector(ALU_CL-1 downto 0) := "0011";
    constant CMPX : std_logic_vector(ALU_CL-1 downto 0) := "0100";
    constant ANDX : std_logic_vector(ALU_CL-1 downto 0) := "0101";
    constant ORX : std_logic_vector(ALU_CL-1 downto 0) := "0110";
    constant NOTX : std_logic_vector(ALU_CL-1 downto 0) := "0111";
    constant NANDX : std_logic_vector(ALU_CL-1 downto 0) := "1000";
    constant NORX : std_logic_vector(ALU_CL-1 downto 0) := "1001";
    constant XORX : std_logic_vector(ALU_CL-1 downto 0) := "1010";
    constant XNORX : std_logic_vector(ALU_CL-1 downto 0) := "1011";

    -- Shift Rotate Codes
    constant SHL : std_logic_vector(1 downto 0) := "00";
    constant SHR : std_logic_vector(1 downto 0) := "01";
    constant RTL : std_logic_vector(1 downto 0) := "10";
    constant RTR : std_logic_vector(1 downto 0) := "11";

    -- Compare Codes
    constant GT : std_logic_vector(1 downto 0) := "00";
    constant EQ : std_logic_vector(1 downto 0) := "01";
    constant LT : std_logic_vector(1 downto 0) := "10";

    -- Bus Codes
    constant BMEMO : std_logic_vector(1 downto 0) := "00";
    constant BALU : std_logic_vector(1 downto 0) := "01";
    constant BMAR : std_logic_vector(1 downto 0) := "10";
    constant BX : std_logic_vector(1 downto 0) := "11";

    --- Processor Codes
    constant INS_CL : integer := 6; --Inst Code Ln
    constant INS_LN : integer := INS_CL + n; --Inst Ln
    constant INTP_LN : integer := 4;  --Interrupt Prog Ln

    constant NO_OP : std_logic_vector(INS_CL-1 downto 0) := "000000";
    -- Load
    constant AC_WRITE : std_logic_vector(INS_CL-1 downto 0) := "000001";

    -- Memory
    constant MEMO_WRITE : std_logic_vector(INS_CL-1 downto 0) := "000010";
    constant MEMO_READ : std_logic_vector(INS_CL-1 downto 0) := "000011";

    -- Jump
    constant JMP_GT : std_logic_vector(INS_CL-1 downto 0) := "001000";
    constant JMP_GE : std_logic_vector(INS_CL-1 downto 0) := "001001";
    constant JMP_LT : std_logic_vector(INS_CL-1 downto 0) := "001010";
    constant JMP_LE : std_logic_vector(INS_CL-1 downto 0) := "001011";
    constant JMP_NE : std_logic_vector(INS_CL-1 downto 0) := "001100";
    constant JMP_EQ : std_logic_vector(INS_CL-1 downto 0) := "001101";
    constant JMP : std_logic_vector(INS_CL-1 downto 0) := "001110";

    -- Procedure
    constant GOTO : std_logic_vector(INS_CL-1 downto 0) := "001111";
    constant PRO_CALL : std_logic_vector(INS_CL-1 downto 0) := "010000";
    constant PRO_RTN : std_logic_vector(INS_CL-1 downto 0) := "010001";

    -- Memory Address Register
    constant MEMO_IWRITE : std_logic_vector(INS_CL-1 downto 0) := "010010";
    constant MEMO_IREAD : std_logic_vector(INS_CL-1 downto 0) := "010011";
    constant MAR_WRITE : std_logic_vector(INS_CL-1 downto 0) := "010100";
    constant MAR_READ : std_logic_vector(INS_CL-1 downto 0) := "010101";

    -- Interrupt
    constant INT_RTN : std_logic_vector(INS_CL-1 downto 0) := "011111";

    -- ALU
    constant ALU_OP : std_logic_vector(1 downto 0) := "10";
    constant ALU_IOP : std_logic_vector(1 downto 0) := "11";
    constant ALU_ADD : std_logic_vector(INS_CL-1 downto 0) := ALU_OP & ADDX;
    constant ALU_SUB : std_logic_vector(INS_CL-1 downto 0) := ALU_OP & SUBX;
    constant ALU_MUL : std_logic_vector(INS_CL-1 downto 0) := ALU_OP & MULX;
    constant ALU_SHROT : std_logic_vector(INS_CL-1 downto 0) := ALU_OP & SHROTX;
    constant ALU_CMP : std_logic_vector(INS_CL-1 downto 0) := ALU_OP & CMPX;
    constant ALU_AND : std_logic_vector(INS_CL-1 downto 0) := ALU_OP & ADDX;
    constant ALU_OR : std_logic_vector(INS_CL-1 downto 0) := ALU_OP & ORX;
    constant ALU_NOT : std_logic_vector(INS_CL-1 downto 0) := ALU_OP & NOTX;
    constant ALU_NAND : std_logic_vector(INS_CL-1 downto 0) := ALU_OP & NANDX;
    constant ALU_NOR : std_logic_vector(INS_CL-1 downto 0) := ALU_OP & NORX;
    constant ALU_XOR : std_logic_vector(INS_CL-1 downto 0) := ALU_OP & XORX;
    constant ALU_XNOR : std_logic_vector(INS_CL-1 downto 0) := ALU_OP & XNORX;
    constant ALU_IADD : std_logic_vector(INS_CL-1 downto 0) := ALU_IOP & ADDX;
    constant ALU_ISUB : std_logic_vector(INS_CL-1 downto 0) := ALU_IOP & SUBX;
    constant ALU_IMUL : std_logic_vector(INS_CL-1 downto 0) := ALU_IOP & MULX;
    constant ALU_ISHROT : std_logic_vector(INS_CL-1 downto 0) := ALU_IOP & SHROTX;
    constant ALU_ICMP : std_logic_vector(INS_CL-1 downto 0) := ALU_IOP & CMPX;
    constant ALU_IAND : std_logic_vector(INS_CL-1 downto 0) := ALU_IOP & ADDX;
    constant ALU_IOR : std_logic_vector(INS_CL-1 downto 0) := ALU_IOP & ORX;
    constant ALU_INOT : std_logic_vector(INS_CL-1 downto 0) := ALU_IOP & NOTX;
    constant ALU_INAND : std_logic_vector(INS_CL-1 downto 0) := ALU_IOP & NANDX;
    constant ALU_INOR : std_logic_vector(INS_CL-1 downto 0) := ALU_IOP & NORX;
    constant ALU_IXOR : std_logic_vector(INS_CL-1 downto 0) := ALU_IOP & XORX;
    constant ALU_IXNOR : std_logic_vector(INS_CL-1 downto 0) := ALU_IOP & XNORX;

    -- Types
    type memotype is array(0 to 2**n-1) of std_logic_vector(n-1 downto 0);
    type insmemotype is array(0 to 2**n-1) of std_logic_vector(INS_LN-1 downto 0);
    type stacktype is array(0 to 4) of integer range 0 to 2**n-1;
end package constants_pck;
