library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AddRoundKey is
    Port ( S_in : in STD_LOGIC_VECTOR (127 downto 0);
           Kr_in : in STD_LOGIC_VECTOR (127 downto 0);
           Add_out : out STD_LOGIC_VECTOR (127 downto 0));
end AddRoundKey;

architecture Behavioral of AddRoundKey is

begin
    Add_out <= S_in xor Kr_in;

end Behavioral;
