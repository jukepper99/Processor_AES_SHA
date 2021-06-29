----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.06.2021 18:19:40
-- Design Name: 
-- Module Name: tb_FlipFlopD - Behavioral
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

entity tb_FlipFlopD is
--  Port ( );
end tb_FlipFlopD;

architecture Behavioral of tb_FlipFlopD is

    component Delay is
        Port ( Clk : in STD_LOGIC;
               Data_in : in STD_LOGIC_VECTOR (2 downto 0);
               Data_out : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    signal clkOut: STD_LOGIC;
    signal dataIn, dataOut: STD_LOGIC_VECTOR(2 downto 0);

begin
    clkOut<= '1' after 0 ns, '0' after 10 ns, '1' after 20 ns, '0' after 30 ns, '1' after 40 ns,
                '0' after 50 ns;
    dataIn<= "101" after 10 ns, "111" after 20 ns;
    
    FlipFlopD: Delay port map(clkOut, dataIn, dataOut);
end Behavioral;
