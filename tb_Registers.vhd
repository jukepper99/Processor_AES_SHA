----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.06.2021 18:59:04
-- Design Name: 
-- Module Name: tb_Registers - Behavioral
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

entity tb_Registers is
--  Port ( );
end tb_Registers;

architecture Behavioral of tb_Registers is
    component Registers
        Port (Clk : in STD_LOGIC;
              Write : in STD_LOGIC;
              Address_write : in STD_LOGIC_VECTOR (4 downto 0);
              Address_read_1 : in STD_LOGIC_VECTOR (4 downto 0);
              Address_read_2 : in STD_LOGIC_VECTOR (4 downto 0);
              Data_write : in STD_LOGIC_VECTOR (31 downto 0);
              Data_read_1 : out STD_LOGIC_VECTOR (31 downto 0);
              Data_read_2 : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    signal clkOut: STD_LOGIC;
    signal addressW, addressR1, addressR2 : STD_LOGIC_VECTOR(4 downto 0);
    signal write: STD_LOGIC;
    signal read: STD_LOGIC;
    signal dataIn: STD_LOGIC_VECTOR(31 downto 0);
    signal dataOut1, dataOut2: STD_LOGIC_VECTOR(31 downto 0);
begin
    clkOut<= '1' after 0 ns, '0' after 10 ns, '1' after 20 ns, '0' after 30 ns, '1' after 40 ns,
                '0' after 50 ns;
    addressW<= "00001" after 0 ns, "00000" after 20 ns;
    addressR1<= "00010" after 0 ns, "00001" after 30 ns;
    addressR2<= "00011" after 0 ns;
    write<= '0' after 0 ns, '1' after 20 ns, '0' after 30 ns;
    read<= '1' after 0 ns, '0' after 20 ns, '1' after 30 ns;
    dataIn<= x"11111111" after 0 ns;

    Register_bank: Registers port map(clkOut, write, addressW, addressR1, addressR2,
                 dataIn, dataOut1, dataOut2);
end Behavioral;
