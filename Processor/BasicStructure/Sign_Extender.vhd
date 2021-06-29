library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity Sign_extender is
    Port ( Sign_in : in STD_LOGIC_VECTOR (15 downto 0);
           Sign_out : out STD_LOGIC_VECTOR (31 downto 0));
end Sign_extender;

architecture Behavioral of Sign_extender is

begin
    Sign_out <= STD_LOGIC_VECTOR(resize(signed(Sign_in), sign_out'length));

end Behavioral;
