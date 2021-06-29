----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.06.2021 19:02:46
-- Design Name: 
-- Module Name: tb_SignExtender - Behavioral
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

entity tb_SignExtender is
--  Port ( );
end tb_SignExtender;

architecture Behavioral of tb_SignExtender is
    component Sign_extender 
        Port ( Sign_in : in STD_LOGIC_VECTOR (15 downto 0);
               Sign_out : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    signal signExtIn: STD_LOGIC_VECTOR (15 downto 0);
    signal signExtOut: STD_LOGIC_VECTOR (31 downto 0);
begin
    signExtIn <= x"0111" after 0 ns, x"F111" after 10 ns;
    
    Extend_Sign: Sign_extender port map(signExtIn, signExtOut);
    
end Behavioral;
