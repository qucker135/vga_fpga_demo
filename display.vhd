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
				if (x < 99) then
					color <= x"00";
				elsif (x < 179) then
					color <= x"20";
				elsif (x < 259) then
					color <= x"40";
				elsif (x < 339) then
					color <= x"60";
				elsif (x < 419) then
					color <= x"80";
				elsif (x < 499) then
					color <= x"a0";
				elsif (x < 579) then
					color <= x"c0";
				else
					color <= x"e0";
				end if;
			elsif (y < 322) then -- zielony w srodku
				if (x < 99) then
					color <= x"00";
				elsif (x < 179) then
					color <= x"04";
				elsif (x < 259) then
					color <= x"08";
				elsif (x < 339) then
					color <= x"0c";
				elsif (x < 419) then
					color <= x"10";
				elsif (x < 499) then
					color <= x"14";
				elsif (x < 579) then
					color <= x"18";
				else
					color <= x"1c";
				end if;
			else -- niebieski na dole
				if (x < 179) then
					color <= x"00";
				elsif (x < 339) then
					color <= x"01";
				elsif (x < 499) then
					color <= x"02";
				else
					color <= x"03";
				end if;
			end if;
		end if;
	else
		color <= x"00";
	end if;
end if;
end process;

end Behavioral;