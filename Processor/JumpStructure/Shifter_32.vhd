library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shifter_32 is
    Port ( In_32 : in STD_LOGIC_VECTOR (31 downto 0);
           Out_32 : out STD_LOGIC_VECTOR (31 downto 0));
end shifter_32;

architecture Behavioral of shifter_32 is

signal temp: std_logic_vector(29 downto 0);

begin
    temp <= In_32(29 downto 0);
    Out_32 <= temp & "00";

end Behavioral;
