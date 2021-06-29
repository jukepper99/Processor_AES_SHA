library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_control is
    Port ( Alu_operation : in STD_LOGIC_VECTOR (1 downto 0);
           Alu_control_in : in STD_LOGIC_VECTOR(5 downto 0);
           Alu_control_out : out STD_LOGIC_VECTOR(5 downto 0));
end ALU_control;

architecture Behavioral of ALU_control is

begin
    process(Alu_operation, Alu_control_in)
        begin
            case Alu_operation is
                when "00" =>                              -- R-TYPE
                    Alu_control_out <= Alu_control_in; 
                when "01" =>                              -- BEQ
                    Alu_control_out <= "000001";           -- sub
                when "10" =>                              -- SLTI
                    Alu_control_out <= "000111";           -- comp
                when "11" =>                              -- ADDI
                    Alu_control_out <= "000000";           -- add
                when others =>
                    Alu_control_out <= "000000";
            end case;
    end process;

end Behavioral;
