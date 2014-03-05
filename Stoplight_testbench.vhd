--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:35:05 03/06/2013
-- Design Name:   
-- Module Name:   C:/My_Designs/ECE281_Xilinx14/M4_sandbox/Stoplight_testbench.vhd
-- Project Name:  M4_sandbox
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Stoplight
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Stoplight_testbench IS
END Stoplight_testbench;
 
ARCHITECTURE behavior OF Stoplight_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Stoplight
    PORT(
         C : IN  std_logic;
         Clk : IN  std_logic;
         reset : IN  std_logic;
         R : OUT  std_logic;
         Y : OUT  std_logic;
         G : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal C : std_logic := '0';
   signal Clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal R : std_logic;
   signal Y : std_logic;
   signal G : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Stoplight PORT MAP (
          C => C,
          Clk => Clk,
          reset => reset,
          R => R,
          Y => Y,
          G => G
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for Clk_period*10;

      -- insert stimulus here 

		reset <= '1';
		wait for clk_period*10;
		
		reset <= '0';
		wait for clk_period*5;
		
		c <= '1';
		wait for clk_period*10;
		
		c <= '0';


      wait;
   end process;

END;
