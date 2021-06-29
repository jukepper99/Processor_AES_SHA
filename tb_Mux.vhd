----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.06.2021 18:59:40
-- Design Name: 
-- Module Name: tb_Mux - Behavioral
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

entity tb_Mux is
--  Port ( );
end tb_Mux;

architecture Behavioral of tb_Mux is
    component MUX_5
        Port ( In_1 : in STD_LOGIC_VECTOR (4 downto 0);
               In_2 : in STD_LOGIC_VECTOR (4 downto 0);
               Selection : in STD_LOGIC;
               Out_mux : out STD_LOGIC_VECTOR (4 downto 0));
    end component;
    
    signal in1, in2: STD_LOGIC_VECTOR (4 downto 0);
    signal selection : STD_LOGIC;
    signal outMux: STD_LOGIC_VECTOR (4 downto 0);
begin
    in1 <= "00001" after 0 ns, "00010" after 30 ns;
    in2 <= "00111" after 0 ns, "00100" after 20 ns;
    selection <= '0' after 0 ns, '1' after 10 ns, '0' after 30 ns;
    
    MUX_Registers: Mux_5 port map(in1, in2, selection, outMux);
end Behavioral;
