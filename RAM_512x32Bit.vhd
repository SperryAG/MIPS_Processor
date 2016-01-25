----------------------------------------------------------------------------------
-- Create Date:    18:13:53 01/16/2016 
-- Module Name:    RAM_512x32Bit - Behavioral 
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
ENTITY RAM_512x32Bit IS
	PORT(
		clk   : IN  STD_LOGIC;
		we    : IN  STD_LOGIC;
		addr  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		dataI : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		dataO : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END RAM_512x32Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF RAM_512x32Bit IS
	TYPE mem_array IS ARRAY (0 TO ((2**9)-1)) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL mem: mem_array;
BEGIN
	PROCESS(clk) 
	BEGIN
		IF (clk'EVENT AND clk='1') THEN
			IF (we = '0') THEN
				dataO <= mem(CONV_INTEGER(addr(8 DOWNTO 0)));
			ELSE
				mem(CONV_INTEGER(addr(8 DOWNTO 0))) <= dataI;
			END IF;
		END IF;
	END PROCESS;
END Behavioral;