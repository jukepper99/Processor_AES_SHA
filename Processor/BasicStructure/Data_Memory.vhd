library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Data_memory is
    Port ( Clk : in STD_LOGIC;
           Address : in STD_LOGIC_VECTOR (31 downto 0);
           Write : in STD_LOGIC;
           Read: in STD_LOGIC;
           Data_in : in STD_LOGIC_VECTOR (31 downto 0);
           Data_out : out STD_LOGIC_VECTOR(31 downto 0));
end Data_memory;

architecture Behavioral of Data_memory is

type memory is array (0 to 15 ) of std_logic_vector (31 downto 0);
signal MEM: memory :=((others=> (others=>'0')));

begin
    process(Clk)
        begin
            if(Clk'event and Clk = '1') then
                if (Write = '1') then
                    MEM(conv_integer(Address)) <= Data_in;
                end if;
                if(Read = '1') then 
                    Data_out <= MEM(conv_integer(Address));
                end if; 
            end if;         
    end process;       
    
end Behavioral;
