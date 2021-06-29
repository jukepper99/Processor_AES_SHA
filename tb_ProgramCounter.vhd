----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.06.2021 19:01:21
-- Design Name: 
-- Module Name: tb_ProgramCounter - Behavioral
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

entity tb_ProgramCounter is
--  Port ( );
end tb_ProgramCounter;

architecture Behavioral of tb_ProgramCounter is
    component Program_counter is
        Port ( Clk: in std_logic;
               Instr_in : in STD_LOGIC_VECTOR (31 downto 0);
               Instr_out : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    signal clkOut: STD_LOGIC;
    signal InstructionIn, InstructionOut: STD_LOGIC_VECTOR(31 downto 0);
begin
    clkOut<= '1' after 0 ns, '0' after 10 ns, '1' after 20 ns, '0' after 30 ns, '1' after 40 ns,
                '0' after 50 ns, '1' after 60 ns, '0' after 70 ns;
    InstructionIn<= x"00010000" after 10 ns,x"00010001" after 20 ns,
                   x"00010010" after 30 ns, x"00010011" after 40 ns;

    Counter: Program_counter port map(clkOut, InstructionIn, InstructionOut);
    
end Behavioral;
