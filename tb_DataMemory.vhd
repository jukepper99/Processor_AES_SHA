----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.06.2021 18:48:12
-- Design Name: 
-- Module Name: tb_DataMemory - Behavioral
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

entity tb_DataMemory is
--  Port ( );
end tb_DataMemory;

architecture Behavioral of tb_DataMemory is

    component Data_memory
        Port (Clk : in STD_LOGIC;
              Address : in STD_LOGIC_VECTOR (31 downto 0);
              Write : in STD_LOGIC;
              Read: in STD_LOGIC;
              Data_in : in STD_LOGIC_VECTOR (31 downto 0);
              Data_out : out STD_LOGIC_VECTOR(31 downto 0));
    end component;
    
    signal clkOut: STD_LOGIC;
    signal address: STD_LOGIC_VECTOR(31 downto 0);
    signal write: STD_LOGIC;
    signal read: STD_LOGIC;
    signal dataIn: STD_LOGIC_VECTOR(31 downto 0);
    signal dataOut: STD_LOGIC_VECTOR(31 downto 0);
begin
    
    clkOut<= '1' after 0 ns, '0' after 10 ns, '1' after 20 ns, '0' after 30 ns, '1' after 40 ns,
                '0' after 50 ns;
    address<= x"00000001" after 0 ns, x"00000002" after 30 ns;
    write<= '1' after 0 ns, '0' after 10 ns;
    read<= '0' after 0 ns, '1' after 20 ns;
    dataIn<= x"11111111" after 0 ns;
    
    Memory: Data_memory port map(clkOut, address, write, read, dataIn, dataOut);

end Behavioral;
