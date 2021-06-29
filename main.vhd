library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port ( Ciphertext: out STD_LOGIC_VECTOR(127 downto 0);
           Plaintext : out STD_LOGIC_VECTOR (127 downto 0);
           Hash : out STD_LOGIC_VECTOR(255 downto 0));
end main;

architecture Behavioral of main is
    
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
    
    --Jump unit related
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
    
    --Coprocessor
    component Coprocessor is
        Port ( Clk: in std_logic;
               Datos_in : in std_logic_VECTOR(31 downto 0);
	           WriteAES: in std_logic;
	           WriteSHA: in STD_LOGIC;
	           Address: in std_logic_vector(2 downto 0);
               Ciphertext : out STD_LOGIC_VECTOR (127 downto 0);
               Plaintext : out STD_LOGIC_VECTOR (127 downto 0);
               Hash : out std_logic_vector (255 downto 0);
               Start_Sha: std_logic);
    end component;
    
    --General purpose
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
    
    --control signals
    signal control_reg_destination: STD_LOGIC;
    signal control_reg_write: STD_LOGIC;
    signal control_mem_register: STD_LOGIC;
    signal control_mem_read : STD_LOGIC;
    signal control_mem_write: STD_LOGIC;
    signal control_alu_source: STD_LOGIC;
    signal control_alu_operation: STD_LOGIC_VECTOR (1 downto 0);
    signal control_branch: STD_LOGIC;
    signal control_branch_2: STD_LOGIC;
    signal control_jump: STD_LOGIC;
    signal control_mem_cypher: STD_LOGIC;
    signal control_mem_hasher: STD_LOGIC;
    signal control_start_hash: STD_LOGIC;
    
    --alu related signals
    signal alu_out: STD_LOGIC_VECTOR(31 downto 0);
    signal alu_control_out: STD_LOGIC_VECTOR(5 downto 0);
    signal zero: STD_LOGIC;
    signal mux_alu_out: STD_LOGIC_VECTOR(31 downto 0);
    
    --data memory signals
    signal memory_out: STD_LOGIC_VECTOR(31 downto 0);
    signal mux_mem_out: STD_LOGIC_VECTOR(31 downto 0);
    
    -- registers signals
    signal registers_out1, registers_out2: STD_LOGIC_VECTOR(31 downto 0);
    signal mux_reg_out: STD_LOGIC_VECTOR(4 downto 0);
    
    -- instruction related signals
    signal opcode, funct: STD_LOGIC_VECTOR(5 downto 0);
	signal rs, rt, rd, shampt, write_reg: STD_LOGIC_VECTOR(4 downto 0);
	signal instruction: STD_LOGIC_VECTOR(31 downto 0);
    signal address_inst: STD_LOGIC_VECTOR(4 downto 0);
	
	--sign extender signals
	signal signExtIn: STD_LOGIC_VECTOR(15 downto 0);
    signal signExtOut: STD_LOGIC_VECTOR(31 downto 0);
	
	--clock signal 
	signal clk: STD_LOGIC;
	
	--jump structure related signals
	signal outMuxBranch: STD_LOGIC_VECTOR(31 downto 0);
    signal instructionAddress: STD_LOGIC_VECTOR(31 downto 0);
    signal nextAddress: STD_LOGIC_VECTOR(31 downto 0);
    signal inShifter: STD_LOGIC_VECTOR(25 downto 0);
    signal outShifter: STD_LOGIC_VECTOR(27 downto 0);
    signal inMux: STD_LOGIC_VECTOR(31 downto 0);
    signal shifter32Out: STD_LOGIC_VECTOR(31 downto 0);
    signal sumBranchOut: STD_LOGIC_VECTOR(31 downto 0);
    signal outMuxJump: STD_LOGIC_VECTOR(31 downto 0);
    
	--coprocessor related signals
	signal address_cypher: STD_LOGIC_VECTOR(2 downto 0);
    

begin
    --instruction subdivision
    opcode <= instruction(31 downto 26);
	rs <= instruction(25 downto 21);
	rt <= instruction(20 downto 16);
	rd <= instruction(15 downto 11);
	shampt <= instruction(10 downto 6);
	funct <= instruction(5 downto 0);
	signExtIn <= instruction(15 downto 0);
	address_cypher <= instruction(18 downto 16);
	inshifter <= instruction(25 downto 0);
	
	--control
	control_branch_2<= zero and control_branch;
	
	Control_CPU: Control port map(opcode, control_reg_destination, control_reg_write, control_mem_register, 
	                   control_mem_read, control_mem_write,control_alu_source, control_alu_operation, control_branch,
	                    control_jump, control_mem_cypher, control_mem_hasher, control_start_hash);
    
    --alu
    ArLoUnit: ALU port map(registers_out1, mux_alu_out, alu_control_out, zero, alu_out);
    ArLoUnit_Control: ALU_control port map(control_alu_operation, funct, alu_control_out);
    MUX_ArLoUnit: Mux_32 port map(registers_out2, signextout, control_alu_source, mux_alu_out);
    
    --memories
    Memory: Data_memory port map(clk, alu_out, control_mem_write, control_mem_read, registers_out2, memory_out);
    MUX_Memory: Mux_32 port map(alu_out, memory_out, control_mem_register, mux_mem_out);
    
    Register_bank: Registers port map(clk, control_reg_write, mux_reg_out, rs, rt, mux_mem_out, registers_out1, registers_out2);
    MUX_Registers: Mux_5 port map(rt, rd, control_reg_destination, mux_reg_out);
    
    Instructions: instruction_memory port map(instructionAddress, instruction);
    
    --jump&branch
    Counter: Program_counter port map(clk, outMuxJump, instructionAddress); 
    Address_adder: adder port map(instructionAddress, nextaddress);
    
    inmux<= nextaddress(31 downto 28) & outshifter; 
    MUX_jump: mux_32 port map(outMuxBranch, inmux, control_jump, outMuxJump);
    
    Shifter_short: shifter port map(inshifter, outshifter);
    
    Branch_adder: Adder_branch port map(nextAddress, shifter32Out, sumBranchOut);
    MUX_Branch: mux_32 port map(nextaddress, sumBranchOut, control_branch_2, outMuxBranch);
    
    Shifter_large: shifter_32 port map(signExtOut, shifter32Out);
    
    --general
    Crystal: Clock port map(clk);
    
    Extend_Sign: Sign_extender port map(signExtIn, signExtOut);
    
    --coprocessor
    Coprocessor_AES_SHA: Coprocessor port map(clk, memory_out, control_mem_cypher, control_mem_hasher, address_cypher, CipherText, PlainText, Hash, control_start_hash);
    
end Behavioral;
