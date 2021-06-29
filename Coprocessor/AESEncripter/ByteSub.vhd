library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ByteSub is
    Port ( Sub_in : in STD_LOGIC_VECTOR (127 downto 0);
           Sub_out : out STD_LOGIC_VECTOR (127 downto 0));
end ByteSub;

architecture Behavioral of ByteSub is

    Component Sbox is Port ( Byte_in : in STD_LOGIC_VECTOR (7 downto 0); 
                             Byte_out : out STD_LOGIC_VECTOR (7 downto 0)); 
    end Component;
    
begin
    q1 : sbox port map (Sub_in(127 downto 120),Sub_out(127 downto 120)); 
    q2 : sbox port map (Sub_in(119 downto 112),Sub_out(119 downto 112)); 
    q3 : sbox port map (Sub_in(111 downto 104),Sub_out(111 downto 104)); 
    q4 : sbox port map (Sub_in(103 downto 96),Sub_out(103 downto 96)); 
    q5 : sbox port map (Sub_in(95 downto 88),Sub_out(95 downto 88)); 
    q6 : sbox port map (Sub_in(87 downto 80),Sub_out(87 downto 80)); 
    q7 : sbox port map (Sub_in(79 downto 72),Sub_out(79 downto 72)); 
    q8 : sbox port map (Sub_in(71 downto 64),Sub_out(71 downto 64)); 
    q9 : sbox port map (Sub_in(63 downto 56),Sub_out(63 downto 56)); 
    q10 : sbox port map (Sub_in(55 downto 48),Sub_out(55 downto 48)); 
    q11 : sbox port map (Sub_in(47 downto 40),Sub_out(47 downto 40)); 
    q12 : sbox port map (Sub_in(39 downto 32),Sub_out(39 downto 32)); 
    q13 : sbox port map (Sub_in(31 downto 24),Sub_out(31 downto 24)); 
    q14 : sbox port map (Sub_in(23 downto 16),Sub_out(23 downto 16)); 
    q15 : sbox port map (Sub_in(15 downto 8),Sub_out(15 downto 8)); 
    q16 : sbox port map (Sub_in(7 downto 0),Sub_out(7 downto 0)); 
   
end Behavioral;
