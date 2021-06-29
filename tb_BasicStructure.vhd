----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.06.2021 12:22:48
-- Design Name: 
-- Module Name: tb_BasicStructure - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_BasicStructure is
--  Port ( );
end tb_BasicStructure;

architecture Behavioral of tb_BasicStructure is
    
    component BasicStructure is
        Port ( signal instruction: in STD_LOGIC_VECTOR(31 downto 0) );
    end component;
    
    signal instruction: STD_LOGIC_VECTOR(31 downto 0);
    
begin
    
    BASIC: BasicStructure port map(instruction);
    
    --instruction<="00000000001000100000000000000000"after 0 ns, "00000000001000100000000000000001" after 10 ns, "00000000001000100000000000000010" after 20 ns,
             --"00000000001000100000000000000011" after 30 ns, "00000000001000100000000000000100" after 40 ns, "00000000001000100000000000000101" after 50 ns,
             --"00000000001000100000000000000110" after 60 ns, "00000000001000100000000000000111" after 70 ns, "00000000001000100000000000000111" after 80 ns;
             
    --instruction<= "00000100000000010000000000000011" after 10 ns;
    --instruction<= "00001000000000100000000000000000" after 10 ns;
    instruction<= "00001100000000010000000000001000" after 10 ns;

end Behavioral;
