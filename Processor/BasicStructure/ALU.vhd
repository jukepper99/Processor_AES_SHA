library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity ALU is
    Port ( Alu_in_1 : in STD_LOGIC_VECTOR (31 downto 0);
           Alu_in_2 : in STD_LOGIC_VECTOR (31 downto 0);
           Alu_control : in STD_LOGIC_VECTOR (5 downto 0);
           Flag_zero : out STD_LOGIC;
           Alu_result : out STD_LOGIC_VECTOR(31 downto 0));
end ALU;

architecture Behavioral of ALU is
signal result: STD_LOGIC_VECTOR(31 downto 0);
begin
    process(Alu_control, Alu_in_1, Alu_in_2)
        begin
            case Alu_control is 
                when "000000" =>
                    result <= Alu_in_1 + Alu_in_2;
                when "000001" =>
                    result <= Alu_in_1 - Alu_in_2;
                when "000010" =>
                    result <= Alu_in_1 and Alu_in_2;
                when "000011" =>
                    result <= Alu_in_1 or Alu_in_2;
                when "000100" =>
                    result <= Alu_in_1 xor Alu_in_2;
                when "000101" =>
                    result <= Alu_in_1 nand Alu_in_2;
                when "000110" =>
                    result <= Alu_in_1 nor Alu_in_2;
                when "000111" =>
                    if(Alu_in_1 < Alu_in_2) then 
                        result <= x"00000001";
                    else
                        result <= x"00000000";
                    end if;
                when others => result <= Alu_in_1 + Alu_in_2;
            end case;
    end process;
    
    Flag_zero <= '1' when(result = x"00000000") else '0';
    Alu_result <= result;
    
end Behavioral;
