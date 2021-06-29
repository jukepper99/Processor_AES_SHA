library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InvKeyExpansion is
    Port ( K : in STD_LOGIC_VECTOR (127 downto 0);
           Rcon : in STD_LOGIC_VECTOR (7 downto 0);
           W : out STD_LOGIC_VECTOR (127 downto 0));
end InvKeyExpansion;

architecture Behavioral of InvKeyExpansion is
    
    Component Sbox is 
        Port ( Byte_in : in STD_LOGIC_VECTOR (7 downto 0);
               Byte_out : out STD_LOGIC_VECTOR (7 downto 0));
    end Component;
    
    signal w0, w1, w2, w3, w4, w5, w6, w7 : STD_LOGIC_VECTOR (31 downto 0);
    signal temp, rcon_xor_temp, rotWord : STD_LOGIC_VECTOR (31 downto 0);
    signal BS : STD_LOGIC_VECTOR (31 downto 0); 

begin
    w4 <= K(127 downto 96);
    w5 <= K(95 downto 64);
    w6 <= K(63 downto 32);
    w7 <= K(31 downto 0);
       
    w3 <= (w7(31 downto 24) xor w6(31 downto 24)) & (w7(23 downto 16) xor w6(23 downto 16)) & (w7(15 downto 8) xor w6(15 downto 8)) & (w7(7 downto 0) xor w6(7 downto 0));
    w2 <= (w6(31 downto 24) xor w5(31 downto 24)) & (w6(23 downto 16) xor w5(23 downto 16)) & (w6(15 downto 8) xor w5(15 downto 8)) & (w6(7 downto 0) xor w5(7 downto 0));
    w1 <= (w5(31 downto 24) xor w4(31 downto 24)) & (w5(23 downto 16) xor w4(23 downto 16)) & (w5(15 downto 8) xor w4(15 downto 8)) & (w5(7 downto 0) xor w4(7 downto 0));
    
    temp <= w3;
    rotWord <= temp(23 downto 0) & temp(31 downto 24);
    
    BS0 : Sbox port map(rotWord(31 downto 24), BS(31 downto 24));
    BS1 : Sbox port map(rotWord(23 downto 16), BS(23 downto 16));
    BS2 : Sbox port map(rotWord(15 downto 8), BS(15 downto 8));
    BS3 : Sbox port map(rotWord(7 downto 0), BS(7 downto 0));
    
    rcon_xor_temp <= (BS(31 downto 24) xor Rcon) & BS(23 downto 16) & BS(15 downto 8) & BS(7 downto 0);

    w0 <= (w4(31 downto 24) xor rcon_xor_temp(31 downto 24)) & (w4(23 downto 16) xor rcon_xor_temp(23 downto 16)) & (w4(15 downto 8) xor rcon_xor_temp(15 downto 8)) & (w4(7 downto 0) xor rcon_xor_temp(7 downto 0));

    W <= w0 & w1 & w2 & w3;

end Behavioral;
