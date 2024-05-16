library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

package myPkg is
    function "and"(constant vec:in std_logic_vector; constant sing:in std_logic) return std_logic_vector;
    function "xor"(constant vec:in std_logic_vector; constant sing:in std_logic) return std_logic_vector;
end package myPkg;
