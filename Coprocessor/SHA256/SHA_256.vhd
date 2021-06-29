library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sha_256 is
    Port ( Start : in std_logic;
           Message : in STD_LOGIC_VECTOR (255 downto 0);
           Hash : out STD_LOGIC_VECTOR (255 downto 0));
end sha_256;

architecture Behavioral of sha_256 is

	type Array8 is array (0 to 7) of STD_LOGIC_VECTOR(31 downto 0);
	
	type Array64 is array (0 to 63) of STD_LOGIC_VECTOR(31 downto 0);
	constant k : Array64 :=
		(x"428a2f98", x"71374491", x"b5c0fbcf", x"e9b5dba5", x"3956c25b", x"59f111f1",
		 x"923f82a4", x"ab1c5ed5", x"d807aa98", x"12835b01", x"243185be", x"550c7dc3",
		 x"72be5d74", x"80deb1fe", x"9bdc06a7", x"c19bf174", x"e49b69c1", x"efbe4786",
		 x"0fc19dc6", x"240ca1cc", x"2de92c6f", x"4a7484aa", x"5cb0a9dc", x"76f988da",
		 x"983e5152", x"a831c66d", x"b00327c8", x"bf597fc7", x"c6e00bf3", x"d5a79147",
		 x"06ca6351", x"14292967", x"27b70a85", x"2e1b2138", x"4d2c6dfc", x"53380d13",
		 x"650a7354", x"766a0abb", x"81c2c92e", x"92722c85", x"a2bfe8a1", x"a81a664b",
		 x"c24b8b70", x"c76c51a3", x"d192e819", x"d6990624", x"f40e3585", x"106aa070",
		 x"19a4c116", x"1e376c08", x"2748774c", x"34b0bcb5", x"391c0cb3", x"4ed8aa4a",
		 x"5b9cca4f", x"682e6ff3", x"748f82ee", x"78a5636f", x"84c87814", x"8cc70208",
		 x"90befffa", x"a4506ceb", x"bef9a3f7", x"c67178f2");

begin 
	process(Start)
		variable w : Array64 := (others=> (others=>'0'));
			
		variable s0: STD_LOGIC_VECTOR(31 downto 0);
		variable s1: STD_LOGIC_VECTOR(31 downto 0);

		variable ch: STD_LOGIC_VECTOR(31 downto 0);
			
		variable temp1: STD_LOGIC_VECTOR(31 downto 0);
		variable temp2: STD_LOGIC_VECTOR(31 downto 0);
			
		variable maj: STD_LOGIC_VECTOR(31 downto 0);
			
		variable h_vector : Array8 := 
		         (x"6a09e667", x"bb67ae85", x"3c6ef372", x"a54ff53a", x"510e527f",
		          x"9b05688c", x"1f83d9ab", x"5be0cd19");
			
		variable a : STD_LOGIC_VECTOR(31 downto 0):= x"6a09e667";
		variable b : STD_LOGIC_VECTOR(31 downto 0):= x"bb67ae85";
        variable c : STD_LOGIC_VECTOR(31 downto 0):= x"3c6ef372";
		variable d : STD_LOGIC_VECTOR(31 downto 0):= x"a54ff53a";
		variable e : STD_LOGIC_VECTOR(31 downto 0):= x"510e527f";
		variable f : STD_LOGIC_VECTOR(31 downto 0):= x"9b05688c";
		variable g : STD_LOGIC_VECTOR(31 downto 0):= x"1f83d9ab";
		variable h : STD_LOGIC_VECTOR(31 downto 0):= x"5be0cd19";

		begin
			if(Start = '1') then
				w(0):= Message(255 downto 224);
				w(1):= Message(223 downto 192);
				w(2):= Message(191 downto 160);
				w(3):= Message(159 downto 128);
				w(4):= Message(127 downto 96);
				w(5):= Message(95 downto 64);
				w(6):= Message(63 downto 32);
				w(7):= Message(31 downto 0);
				w(8):= x"80000000";
				w(15):= x"00000100";
				
				for i in 16 to 63 loop
					s0   := STD_LOGIC_VECTOR(rotate_right(unsigned(w(i-15)), 7)) 
								XOR STD_LOGIC_VECTOR(rotate_right(unsigned(w(i-15)), 18)) 
								XOR STD_LOGIC_VECTOR(shift_right(unsigned(w(i-15)), 3));
					s1   := STD_LOGIC_VECTOR(rotate_right(unsigned(w(i-2)), 17)) 
								XOR STD_LOGIC_VECTOR(rotate_right(unsigned(w(i-2)), 19)) 
								XOR STD_LOGIC_VECTOR(shift_right(unsigned(w(i-2)), 10));
					w(i) := STD_LOGIC_VECTOR(unsigned(w(i-16)) + unsigned(s0) + unsigned(w(i-7)) + unsigned(s1));
				end loop;

				for j in 0 to 63 loop
					s1 := STD_LOGIC_VECTOR(rotate_right(unsigned(e), 6)) 
								XOR STD_LOGIC_VECTOR(rotate_right(unsigned(e), 11)) 
								XOR STD_LOGIC_VECTOR(rotate_right(unsigned(e), 25));
					ch := (e AND f) XOR ((NOT e) AND g);
					temp1 := STD_LOGIC_VECTOR(unsigned(h) + unsigned(s1) + unsigned(ch) + unsigned(k(j)) + unsigned(w(j)));
					s0 := STD_LOGIC_VECTOR(rotate_right(unsigned(a), 2)) 
								XOR STD_LOGIC_VECTOR(rotate_right(unsigned(a), 13)) 
								XOR STD_LOGIC_VECTOR(rotate_right(unsigned(a), 22));
					maj := (a AND b) XOR (a AND c) XOR (b AND c);
					temp2 := STD_LOGIC_VECTOR(unsigned(s0) + unsigned(maj));
				
					h := g;
					g := f;
					f := e;
					e := STD_LOGIC_VECTOR(unsigned(d) + unsigned(temp1));
					d := c;
					c := b;
					b := a;
					a := STD_LOGIC_VECTOR(unsigned(temp1) + unsigned(temp2));
					
				end loop;
					
				h_vector(0) := STD_LOGIC_VECTOR(unsigned(h_vector(0)) + unsigned(a));
				h_vector(1) := STD_LOGIC_VECTOR(unsigned(h_vector(1)) + unsigned(b));
				h_vector(2) := STD_LOGIC_VECTOR(unsigned(h_vector(2)) + unsigned(c));
				h_vector(3) := STD_LOGIC_VECTOR(unsigned(h_vector(3)) + unsigned(d));
				h_vector(4) := STD_LOGIC_VECTOR(unsigned(h_vector(4)) + unsigned(e));
				h_vector(5) := STD_LOGIC_VECTOR(unsigned(h_vector(5)) + unsigned(f));
				h_vector(6) := STD_LOGIC_VECTOR(unsigned(h_vector(6)) + unsigned(g));
				h_vector(7) := STD_LOGIC_VECTOR(unsigned(h_vector(7)) + unsigned(h));
					
				Hash <= h_vector(0) & h_vector(1) & h_vector(2) & h_vector(3) & h_vector(4) & 
						h_vector(5) & h_vector(6) & h_vector(7);
        end if;
	end process;

end Behavioral;
