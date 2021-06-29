library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Program_counter is
    Port ( Clk: in STD_LOGIC;
           Instr_in : in STD_LOGIC_VECTOR (31 downto 0);
           Instr_out : out STD_LOGIC_VECTOR (31 downto 0));
end Program_counter;

architecture Behavioral of Program_counter is

signal address: STD_LOGIC_VECTOR(31 downto 0):= "00000000000000000000000000000000";

begin
    process(Clk)
        begin
		  Instr_out <= address;
		      if Clk='0' and Clk'event then
	               address <= Instr_in;
		      end if;
	end process;

end Behavioral;
