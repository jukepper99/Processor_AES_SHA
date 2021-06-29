library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Registers is
    Port ( Clk : in STD_LOGIC;
           Write : in STD_LOGIC;
           Address_write : in STD_LOGIC_VECTOR (4 downto 0);
           Address_read_1 : in STD_LOGIC_VECTOR (4 downto 0);
           Address_read_2 : in STD_LOGIC_VECTOR (4 downto 0);
           Data_write : in STD_LOGIC_VECTOR (31 downto 0);
           Data_read_1 : out STD_LOGIC_VECTOR (31 downto 0);
           Data_read_2 : out STD_LOGIC_VECTOR (31 downto 0));
end Registers;

architecture Behavioral of Registers is

type registers is array (0 to 8 ) of STD_LOGIC_VECTOR (31 downto 0);
signal REG: registers :=(x"00000000",
                        x"2b7e1516",
                        x"28aed2a6",
                        x"abf71588",
                        x"09cf4f3c",
                        x"3243f6a8",
                        x"885a308d",
                        x"313198a2",
                        x"e0370734");

begin
    process(Clk)
        begin
            if(Clk'event and Clk = '1') then
                if(Write = '1') then
                    REG(conv_integer(Address_write)) <= Data_write;
                end if;
            end if;
    end process;
    
    Data_read_1 <= REG(conv_integer(Address_read_1));
    Data_read_2 <= REG(conv_integer(Address_read_2));

end Behavioral;
