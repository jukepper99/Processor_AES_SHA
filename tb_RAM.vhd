----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.06.2021 18:34:20
-- Design Name: 
-- Module Name: tb_RAM - Behavioral
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

entity tb_RAM is
--  Port ( );
end tb_RAM;

architecture Behavioral of tb_RAM is
    
    component RAM is
        Port ( Clk : in STD_LOGIC;
               Write : in STD_LOGIC;
               Address : in STD_LOGIC_VECTOR (2 downto 0);
               Data_in : in STD_LOGIC_VECTOR (31 downto 0);
               Data_out1 : out STD_LOGIC_VECTOR (127 downto 0);
               Data_out2: out STD_LOGIC_VECTOR (127 downto 0));
    end component;
    
    signal clkOut: STD_LOGIC;
    signal address: STD_LOGIC_VECTOR(2 downto 0);
    signal write: STD_LOGIC;
    signal dataIn: STD_LOGIC_VECTOR(31 downto 0);
    signal dataOut1, dataOut2: STD_LOGIC_VECTOR(127 downto 0);
    
begin
    
    clkOut<= '1' after 0 ns, '0' after 10 ns, '1' after 20 ns, '0' after 30 ns, '1' after 40 ns,
                '0' after 50 ns, '1' after 60 ns, '0' after 70 ns, '1' after 80 ns;
    address<= "000" after 0 ns, "001" after 10 ns, "010" after 20 ns, "011" after 30 ns,
                "100" after 40 ns, "101" after 50 ns, "110" after 60 ns, "111" after 70 ns,
                 "000" after 80 ns;
    write<= '1' after 0 ns, '0' after 80 ns;
    dataIn<= x"10101111" after 0 ns;
    
    Memory: RAM port map(clkOut, write, address, dataIn, dataOut1, dataOut2);

end Behavioral;
