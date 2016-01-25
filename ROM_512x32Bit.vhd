----------------------------------------------------------------------------------
-- Create Date:    18:38:32 01/16/2016 
-- Module Name:    ROM_512x32Bit - Behavioral 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY ROM_512x32Bit IS
	PORT(
		addr   : IN    std_logic_vector(31 DOWNTO 0);
		dataIO : INOUT std_logic_vector(31 DOWNTO 0)
	);
END ROM_512x32Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF ROM_512x32Bit IS
	TYPE mem_array IS ARRAY (0 TO ((2**9)-1)) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL mem: mem_array;
BEGIN
	dataIO <= mem(CONV_INTEGER(addr(8 DOWNTO 0)));
END Behavioral;