library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity KeyExpansion is
    Port ( K : in STD_LOGIC_VECTOR (127 downto 0);
           Rcon : in STD_LOGIC_VECTOR (7 downto 0);
           W : out STD_LOGIC_VECTOR (127 downto 0));
end KeyExpansion;

architecture Behavioral of KeyExpansion is
    
    Component Sbox is 
        Port ( Byte_in : in STD_LOGIC_VECTOR (7 downto 0);
               Byte_out : out STD_LOGIC_VECTOR (7 downto 0));
    end Component;
    
    signal w0, w1, w2, w3, w4, w5, w6, w7 : STD_LOGIC_VECTOR (31 downto 0);
    signal temp, rcon_xor_temp, rotWord : STD_LOGIC_VECTOR (31 downto 0);
    signal BS : STD_LOGIC_VECTOR (31 downto 0);

begin
    w0 <= K(127 downto 96);
    w1 <= K(95 downto 64);
    w2 <= K(63 downto 32);
    w3 <= K(31 downto 0);
    temp <= K(31 downto 0);
    
    rotWord <= temp(23 downto 0)  & temp(31 downto 24);
    
    BS0 : Sbox port map(rotWord(31 downto 24), BS(31 downto 24));
    BS1 : Sbox port map(rotWord(23 downto 16), BS(23 downto 16));
    BS2 : Sbox port map(rotWord(15 downto 8), BS(15 downto 8));
    BS3 : Sbox port map(rotWord(7 downto 0), BS(7 downto 0));
    
    rcon_xor_temp <= (BS(31 downto 24) xor Rcon) & BS(23 downto 16) & BS(15 downto 8) & BS(7 downto 0);
    
    w4 <= (w0(31 downto 24) xor rcon_xor_temp(31 downto 24)) & (w0(23 downto 16) xor rcon_xor_temp(23 downto 16)) & (w0(15 downto 8) xor rcon_xor_temp(15 downto 8)) & (w0(7 downto 0) xor rcon_xor_temp(7 downto 0));
    w5 <= (w1(31 downto 24) xor w4(31 downto 24)) & (w1(23 downto 16) xor w4(23 downto 16)) & (w1(15 downto 8) xor w4(15 downto 8)) & (w1(7 downto 0) xor w4(7 downto 0));
    w6 <= (w2(31 downto 24) xor w5(31 downto 24)) & (w2(23 downto 16) xor w5(23 downto 16)) & (w2(15 downto 8) xor w5(15 downto 8)) & (w2(7 downto 0) xor w5(7 downto 0));
    w7 <= (w3(31 downto 24) xor w6(31 downto 24)) & (w3(23 downto 16) xor w6(23 downto 16)) & (w3(15 downto 8) xor w6(15 downto 8)) & (w3(7 downto 0) xor w6(7 downto 0));
    W <= w4 & w5 & w6 & w7;

end Behavioral;
