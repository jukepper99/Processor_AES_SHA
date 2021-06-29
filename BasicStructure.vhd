----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.06.2021 20:18:23
-- Design Name: 
-- Module Name: BasicStructure - Behavioral
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

entity BasicStructure is
  Port ( signal instruction: in STD_LOGIC_VECTOR(31 downto 0) );
end BasicStructure;

architecture Behavioral of BasicStructure is

    --Control unit
    component Control
        Port (Code : in STD_LOGIC_VECTOR (5 downto 0);
              Reg_destination : out STD_LOGIC;
              Reg_write : out STD_LOGIC;
              Mem_register : out STD_LOGIC;
              Mem_read : out STD_LOGIC;
              mem_write : out STD_LOGIC;
              Alu_source : out STD_LOGIC;
              Alu_operation : out STD_LOGIC_VECTOR (1 downto 0);
              Branch : out STD_LOGIC;
              Jump : out STD_LOGIC;
              Mem_cypher: out STD_LOGIC;
              Mem_hasher: out STD_LOGIC;
              Start_hash: out STD_LOGIC);
    end component;
    
    --ALU and control
    component ALU
        Port (Alu_in_1 : in STD_LOGIC_VECTOR (31 downto 0);
              Alu_in_2 : in STD_LOGIC_VECTOR (31 downto 0);
              Alu_control : in STD_LOGIC_VECTOR (5 downto 0);
              Flag_zero : out STD_LOGIC;
              Alu_result : out STD_LOGIC_VECTOR(31 downto 0));
    end component;
    
    component ALU_control
        Port (Alu_operation : in STD_LOGIC_VECTOR (1 downto 0);
              Alu_control_in : in STD_LOGIC_VECTOR(5 downto 0);
              Alu_control_out : out STD_LOGIC_VECTOR(5 downto 0));
    end component;
    
    --Memories
    component Data_memory
        Port (Clk : in STD_LOGIC;
              Address : in STD_LOGIC_VECTOR (31 downto 0);
              Write : in STD_LOGIC;
              Read: in STD_LOGIC;
              Data_in : in STD_LOGIC_VECTOR (31 downto 0);
              Data_out : out STD_LOGIC_VECTOR(31 downto 0));
    end component;
    
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
    
    component MUX_32
        Port ( In_1 : in STD_LOGIC_VECTOR (31 downto 0);
               In_2 : in STD_LOGIC_VECTOR (31 downto 0);
               Selection : in STD_LOGIC;
               Out_mux : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component MUX_5
        Port ( In_1 : in STD_LOGIC_VECTOR (4 downto 0);
               In_2 : in STD_LOGIC_VECTOR (4 downto 0);
               Selection : in STD_LOGIC;
               Out_mux : out STD_LOGIC_VECTOR (4 downto 0));
    end component;
    
    component Sign_extender 
        Port ( Sign_in : in STD_LOGIC_VECTOR (15 downto 0);
               Sign_out : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component Clock 
	   Port ( Wave_out : out std_logic);
    end component;
    
    --Control
    signal control_reg_destination: STD_LOGIC;
    signal control_reg_write: STD_LOGIC;
    signal control_mem_register: STD_LOGIC;
    signal control_mem_read : STD_LOGIC;
    signal control_mem_write: STD_LOGIC;
    signal control_alu_source: STD_LOGIC;
    signal control_alu_operation: STD_LOGIC_VECTOR (1 downto 0);
    
    --ALU and Controller
    signal alu_out: STD_LOGIC_VECTOR(31 downto 0);
    signal zero: STD_LOGIC;
    signal alu_control_out: STD_LOGIC_VECTOR(5 downto 0);
    signal mux_alu_out: STD_LOGIC_VECTOR(31 downto 0);
    
    --Memory and Registers
    signal memory_out: STD_LOGIC_VECTOR(31 downto 0);
    signal registers_out1, registers_out2: STD_LOGIC_VECTOR(31 downto 0);
    signal mux_mem_out: STD_LOGIC_VECTOR(31 downto 0);
	signal mux_reg_out: STD_LOGIC_VECTOR(4 downto 0);
    
    --Instruction
    signal opcode, funct: STD_LOGIC_VECTOR(5 downto 0);
	signal rs, rt, rd, shampt: STD_LOGIC_VECTOR(4 downto 0);
	
	signal sign_ext_in: STD_LOGIC_VECTOR(15 downto 0);
	signal sign_ext_out: STD_LOGIC_VECTOR(31 downto 0);
	
	signal clk: STD_LOGIC;

begin
    
    opcode <= instruction(31 downto 26);
	rs <= instruction(25 downto 21);
	rt <= instruction(20 downto 16);
	rd <= instruction(15 downto 11);
	shampt <= instruction(10 downto 6);
	funct <= instruction(5 downto 0);
	sign_ext_in <= instruction(15 downto 0);
	
	CPU: Control port map(opcode, control_reg_destination, control_reg_write, control_mem_register, 
	                   control_mem_read, control_mem_write,control_alu_source, control_alu_operation);
    
    UAL: ALU port map(registers_out1, mux_alu_out, alu_control_out, zero, alu_out);
    
    UAL_CONTROL: ALU_control port map(control_alu_operation, funct, alu_control_out);
    
    MEMORY: Data_memory port map(clk, alu_out, control_mem_write, control_mem_read, registers_out2, memory_out);
    
    REGISTROS: Registers port map(clk, control_reg_write, mux_reg_out, rs, rt, mux_mem_out, registers_out1, registers_out2);
    
    MUXMEMORIA: Mux_32 port map(alu_out, memory_out, control_mem_register, mux_mem_out);
    
    MUXREGISTROS: Mux_5 port map(rt, rd, control_reg_destination, mux_reg_out);
    
    MUXALU: Mux_32 port map(registers_out2, sign_ext_out, control_alu_source, mux_alu_out);
    
    EXTENDER: Sign_extender port map(sign_ext_in, sign_ext_out);
    
    CRYSTAL: Clock port map(clk);

end Behavioral;
