library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Coprocessor is
    Port ( Clk: in STD_LOGIC;
           Datos_in : in STD_LOGIC_VECTOR(31 DOWNTO 0);
	       WriteAES: in STD_LOGIC;
	       WriteSHA: in STD_LOGIC;
	       Address: in STD_LOGIC_VECTOR(2 downto 0);
	       CipherText : out STD_LOGIC_VECTOR (127 downto 0);
	       PlainText : out STD_LOGIC_VECTOR (127 downto 0);
           Hash: out STD_LOGIC_VECTOR(255 downto 0);
           Start_Sha: STD_LOGIC);
end Coprocessor;

architecture Behavioral of Coprocessor is

    component RAM IS
        Port ( Clk : in STD_LOGIC;
               Write : in STD_LOGIC;
               Address : in STD_LOGIC_VECTOR (2 downto 0);
               Data_in : in STD_LOGIC_VECTOR (31 downto 0);
               Data_out1 : out STD_LOGIC_VECTOR (127 downto 0);
               Data_out2: out STD_LOGIC_VECTOR (127 downto 0));
    END component;

    component AES_ENC is
        Port ( PlainText : in STD_LOGIC_VECTOR (127 downto 0);
               Key : in STD_LOGIC_VECTOR (127 downto 0);
               CipherText : out STD_LOGIC_VECTOR (127 downto 0);
               Key10Out : out STD_LOGIC_VECTOR (127 downto 0));
    end component;

    component Delay is
        Port ( Clk : in STD_LOGIC;
               Data_in : in STD_LOGIC_VECTOR (2 downto 0);
               Data_out : out STD_LOGIC_VECTOR (2 downto 0));
    end component;

    component AES_DEC is
        Port ( CipherText : in STD_LOGIC_VECTOR (127 downto 0);
               Key : in STD_LOGIC_VECTOR (127 downto 0);
               PlainText : out STD_LOGIC_VECTOR (127 downto 0));
    end component;

    component sha_256 is
        Port ( Start : in STD_LOGIC;
               Message : in STD_LOGIC_VECTOR (255 downto 0);
               Hash : out STD_LOGIC_VECTOR (255 downto 0));
    end component;
   
    signal DatosOut1AES: STD_LOGIC_VECTOR (127 DOWNTO 0);
    signal DatosOut2AES: STD_LOGIC_VECTOR (127 DOWNTO 0);
    
    signal DatosOut1SHA: STD_LOGIC_VECTOR (127 DOWNTO 0);
    signal DatosOut2SHA: STD_LOGIC_VECTOR (127 DOWNTO 0);
    
    signal SignalAddress: STD_LOGIC_VECTOR (2 downto 0);
    
    signal CipherTextSign: STD_LOGIC_VECTOR (127 DOWNTO 0);
    
    signal Key10OutSign: STD_LOGIC_VECTOR (127 downto 0);

    signal Message: STD_LOGIC_VECTOR (255 downto 0);

begin
    
    RAM_Memory_AES: RAM port map(Clk, WriteAES, SignalAddress, Datos_in, DatosOut1AES, DatosOut2AES);
    
    RAM_Memory_SHA: RAM port map(Clk, WriteSHA, SignalAddress, Datos_in, DatosOut1SHA, DatosOut2SHA);
	               
	FlipFlopDMemory: Delay port map(Clk, Address, SignalAddress);
	
	Encript_AES: AES_ENC port map(DatosOut2AES, DatosOut1AES, CipherTextSign, Key10OutSign);
	
	CipherText <= CipherTextSign;
	
	Decript_AES: AES_DEC port map(CipherTextSign, Key10OutSign, PlainText);

    Message <= DatosOut1SHA & DatosOut2SHA;

    Sha_Module: sha_256 port map(Start_Sha, Message, Hash);

end Behavioral;
