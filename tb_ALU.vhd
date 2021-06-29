----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.06.2021 23:45:34
-- Design Name: 
-- Module Name: tb_ALU - Behavioral
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

entity tb_ALU is
--  Port ( );
end tb_ALU;

architecture Behavioral of tb_ALU is

    component ALU
        Port (Alu_in_1 : in STD_LOGIC_VECTOR (31 downto 0);
              Alu_in_2 : in STD_LOGIC_VECTOR (31 downto 0);
              Alu_control : in STD_LOGIC_VECTOR (5 downto 0);
              Flag_zero : out STD_LOGIC;
              Alu_result : out STD_LOGIC_VECTOR(31 downto 0));
    end component;
    
    signal alu_in_1: STD_LOGIC_VECTOR(31 downto 0);
    signal alu_in_2: STD_LOGIC_VECTOR(31 downto 0);
    signal alu_control: STD_LOGIC_VECTOR(5 downto 0);
    signal zero: STD_LOGIC;
    signal alu_out: STD_LOGIC_VECTOR(31 downto 0);
    
begin
    alu_in_1 <= x"01234567" after 0 ns;
    alu_in_2 <= x"76543210" after 0 ns, x"01234567" after 10 ns, x"76543210" after 20 ns;
    alu_control <= "000000" after 0 ns, "000001" after 10 ns, "000010" after 20 ns,
                        "000011" after 30ns, "000100" after 40 ns, "000101" after 50 ns,
                        "000110" after 60ns, "000111" after 70 ns;
    
    ArLoUnit: ALU port map(alu_in_1, alu_in_2, alu_control, zero, alu_out);

end Behavioral;
