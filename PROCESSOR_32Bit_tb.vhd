--------------------------------------------------------------------------------
-- Create Date:   14:18:09 01/24/2016
-- VHDL Test Bench Created by ISE for module: PROCESSOR_32Bit
--------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY PROCESSOR_32Bit_tb IS
END PROCESSOR_32Bit_tb;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE behavior OF PROCESSOR_32Bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT PROCESSOR_32Bit
		 PORT(
				ref_clk : INOUT  STD_LOGIC;
				reset   : INOUT  STD_LOGIC
		 );
    END COMPONENT;

 	--Outputs
   SIGNAL ref_clk_tb : STD_LOGIC;
   SIGNAL reset_tb   : STD_LOGIC;

   -- Clock period definitions
   CONSTANT ref_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PROCESSOR_32Bit 
		PORT MAP (
			ref_clk => ref_clk_tb,
         reset => reset_tb
		);

   -- Clock process definitions
   ref_clk_process :PROCESS
   BEGIN
		ref_clk_tb <= '0';
		WAIT FOR ref_clk_period/2;
		ref_clk_tb <= '1';
		WAIT FOR ref_clk_period/2;
   END PROCESS;

   -- Stimulus process
   stim_proc: PROCESS
   BEGIN
      -- hold reset state for 100 ns.
      WAIT FOR 100 ns;	

      WAIT FOR ref_clk_period*10;

      -- insert stimulus here 

      WAIT;
   END PROCESS;

END;
