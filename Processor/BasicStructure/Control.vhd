library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Control is
    Port ( Code : in STD_LOGIC_VECTOR (5 downto 0);
           Reg_destination : out STD_LOGIC;
           Reg_write : out STD_LOGIC;
           Mem_register : out STD_LOGIC;
           Mem_read : out STD_LOGIC;
           Mem_write : out STD_LOGIC;
           Alu_source : out STD_LOGIC;
           Alu_operation : out STD_LOGIC_VECTOR (1 downto 0);
           Branch : out STD_LOGIC;
           Jump : out STD_LOGIC;
           Mem_cypher: out STD_LOGIC;
           Mem_hasher: out STD_LOGIC;
           Start_hash: out STD_LOGIC);
end Control;

architecture Behavioral of Control is
begin
    process(Code)
        begin
            case Code is
                when "000000" => --R type
                    Reg_destination <= '1';
                    Reg_write <= '1';
                    Mem_register <= '0';
                    Mem_read <= '0';
                    Mem_write <= '0';
                    Alu_source <= '0';
                    Alu_operation <= "00";
                    Branch <= '0';
                    Jump <= '0';
              when "000001" => -- LW
                    Reg_destination <= '0';
                    Reg_write <= '1';
                    Mem_register <= '1';
                    Mem_read <= '1';
                    Mem_write <= '0';
                    Alu_source <= '1';
                    Alu_operation <= "11";
                    Branch <= '0';
                    Jump <= '0';
              when "000010" => -- SW
                    Reg_destination <= '0';
                    Reg_write <= '0';
                    Mem_register <= '0';
                    Mem_read <= '0';
                    Mem_write <= '1';
                    Alu_source <= '1';
                    Alu_operation <= "11";
                    Branch <= '0';
                    Jump <= '0';
             when "000011" => -- addi
                    Reg_destination <= '0';
                    Reg_write <= '1';
                    Mem_register <= '0';
                    Mem_read <= '0';
                    Mem_write <= '0';
                    Alu_source <= '1';
                    Alu_operation <= "11";
                    Branch <= '0';
                    Jump <= '0';
             when "000100" => -- beq
                    Reg_destination <= '0';
                    Reg_write <= '0';
                    Mem_register <= '0';
                    Mem_read <= '0';
                    Mem_write <= '0';
                    Alu_source <= '0';
                    Alu_operation <= "01";
                    Branch <= '1';
                    Jump <= '0';
             when "000101" => -- j
                    Reg_destination <= '0';
                    Reg_write <= '0';
                    Mem_register <= '0';
                    Mem_read <= '0';
                    Mem_write <= '0';
                    Alu_source <= '0';
                    Alu_operation <= "00";
                    Branch <= '0';
                    Jump <= '1';
             when "000110" => -- slti
                    Reg_destination <= '0';
                    Reg_write <= '1';
                    Mem_register <= '0';
                    Mem_read <= '0';
                    Mem_write <= '0';
                    Alu_source <= '1';
                    Alu_operation <= "10";
                    Branch <= '0';
                    Jump <= '0';
             when "000111" => -- lcy
                    Reg_destination <= '0';
                    Reg_write <= '0';
                    Mem_register <= '0';
                    Mem_read <= '1';
                    Mem_write <= '0';
                    Alu_source <= '1';
                    Alu_operation <= "11";
                    Branch <= '0';
                    Jump <= '0';
                    Mem_cypher <= '1';
             when "001000" => -- sty
                    Reg_destination <= '0';
                    Reg_write <= '0';
                    Mem_register <= '0';
                    Mem_read <= '0';
                    Mem_write <= '0';
                    Alu_source <= '0';
                    Alu_operation <= "00";
                    Branch <= '0';
                    Jump <= '0';
                    Mem_cypher <= '0';
             when "001001" => -- lch
                    Reg_destination <= '0';
                    Reg_write <= '0';
                    Mem_register <= '0';
                    Mem_read <= '1';
                    Mem_write <= '0';
                    Alu_source <= '1';
                    Alu_operation <= "11";
                    Branch <= '0';
                    Jump <= '0';
                    Mem_hasher <= '1';
             when "001010" => -- rh
                    Reg_destination <= '0';
                    Reg_write <= '0';
                    Mem_register <= '0';
                    Mem_read <= '1';
                    Mem_write <= '0';
                    Alu_source <= '1';
                    Alu_operation <= "11";
                    Branch <= '0';
                    Jump <= '0';
                    Mem_hasher <= '0';
             when "001011" => -- sth
                    Reg_destination <= '0';
                    Reg_write <= '0';
                    Mem_register <= '0';
                    Mem_read <= '0';
                    Mem_write <= '0';
                    Alu_source <= '0';
                    Alu_operation <= "00";
                    Branch <= '0';
                    Jump <= '0';
                    Start_hash <= '1';
             when others =>   
                    Reg_destination <= '0';
                    Reg_write <= '0';
                    Mem_register <= '0';
                    Mem_read <= '0';
                    Mem_write <= '0';
                    Alu_source <= '0';
                    Alu_operation <= "00";
                    Branch <= '0';
                    Jump <= '0';
         end case;

end process;

end Behavioral;
