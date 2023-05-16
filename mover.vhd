----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:27:32 05/16/2023 
-- Design Name: 
-- Module Name:    mover - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mover is
    Port ( clk : in  STD_LOGIC;
           sw : in  STD_LOGIC_VECTOR (0 to 3);
           posx : out  integer range 0 to 1023;
           posy : out  integer range 0 to 1023);
end mover;

architecture Behavioral of mover is

	signal sig_posx	: integer range 0 to 1023 := 334;
	signal sig_posy   : integer range 0 to 1023 := 237;

begin
	process(clk)
	begin
		if rising_edge(clk) then
			if sw(0) = '1' and sw(1) = '0' then
				if sig_posx < 649 then
					sig_posx <= sig_posx + 1;
				END IF;
			elsif sw(0) = '0' and sw(1) = '1' then
				if sig_posx > 19 then
					sig_posx <= sig_posx - 1;
				END IF;
			end if;
		end if;
	end process;
	
	process(clk)
	begin
		if rising_edge(clk) then
			if sw(2) = '1' and sw(3) = '0' then
				if sig_posy < 472 then
					sig_posy <= sig_posy + 1;
				end if;
			elsif sw(2) = '0' and sw(3) = '1' then
				if sig_posy > 2 then
					sig_posy <= sig_posy - 1;
				end if;
			end if;
		end if;
	end process;

	posx <= sig_posx;
	posy <= sig_posy;

end Behavioral;

