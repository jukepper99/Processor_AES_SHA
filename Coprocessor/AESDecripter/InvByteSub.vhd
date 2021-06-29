library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InvByteSub is
    Port ( Sub_in : in STD_LOGIC_VECTOR (127 downto 0);
           Sub_out : out STD_LOGIC_VECTOR (127 downto 0));
end InvByteSub;

architecture Behavioral of InvByteSub is

    Component InvSbox is 
        Port ( Byte_in : in STD_LOGIC_VECTOR (7 downto 0); 
               Byte_out : out STD_LOGIC_VECTOR (7 downto 0)); 
    end Component;

begin
    Subs: for i in 1 to 16 generate
        S: InvSbox port map (Sub_in(i*8-1 downto (i-1)*8), 
                             Sub_out(i*8-1 downto (i-1)*8));
    end generate Subs;
        
end Behavioral;
