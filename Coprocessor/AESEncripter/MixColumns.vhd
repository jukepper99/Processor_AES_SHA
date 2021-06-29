library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MixColumns is
    Port ( Mix_in : in STD_LOGIC_VECTOR (127 downto 0);
           Mix_out : out STD_LOGIC_VECTOR (127 downto 0));
end MixColumns;

architecture Behavioral of MixColumns is

    Component MixColumn32 is 
        Port ( Column_in : in STD_LOGIC_VECTOR (31 downto 0);
               Column_out : out STD_LOGIC_VECTOR (31 downto 0));
    end Component;
    
begin
    C0: MixColumn32 port map(Mix_in(127 downto 96), Mix_out(127 downto 96));
    C1: MixColumn32 port map(Mix_in(95 downto 64), Mix_out(95 downto 64));
    C2: MixColumn32 port map(Mix_in(63 downto 32), Mix_out(63 downto 32));
    C3: MixColumn32 port map(Mix_in(31 downto 0), Mix_out(31 downto 0));

end Behavioral;
