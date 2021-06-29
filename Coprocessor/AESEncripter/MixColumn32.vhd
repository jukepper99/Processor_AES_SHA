library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MixColumn32 is
    Port ( Column_in : in STD_LOGIC_VECTOR (31 downto 0);
           Column_out : out STD_LOGIC_VECTOR (31 downto 0));
end MixColumn32;

architecture Behavioral of MixColumn32 is

    signal S0, S1, S2, S3 : STD_LOGIC_VECTOR (7 downto 0);
    signal S0Double, S1Double, S2Double, S3Double : STD_LOGIC_VECTOR (7 downto 0);
    signal S0Triple, S1Triple, S2Triple, S3Triple : STD_LOGIC_VECTOR (7 downto 0);
    
begin
    S0 <= Column_in(31 downto 24);
    S0Double <= ((Column_in(30 downto 24) & '0') xor x"1B") when Column_in(31) = '1'
                else (Column_in(30 downto 24) & '0');
    S0Triple <= S0 xor S0Double;
   
    
    S1 <= Column_in(23 downto 16);
    S1Double <= ((Column_in(22 downto 16) & '0') xor x"1B") when Column_in(23) = '1'
                else (Column_in(22 downto 16) & '0');
    S1Triple <= S1 xor S1Double;
    
    
    S2 <= Column_in(15 downto 8);
    S2Double <= ((Column_in(14 downto 8) & '0') xor x"1B") when Column_in(15) = '1'
                else (Column_in(14 downto 8) & '0');
    S2Triple <= S2 xor S2Double;
    
    
    S3 <= Column_in(7 downto 0);
    S3Double <= ((Column_in(6 downto 0) & '0') xor x"1B") when Column_in(7) = '1'
                else (Column_in(6 downto 0) & '0');
    S3Triple <= S3 xor S3Double;


    Column_out(31 downto 24) <= S0Double xor S1Triple xor S2 xor S3;
    Column_out(23 downto 16) <= S0 xor S1Double xor S2Triple xor S3;
    Column_out(15 downto 8) <= S0 xor S1 xor S2Double xor S3Triple;
    Column_out(7 downto 0) <= S0Triple xor S1 xor S2 xor S3Double;
    
end Behavioral;
