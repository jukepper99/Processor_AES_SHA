library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_32 is
    Port ( In_1 : in STD_LOGIC_VECTOR (31 downto 0);
           In_2 : in STD_LOGIC_VECTOR (31 downto 0);
           Selection : in STD_LOGIC;
           Out_mux : out STD_LOGIC_VECTOR (31 downto 0));
end MUX_32;

architecture Behavioral of MUX_32 is

begin   
    Out_mux <= In_1 when Selection = '0' else
                In_2 when Selection = '1';
                
end Behavioral;
