library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InvFinalRound is
    Port ( Round_in : in STD_LOGIC_VECTOR (127 downto 0);
           Key_in : in STD_LOGIC_VECTOR (127 downto 0);
           Key_out : inout STD_LOGIC_VECTOR (127 downto 0);
           Rcon_in : in STD_LOGIC_VECTOR (7 downto 0);
           Round_out : out STD_LOGIC_VECTOR (127 downto 0));
end InvFinalRound;

architecture Behavioral of InvFinalRound is

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
    
    Component AddRoundKey is 
        Port ( S_in : in STD_LOGIC_VECTOR (127 downto 0);
               Kr_in : in STD_LOGIC_VECTOR (127 downto 0);
               Add_out : out STD_LOGIC_VECTOR (127 downto 0));
    end Component;
    
    signal Sub_inout, Shift_inout : STD_LOGIC_VECTOR (127 downto 0);
    
begin
    F1: AddRoundKey port map (Round_in, Key_in, Shift_inout);
    
    F2: InvShiftRow port map (Shift_inout, Sub_inout);
    
    F3: InvByteSub port map (Sub_inout, Round_out);
    
    F4: InvKeyExpansion port map (Key_in, Rcon_in, Key_out);

end Behavioral;
