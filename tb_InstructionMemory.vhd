----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.06.2021 19:00:56
-- Design Name: 
-- Module Name: tb_InstructionMemory - Behavioral
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

entity tb_InstructionMemory is
--  Port ( );
end tb_InstructionMemory;

architecture Behavioral of tb_InstructionMemory is
    component Instruction_memory is
        Port ( Address : in STD_LOGIC_VECTOR (31 downto 0);
               Instruction : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    signal instructionAddress, instruction : STD_LOGIC_VECTOR (31 downto 0);
begin
    instructionAddress <= x"00000000" after 0 ns, x"00000007" after 10 ns;    
    
    Instructions: instruction_memory port map(instructionAddress, instruction);
    
end Behavioral;
