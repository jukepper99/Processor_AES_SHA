----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.06.2021 20:18:44
-- Design Name: 
-- Module Name: JumpStructure - Behavioral
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

entity JumpStructure is
  Port (signal control: std_logic;
        signal branch: std_logic);
end JumpStructure;

architecture Behavioral of JumpStructure is
    
    component Instruction_memory is
        Port ( Address : in STD_LOGIC_VECTOR (31 downto 0);
               Instruction : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    --Instruction related
    component Program_counter is
        Port ( Clk: in std_logic;
               Instr_in : in STD_LOGIC_VECTOR (31 downto 0);
               Instr_out : out STD_LOGIC_VECTOR (31 downto 0));
    end component;

    component Adder is
        Port ( Instruction : in STD_LOGIC_VECTOR (31 downto 0);
               OutAdder : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component Shifter is
        Port ( In_Shift : in STD_LOGIC_VECTOR (25 downto 0);
               Out_Shift : out STD_LOGIC_VECTOR (27 downto 0));
    end component;
    
    component Shifter_32 is
        Port ( In_32 : in STD_LOGIC_VECTOR (31 downto 0);
               Out_32 : out STD_LOGIC_VECTOR (31 downto 0));
    end component;

    component Adder_branch is
        Port ( In_1 : in STD_LOGIC_VECTOR (31 downto 0);
               In_2 : in STD_LOGIC_VECTOR (31 downto 0);
               Out_adder_branch : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component MUX_32
        Port ( In_1 : in STD_LOGIC_VECTOR (31 downto 0);
               In_2 : in STD_LOGIC_VECTOR (31 downto 0);
               Selection : in STD_LOGIC;
               Out_mux : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component Sign_extender 
        Port ( Sign_in : in STD_LOGIC_VECTOR (15 downto 0);
               Sign_out : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component Clock 
	   Port ( Wave_out : out std_logic);
    end component;
    
signal clk: std_logic;
signal salidaMux: std_logic_vector(31 downto 0);
signal salidaMuxbranch: std_logic_vector(31 downto 0);
signal address: std_logic_vector(31 downto 0);
signal nextaddress: std_logic_vector(31 downto 0);
signal instruction: std_logic_vector(31 downto 0);

signal inshifter: std_logic_vector(25 downto 0);
signal outshifter: std_logic_vector(27 downto 0);

signal inmux: std_logic_vector(31 downto 0);

signal signExtIn: std_logic_vector(15 downto 0);
signal signExtOut: std_logic_vector(31 downto 0);
signal shifter32Out: std_logic_vector(31 downto 0);
signal sumadorBranchOut: std_logic_vector(31 downto 0);

begin
    
    CRYSTAL: Clock port map(clk);
    
    COUNTER: Program_counter port map(clk, salidaMux, address);
    
    SUM: adder port map(address, nextAddress);
    
    INSTRUCTIONMEMORY: Instruction_memory port map(address, instruction);
    
    inshifter <= instruction(25 downto 0);
    
    SHIFT26: shifter port map(inshifter, outshifter);
    
    inmux<= nextaddress(31 downto 28) & outshifter; 
    
    MUX: mux_32 port map(salidamuxbranch, inmux, control, salidamux);
    
    signExtIn <= instruction(15 downto 0);
    
    EXTENDER: Sign_extender port map(signExtIn, signExtOut);
    
    SHIFT32: Shifter_32 port map(signExtOut, shifter32Out);
    
    SUMBRANCH: Adder_branch port map(nextAddress, shifter32Out, sumadorBranchOut);
    
    MUXBRANCH: mux_32 port map(nextaddress, sumadorBranchOut, branch, salidamuxbranch);

end Behavioral;
