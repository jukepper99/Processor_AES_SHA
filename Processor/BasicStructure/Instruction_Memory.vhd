library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

entity Instruction_Memory is
    Port ( Address : in STD_LOGIC_VECTOR (31 downto 0);
           Instruction : out STD_LOGIC_VECTOR (31 downto 0));
end Instruction_Memory;

architecture Behavioral of Instruction_Memory is
 type ROM_type is array (0 to 31 ) of STD_LOGIC_VECTOR(31 downto 0);
 signal rom_data: rom_type := (
   "00001000000000010000000000000000", --sw 
   "00001000000000100000000000000001", --sw
   "00001000000000110000000000000010", --sw
   "00001000000001000000000000000011", --sw
   "00001000000001010000000000000100", --sw
   "00001000000001100000000000000101", --sw
   "00001000000001110000000000000110", --sw
   "00001000000010000000000000000111", --sw
   "00000000000000000000000000000000", 
   "00011100000000000000000000000000", --lcy
   "00011100000000010000000000000001", --lcy
   "00011100000000100000000000000010", --lcy
   "00011100000000110000000000000011", --lcy
   "00011100000001000000000000000100", --lcy
   "00011100000001010000000000000101", --lcy
   "00011100000001100000000000000110", --lcy
   "00011100000001110000000000000111", --lcy
   "00000000000000000000000000000000", 
   "00100000000000000000000000000000", --sty
   "00000000000000000000000000000000", 
   "00100100000000000000000000000000", --lch
   "00100100000000010000000000000001", --lch
   "00100100000000100000000000000010", --lch
   "00100100000000110000000000000011", --lch
   "00100100000001000000000000000100", --lch
   "00100100000001010000000000000101", --lch
   "00100100000001100000000000000110", --lch
   "00100100000001110000000000000111", --lch
   "00000000000000000000000000000000",
   "00101000000000000000000000000000", --rh
   "00101100000000000000000000000000", --sth
   "00000000000000000000000000000000"
   --
   -- Test tipo R
   --"00000000001000100000000000000000",
   --"00000000001000100000000000000001",
   --"00000000001000100000000000000010",
   --"00000000001000100000000000000011", 
   --"00000000001000100000000000000100", 
   --"00000000001000100000000000000101",
   --"00000000001000100000000000000110",
   --"00000000001000100000000000000111",
   --Test tipo I y J
   --"00000000000000000000000000000001",
   --"00010000000000000000000000000010",
   --"00000100000000010000000000000011",
   --"00010100000000000000000000001111",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00001000000000100000000000000000",
   --"00000000000000000000000000000000",
   --"00001100000000010000000000001000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000",
   --"00000000000000000000000000000000"
   --"00000000001000100000000000000111"
  );
begin
  
 Instruction <= rom_data(to_integer(unsigned(Address(31 downto 2))));

end Behavioral;