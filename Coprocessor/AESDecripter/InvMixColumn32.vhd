library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InvMixColumn32 is
    Port ( C_in : in STD_LOGIC_VECTOR (31 downto 0);
           C_out : out STD_LOGIC_VECTOR (31 downto 0));
end InvMixColumn32;

architecture Behavioral of InvMixColumn32 is
    
    signal S0, S1, S2, S3 : STD_LOGIC_VECTOR (7 downto 0);
    signal S009, S109, S209, S309 : STD_LOGIC_VECTOR (7 downto 0);
    signal S00b, S10b, S20b, S30b : STD_LOGIC_VECTOR (7 downto 0);
    signal S00d, S10d, S20d, S30d : STD_LOGIC_VECTOR (7 downto 0);
    signal S00e, S10e, S20e, S30e : STD_LOGIC_VECTOR (7 downto 0);
    signal temp1S0, temp1S1, temp1S2, temp1S3 : STD_LOGIC_VECTOR (7 downto 0);
    signal temp2S0, temp2S1, temp2S2, temp2S3 : STD_LOGIC_VECTOR (7 downto 0);
    signal temp3S0, temp3S1, temp3S2, temp3S3 : STD_LOGIC_VECTOR (7 downto 0);

begin
    S0 <= C_in(31 downto 24);
    temp1S0 <= ((S0(6 downto 0) & '0') xor x"1B") when S0(7) = '1'
                else (S0(6 downto 0) & '0');
    temp2S0 <= ((temp1S0(6 downto 0) & '0') xor x"1B") when temp1S0(7) = '1'
                else (temp1S0(6 downto 0) & '0');
    temp3S0 <= ((temp2S0(6 downto 0) & '0') xor x"1B") when temp2S0(7) = '1'
                else (temp2S0(6 downto 0) & '0');
    
    S1 <= C_in(23 downto 16);
    temp1S1 <= ((S1(6 downto 0) & '0') xor x"1B") when S1(7) = '1'
                else (S1(6 downto 0) & '0');
    temp2S1 <= ((temp1S1(6 downto 0) & '0') xor x"1B") when temp1S1(7) = '1'
                else (temp1S1(6 downto 0) & '0');
    temp3S1 <= ((temp2S1(6 downto 0) & '0') xor x"1B") when temp2S1(7) = '1'
                else (temp2S1(6 downto 0) & '0');
    
    S2 <= C_in(15 downto 8);
    temp1S2 <= ((S2(6 downto 0) & '0') xor x"1B") when S2(7) = '1'
                else (S2(6 downto 0) & '0');
    temp2S2 <= ((temp1S2(6 downto 0) & '0') xor x"1B") when temp1S2(7) = '1'
                else (temp1S2(6 downto 0) & '0');
    temp3S2 <= ((temp2S2(6 downto 0) & '0') xor x"1B") when temp2S2(7) = '1'
                else (temp2S2(6 downto 0) & '0');
    
    S3 <= C_in(7 downto 0);
    temp1S3 <= ((S3(6 downto 0) & '0') xor x"1B") when S3(7) = '1'
                else (S3(6 downto 0) & '0');
    temp2S3 <= ((temp1S3(6 downto 0) & '0') xor x"1B") when temp1S3(7) = '1'
                else (temp1S3(6 downto 0) & '0');
    temp3S3 <= ((temp2S3(6 downto 0) & '0') xor x"1B") when temp2S3(7) = '1'
                else (temp2S3(6 downto 0) & '0');

    S009 <= temp3S0 xor S0;
    S00b <= temp1S0 xor temp3S0 xor S0;
    S00d <= temp2S0 xor temp3S0 xor S0;
    S00e <= temp1S0 xor temp2S0 xor temp3S0;
    
    S109 <= temp3S1 xor S1;
    S10b <= temp1S1 xor temp3S1 xor S1;
    S10d <= temp2S1 xor temp3S1 xor S1;
    S10e <= temp1S1 xor temp2S1 xor temp3S1;
    
    S209 <= temp3S2 xor S2;
    S20b <= temp1S2 xor temp3S2 xor S2;
    S20d <= temp2S2 xor temp3S2 xor S2;
    S20e <= temp1S2 xor temp2S2 xor temp3S2;
    
    S309 <= temp3S3 xor S3;
    S30b <= temp1S3 xor temp3S3 xor S3;
    S30d <= temp2S3 xor temp3S3 xor S3;
    S30e <= temp1S3 xor temp2S3 xor temp3S3;
    

    C_out(31 downto 24) <= S00e xor S10b xor S20d xor S309;
    C_out(23 downto 16) <= S009 xor S10e xor S20b xor S30d;
    C_out(15 downto 8) <= S00d xor S109 xor S20e xor S30b;
    C_out(7 downto 0) <= S00b xor S10d xor S209 xor S30e;

end Behavioral;
