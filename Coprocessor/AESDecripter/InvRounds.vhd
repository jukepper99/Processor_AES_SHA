library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InvRounds is
    Port ( Round_in : in STD_LOGIC_VECTOR (127 downto 0);
           Key_in : in STD_LOGIC_VECTOR (127 downto 0);
           Key_out : inout STD_LOGIC_VECTOR (127 downto 0);
           Rcon_in : in STD_LOGIC_VECTOR (7 downto 0);
           Round_out : out STD_LOGIC_VECTOR (127 downto 0));
end InvRounds;

architecture Behavioral of InvRounds is

    Component InvKeyExpansion is 
        Port ( K : in STD_LOGIC_VECTOR (127 downto 0);
               Rcon : in STD_LOGIC_VECTOR (7 downto 0);
               W : out STD_LOGIC_VECTOR (127 downto 0));
    end Component;
    
    Component InvByteSub is 
        Port ( Sub_in : in STD_LOGIC_VECTOR (127 downto 0);
               Sub_out : out STD_LOGIC_VECTOR (127 downto 0));
    end Component;
    
    Component InvShiftRow is 
        Port ( Shift_in : in STD_LOGIC_VECTOR (127 downto 0);
               Shift_out : out STD_LOGIC_VECTOR (127 downto 0));
    end Component;
    
    Component InvMixColumns is
        Port ( InvMix_in : in STD_LOGIC_VECTOR (127 downto 0);
               InvMix_out : out STD_LOGIC_VECTOR (127 downto 0));
    end Component;
    
    Component AddRoundKey is 
        Port ( S_in : in STD_LOGIC_VECTOR (127 downto 0);
               Kr_in : in STD_LOGIC_VECTOR (127 downto 0);
               Add_out : out STD_LOGIC_VECTOR (127 downto 0));
    end Component;
    
    signal Sub_inout, Shift_inout, Mix_inout : STD_LOGIC_VECTOR (127 downto 0);
    
begin
    S1: AddRoundKey port map (Round_in, Key_in, Mix_inout);
    
    S2: InvMixColumns port map (Mix_inout, Shift_inout);
    
    S3: InvShiftRow port map (Shift_inout, Sub_inout);
    
    S4: InvByteSub port map (Sub_inout, Round_out);
    
    S5: InvKeyExpansion port map (Key_in, Rcon_in, Key_out);
    
end Behavioral;
