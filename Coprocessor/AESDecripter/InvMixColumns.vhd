library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InvMixColumns is
    Port ( InvMix_in : in STD_LOGIC_VECTOR (127 downto 0);
           InvMix_out : out STD_LOGIC_VECTOR (127 downto 0));
end InvMixColumns;

architecture Behavioral of InvMixColumns is
    
    Component InvMixColumn32 is 
        Port ( C_in : in STD_LOGIC_VECTOR (31 downto 0);
               C_out : out STD_LOGIC_VECTOR (31 downto 0));
    end Component;

begin
    C0: InvMixColumn32 port map(InvMix_in(127 downto 96), InvMix_out(127 downto 96));
    C1: InvMixColumn32 port map(InvMix_in(95 downto 64), InvMix_out(95 downto 64));
    C2: InvMixColumn32 port map(InvMix_in(63 downto 32), InvMix_out(63 downto 32));
    C3: InvMixColumn32 port map(InvMix_in(31 downto 0), InvMix_out(31 downto 0));

end Behavioral;
