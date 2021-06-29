library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_signed.all;
use IEEE.NUMERIC_STD.ALL;

entity Adder_branch is
    Port ( In_1 : in STD_LOGIC_VECTOR (31 downto 0);
           In_2 : in STD_LOGIC_VECTOR (31 downto 0);
           Out_adder_branch : out STD_LOGIC_VECTOR (31 downto 0));
end Adder_branch;

architecture Behavioral of Adder_branch is

begin
    process(In_1, In_2)
        begin
            Out_adder_branch <= In_1 + In_2;
    end process;

end Behavioral;
