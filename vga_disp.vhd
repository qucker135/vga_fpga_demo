library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vga_disp is
port(
       clk : in std_logic;
       hsync : out std_logic;
       vsync : out std_logic;
       red : out std_logic_vector(2 downto 0);
       green : out std_logic_vector(2 downto 0);
       blue : out std_logic_vector(2 downto 1));       
end vga_disp;

architecture Behavioral of vga_disp is

component pll is
  port ( CLKIN_IN        : in    std_logic; 
         CLKFX_OUT       : out   std_logic);
end component;

signal clk_pll : std_logic;
begin   

pixel_clock : pll port map (CLKIN_IN => clk, CLKFX_OUT => clk_pll);
display : entity timings port map (clk => clk_pll, hsync => hsync, vsync => vsync,                                                                                        
               red => red, green => green, blue => blue);

end Behavioral;