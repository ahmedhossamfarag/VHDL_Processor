library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fulladder is
    port (
        x1,x2, cin:in std_logic;
        y,cout:out std_logic
    );
end entity;

architecture fulladder of fulladder is
    signal s : std_logic;
begin
    s <= x1 xor x2 xor cin;
    cout <=  (x1 and x2 and cin) or ((not s) and (x1 or x2 or cin));
    y <= s;
end architecture;
