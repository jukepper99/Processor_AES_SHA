library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftRow is
    Port ( Shift_in : in STD_LOGIC_VECTOR (127 downto 0);
           Shift_out : out STD_LOGIC_VECTOR (127 downto 0));
end ShiftRow;

architecture Behavioral of ShiftRow is

begin
    Shift_out(127 downto 120) <= Shift_in(127 downto 120);  --0<=0
    Shift_out(119 downto 112) <= Shift_in(87 downto 80);    --1<=5
    Shift_out(111 downto 104) <= Shift_in(47 downto 40);    --2<=10
    Shift_out(103 downto 96) <= Shift_in(7 downto 0);       --3<=15
    Shift_out(95 downto 88) <= Shift_in(95 downto 88);      --4<=4
    Shift_out(87 downto 80) <= Shift_in(55 downto 48);      --5<=9
    Shift_out(79 downto 72) <= Shift_in(15 downto 8);       --6<=14
    Shift_out(71 downto 64) <= Shift_in(103 downto 96);     --7<=3
    Shift_out(63 downto 56) <= Shift_in(63 downto 56);      --8<=8
    Shift_out(55 downto 48) <= Shift_in(23 downto 16);      --9<=13
    Shift_out(47 downto 40) <= Shift_in(111 downto 104);    --10<=2
    Shift_out(39 downto 32) <= Shift_in(71 downto 64);      --11<=7
    Shift_out(31 downto 24) <= Shift_in(31 downto 24);      --12<=12
    Shift_out(23 downto 16) <= Shift_in(119 downto 112);    --13<=1
    Shift_out(15 downto 8) <= Shift_in(79 downto 72);       --14<=6
    Shift_out(7 downto 0) <= Shift_in(39 downto 32);        --15<=11

end Behavioral;
