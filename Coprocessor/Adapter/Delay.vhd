library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Delay is
    Port ( Clk : in STD_LOGIC;
           Data_in : in STD_LOGIC_VECTOR (2 downto 0);
           Data_out : out STD_LOGIC_VECTOR (2 downto 0));
end Delay;

architecture Behavioral of Delay is

    signal Data: STD_LOGIC_VECTOR (2 downto 0);

begin
    process
        begin
            Data <= Data_in;
            wait until Clk'event and Clk='0';
            Data_out <= Data;
    end process;

end Behavioral;
