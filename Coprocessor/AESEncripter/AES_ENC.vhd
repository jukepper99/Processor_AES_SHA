library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AES_ENC is
    Port ( PlainText : in STD_LOGIC_VECTOR (127 downto 0);
           Key : in STD_LOGIC_VECTOR (127 downto 0);
           CipherText : out STD_LOGIC_VECTOR (127 downto 0);
           Key10Out : out STD_LOGIC_VECTOR (127 downto 0));
end AES_ENC;

architecture Behavioral of AES_ENC is
    Component Rounds is 
        Port ( Round_in : in STD_LOGIC_VECTOR (127 downto 0);
               Key_in : in STD_LOGIC_VECTOR (127 downto 0);
               Key_out : inout STD_LOGIC_VECTOR (127 downto 0);
               Rcon_in : in STD_LOGIC_VECTOR (7 downto 0);
               Round_out : out STD_LOGIC_VECTOR (127 downto 0));
    end Component;
    
    Component FinalRound is
        Port ( Round_in : in STD_LOGIC_VECTOR (127 downto 0);
               Key_in : in STD_LOGIC_VECTOR (127 downto 0);
               Key_out : inout STD_LOGIC_VECTOR (127 downto 0);
               Rcon_in : in STD_LOGIC_VECTOR (7 downto 0);
               Round_out : out STD_LOGIC_VECTOR (127 downto 0));    
    end Component;
    
    Component AddRoundKey is 
        Port ( S_in : in STD_LOGIC_VECTOR (127 downto 0);
               Kr_in : in STD_LOGIC_VECTOR (127 downto 0);
               Add_out : out STD_LOGIC_VECTOR (127 downto 0));
    end Component;
    
    signal Key1, Key2, Key3, Key4, Key5, Key6, Key7, Key8, Key9, Key10 : STD_LOGIC_VECTOR (127 downto 0);
    signal R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10 : STD_LOGIC_VECTOR (127 downto 0);
        
    --Rcon(j)=x^(j-1)
    signal Rcon1 : STD_LOGIC_VECTOR (7 downto 0) := x"01"; --Rcon(1)=x^0=01
    signal Rcon2 : STD_LOGIC_VECTOR (7 downto 0) := x"02"; --Rcon(2)=x^1=02
    signal Rcon3 : STD_LOGIC_VECTOR (7 downto 0) := x"04"; --Rcon(3)=x^2=04
    signal Rcon4 : STD_LOGIC_VECTOR (7 downto 0) := x"08"; --Rcon(4)=x^3=08
    signal Rcon5 : STD_LOGIC_VECTOR (7 downto 0) := x"10"; --Rcon(5)=x^4=10
    signal Rcon6 : STD_LOGIC_VECTOR (7 downto 0) := x"20"; --Rcon(6)=x^5=20
    signal Rcon7 : STD_LOGIC_VECTOR (7 downto 0) := x"40"; --Rcon(7)=x^6=40
    signal Rcon8 : STD_LOGIC_VECTOR (7 downto 0) := x"80"; --Rcon(8)=x^7=80
    signal Rcon9 : STD_LOGIC_VECTOR (7 downto 0) := x"1b"; --Rcon(9)=x^8=1b
    signal Rcon10 : STD_LOGIC_VECTOR (7 downto 0) := x"36"; --Rcon(10)=x^9=36
   
begin
    Round0: AddRoundKey port map (PlainText, Key, R0);
    
    Round1: Rounds port map (R0, Key, Key1, Rcon1, R1);
    
    Round2: Rounds port map (R1, Key1, Key2, Rcon2, R2);
    
    Round3: Rounds port map (R2, Key2, Key3, Rcon3, R3);
    
    Round4: Rounds port map (R3, Key3, Key4, Rcon4, R4);
    
    Round5: Rounds port map (R4, Key4, Key5, Rcon5, R5);
    
    Round6: Rounds port map (R5, Key5, Key6, Rcon6, R6);
    
    Round7: Rounds port map (R6, Key6, Key7, Rcon7, R7);
    
    Round8: Rounds port map (R7, Key7, Key8, Rcon8, R8);
    
    Round9: Rounds port map (R8, Key8, Key9, Rcon9, R9);
    
    Round10: FinalRound port map (R9, Key9, Key10, Rcon10, R10);
    
    Key10Out <= Key10;
    
    CipherText <= R10;

end Behavioral;
