---------------------------------------------------------------------------------- 
-- Create Date:    14:33:30 01/16/2016 
-- Module Name:    MUX_2to1_32Bit - Behavioral
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY MUX_2to1_32Bit IS
	PORT( 
		d0  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		d1  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		sel : IN  STD_LOGIC;
		o   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END MUX_2to1_32Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF MUX_2to1_32Bit IS
BEGIN
	PROCESS (sel)
	BEGIN
		IF sel = '0' THEN
			o <= d0;
		ELSE
			o <= d1;
		END IF;
	END PROCESS;
END Behavioral;

