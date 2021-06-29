----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.06.2021 18:36:07
-- Design Name: 
-- Module Name: tb_ALUControl - Behavioral
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

entity tb_ALUControl is
--  Port ( );
end tb_ALUControl;

architecture Behavioral of tb_ALUControl is
    component ALU_control
        Port (Alu_operation : in STD_LOGIC_VECTOR (1 downto 0);
              Alu_control_in : in STD_LOGIC_VECTOR(5 downto 0);
              Alu_control_out : out STD_LOGIC_VECTOR(5 downto 0));
    end component;

    signal alu_mode: STD_LOGIC_VECTOR(1 downto 0);
    signal alu_operation_in: STD_LOGIC_VECTOR(5 downto 0);
    signal alu_operation_out: STD_LOGIC_VECTOR(5 downto 0);
    
begin
    alu_mode <="00" after 0 ns, "01" after 10 ns, "10" after 20 ns, "11" after 30 ns;
    alu_operation_in <="000101" after 0 ns;
    
    ArLoUnit_Control: ALU_control port map(alu_mode, alu_operation_in, alu_operation_out);

end Behavioral;
