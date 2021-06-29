----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.04.2021 19:20:23
-- Design Name: 
-- Module Name: tb_main - Behavioral
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

entity tb_main is
--  Port ( );
end tb_main;

architecture Behavioral of tb_main is

component main
    Port ( Ciphertext: out STD_LOGIC_VECTOR(127 downto 0);
           Plaintext : out STD_LOGIC_VECTOR (127 downto 0);
           Hash : out std_logic_vector (255 downto 0));
end component;
   
signal Ciphertext: STD_LOGIC_VECTOR(127 downto 0);
signal Plaintext : STD_LOGIC_VECTOR(127 downto 0);     
signal Hash : std_logic_vector (255 downto 0);

begin
    
    Circuit: main port map(Ciphertext => Ciphertext,
                           Plaintext => Plaintext,
                           Hash => Hash);
end Behavioral;
