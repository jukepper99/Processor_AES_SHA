library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Clock IS
	Port ( Wave_out : out STD_LOGIC);
end Clock;

architecture Behavioral of CLOCK is

constant Num_cycles : INTEGER := 10000;
signal  Clk : STD_ULOGIC := '1';

begin
    process
        begin
            for i in 1 to Num_cycles loop
                Clk <= not Clk;
                Wave_out <= Clk;
                wait for 5 ns;
                Clk <= not Clk;
                Wave_out <= Clk;
                wait for 5 ns;
            end loop;
    end process;

end Behavioral;