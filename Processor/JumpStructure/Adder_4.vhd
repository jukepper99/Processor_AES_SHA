library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_signed.all;

entity Adder is
    Port ( Instruction : in STD_LOGIC_VECTOR (31 downto 0);
           OutAdder : out STD_LOGIC_VECTOR (31 downto 0));
end Adder;

architecture Behavioral of Adder is

begin
    process(Instruction)
        begin 
            OutAdder <= Instruction + x"0004";
        end process;

end Behavioral;
