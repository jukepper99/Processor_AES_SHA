----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.06.2021 00:33:57
-- Design Name: 
-- Module Name: tb_JumpStructure - Behavioral
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

entity tb_JumpStructure is
--  Port ( );
end tb_JumpStructure;

architecture Behavioral of tb_JumpStructure is
    component JumpStructure is 
        port(control: in std_logic;
             branch: in std_logic);
    end component;
    signal selection: std_logic;
    signal branch: std_logic;

begin
    selection <= '0' after 0 ns, '1' after 90 ns, '0' after 100 ns;
    branch <= '0' after 0 ns;
     
    JUMPER : JumpStructure port map(selection, branch);
end Behavioral;
