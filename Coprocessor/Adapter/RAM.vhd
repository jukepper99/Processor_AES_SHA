library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RAM is
    Port ( Clk : in STD_LOGIC;
           Write : in STD_LOGIC;
           Address : in STD_LOGIC_VECTOR (2 downto 0);
           Data_in : in STD_LOGIC_VECTOR (31 downto 0);
           Data_out1 : out STD_LOGIC_VECTOR (127 downto 0);
           Data_out2: out STD_LOGIC_VECTOR (127 downto 0));
end RAM;

architecture Behavioral of RAM is

Type RamType is array (7 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
signal MyRam : RamType;

begin
    process(Clk)
        begin
            if(Clk'event and Clk = '1') then 
                if(Write = '1') then
                    MyRam(conv_integer(Address)) <= Data_in;
                else
                    Data_out1 <= MyRam(0) & MyRam(1) & MyRam(2) & MyRam(3);
                    Data_out2 <= MyRam(4) & MyRam(5) & MyRam(6) & MyRam(7);
                end if;
            end if;
    end process;

end Behavioral;
