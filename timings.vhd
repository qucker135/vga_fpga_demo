library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity timings is port(
clk : in std_logic;
sw : in std_logic_vector(0 to 3);
hsync : out std_logic;
vsync : out std_logic;
red : out std_logic_vector(2 downto 0);
green : out std_logic_vector(2 downto 0);
blue : out std_logic_vector(2 downto 1)
);	
end timings;

architecture Behavioral of timings is

signal x : integer range 0 to 1023;
signal y : integer range 0 to 1023;
signal next_x : integer range 0 to 1023;
signal next_y : integer range 0 to 1023;
signal rgb : std_logic_vector(7 downto 0);

signal sig_posx : integer range 0 to 1023;
signal sig_posy : integer range 0 to 1023;

begin

timings: process (clk) is
begin
if rising_edge(clk) then
	if (next_x = 799) then
		next_x <= 0;
		if (next_y = 525) then
			next_y <= 0;
		else
			next_y <= next_y + 1;
		end if;
	else
		next_x <= next_x + 1;
	end if;

	if (y >= 490) and (y < 492) then
		vsync <= '0';
	else
		vsync <= '1';
	end if;

	if (x >= 656) and (x < 752) then
		hsync <= '0';
	else
		hsync <= '1';
	end if;

	x <= next_x;
	y <= next_y;
end if;	
end process;

fb: entity display port map (
	clk => clk,
	x => next_x,
	y => next_y,
	posx => sig_posx,
	posy => sig_posy,
	color => rgb);
	
mv: entity mover port map (
	clk => clk,
	sw => sw,
	posx => sig_posx,
	posy => sig_posy
);

red <= rgb(7 downto 5);
green <= rgb(4 downto 2);
blue <= rgb(1 downto 0);

end Behavioral;