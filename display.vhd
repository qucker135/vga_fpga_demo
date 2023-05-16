library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity display is port(
clk : in std_logic;
x : in integer range 0 to 1023;
y : in integer range 0 to 1023;
color : out std_logic_vector(7 downto 0));
end display;

architecture Behavioral of display is
begin

process (clk) is
begin
if rising_edge(clk) then
	if (x >= 19) and (y >= 2) and (x < 659) and (y < 482) then
		if (x = 19) or (x = 658) or (y = 2) or (y = 481) then	-- biala ramka
			color <= x"ff";			
		else
			if (y < 162) then -- czerwony pasek na gorze
				color <= x"e0";
			elsif (y < 322) then -- zielony w srodku
				color <= x"1c";
			else -- niebieski na dole
				color <= x"03";
			end if;
		end if;
	else
		color <= x"00";
	end if;
end if;
end process;

end Behavioral;