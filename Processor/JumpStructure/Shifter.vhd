library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shifter is
    Port ( In_shift : in STD_LOGIC_VECTOR (25 downto 0);
           Out_shift : out STD_LOGIC_VECTOR (27 downto 0));
end shifter;

architecture Behavioral of shifter is

begin
    Out_shift <= In_shift & "00";

end Behavioral;
