----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:05:47 03/06/2013 
-- Design Name: 
-- Module Name:    Stoplight - Behavioral 
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

entity Stoplight is
    Port ( C : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           R : out  STD_LOGIC;
           Y : out  STD_LOGIC;
           G : out  STD_LOGIC);
end Stoplight;

architecture Behavioral of Stoplight is

type stoplight_state is (red, green, yellow);
signal next_state, current_state : stoplight_state;

begin

------------------
--Next State Logic
------------------

process (C, current_state)
begin
	case current_state is
		when red =>
			if C='1' then
				next_state <= green;
			else
				next_state <= red;
			end if;
		when green =>
			if C='1' then
				next_state <= green;
			else
				next_state <= yellow;
			end if;
		when yellow =>
			next_state <= red;
	end case;
end process;



---------------------
--State Memory
---------------------

process(reset, clk)
begin
	if reset='1' then
		current_state <= yellow;
	elsif (rising_edge(clk)) then
		current_state <= next_state;
	end if;
end  process;

--------------------
--Output Logic
--------------------

R <= 	'1' when current_state = red else
		'0';
G <=	'1' when current_state = green else
		'0';
Y <= 	'1' when current_state = yellow else
		'0';
	
end Behavioral;

