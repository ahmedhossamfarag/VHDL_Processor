library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
package body myPkg is

    function "and"(constant vec:in std_logic_vector; constant sing:in std_logic) return std_logic_vector is
    variable ext: std_logic_vector(vec'length-1 downto 0);
    begin
        ext := (others => sing);
        return vec and ext;
    end function;

    function "xor"(constant vec:in std_logic_vector; constant sing:in std_logic) return std_logic_vector is
    variable ext: std_logic_vector(vec'length-1 downto 0);
    begin
        ext := (others => sing);
        return vec xor ext;
    end function;

end package body myPkg;
