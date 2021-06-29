----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.06.2021 23:32:38
-- Design Name: 
-- Module Name: tb_Control - Behavioral
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

entity tb_Control is
--  Port ( );
end tb_Control;

architecture Behavioral of tb_Control is

    component Control is
        Port ( Code : in STD_LOGIC_VECTOR (5 downto 0);
               Reg_destination : out STD_LOGIC;
               Reg_write : out STD_LOGIC;
               Mem_register : out STD_LOGIC;
               Mem_read : out STD_LOGIC;
               Mem_write : out STD_LOGIC;
               Alu_source : out STD_LOGIC;
               Alu_operation : out STD_LOGIC_VECTOR (1 downto 0);
               Branch : out STD_LOGIC;
               Jump : out STD_LOGIC;
               Mem_cypher: out STD_LOGIC;
               Mem_hasher: out STD_LOGIC;
               Start_hash: out STD_LOGIC);
    end component;
    
    signal control_opcode: STD_LOGIC_VECTOR (5 downto 0);

    signal control_reg_destination: STD_LOGIC;
    signal control_reg_write: STD_LOGIC;
    signal control_mem_register: STD_LOGIC;
    signal control_mem_read : STD_LOGIC;
    signal control_mem_write: STD_LOGIC;
    signal control_alu_source: STD_LOGIC;
    signal control_alu_operation: STD_LOGIC_VECTOR (1 downto 0);
    signal control_branch: STD_LOGIC;
    signal control_jump: STD_LOGIC;

begin
    control_opcode <= "000000" after 0 ns, "000001" after 10 ns, "000010" after 20 ns,
                        "000011" after 30ns, "000100" after 40 ns, "000101" after 50 ns,
                        "000110" after 60ns, "000111" after 70 ns;
    
    Control_CPU: Control port map(control_opcode, control_reg_destination, control_reg_write, control_mem_register, 
	                   control_mem_read, control_mem_write,control_alu_source, control_alu_operation, control_branch,
	                    control_jump);

end Behavioral;
