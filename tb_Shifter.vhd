----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.06.2021 19:02:11
-- Design Name: 
-- Module Name: tb_Shifter - Behavioral
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

entity tb_Shifter is
--  Port ( );
end tb_Shifter;

architecture Behavioral of tb_Shifter is
    component Shifter is
        Port ( In_Shift : in STD_LOGIC_VECTOR (25 downto 0);
               Out_Shift : out STD_LOGIC_VECTOR (27 downto 0));
    end component;
    
    signal inShifter : STD_LOGIC_VECTOR (25 downto 0);
    signal outShifter : STD_LOGIC_VECTOR (27 downto 0);
begin
    inShifter <= "11010111100001111111100011" after 0 ns;
    
    Shifter_short: shifter port map(inshifter, outshifter);
    
end Behavioral;
