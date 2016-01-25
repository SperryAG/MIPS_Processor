----------------------------------------------------------------------------------
-- Create Date:    13:09:50 01/18/2016 
-- Module Name:    ALU_32Bit - Behavioral 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
LIBRARY UNISIM;
USE UNISIM.VCOMPONENTS.ALL;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY ALU_32BIT IS
    PORT( 
        Func_in    : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
        A_in       : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
        B_in       : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
        O_out      : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        Branch_out : OUT STD_LOGIC;
        Jump_out   : OUT STD_LOGIC 
    );
END ALU_32BIT;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF ALU_32BIT IS
SIGNAL wire : STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN
    PROCESS(Func_in, A_in, B_in) 
        BEGIN --TODO: branch_out, Jump_out
		IF Func_in = "100000" THEN
			IF signed(A_in) < signed(B_in) THEN --Set-Less-Than signed
				wire <= "00000000000000000000000000000001";
			ELSE
				wire <= (OTHERS => '0');
			END IF;
		ELSIF Func_in = "100000" THEN --Set-Less-Than Unsigned
			IF unsigned(A_in) < unsigned(B_in) THEN
				wire <= "00000000000000000000000000000001";
			ELSE
				wire <= (OTHERS => '0');
			END IF;
		ELSIF Func_in = "100000" THEN --ADD
			wire <= STD_LOGIC_VECTOR(unsigned(A_in) + unsigned(B_in));
		ELSIF Func_in = "100001" THEN --ADD
			wire <= STD_LOGIC_VECTOR(unsigned(A_in) + unsigned(B_in));
		ELSIF Func_in = "100010" THEN --SUB
			wire <= STD_LOGIC_VECTOR(unsigned(A_in) - unsigned(B_in));
		ELSIF Func_in = "100011" THEN --SUB
			wire <= STD_LOGIC_VECTOR(unsigned(A_in) - unsigned(B_in));
		ELSIF Func_in = "100100" THEN --AND
			wire <=  A_in AND B_in;
		ELSIF Func_in = "100101" THEN --OR
			wire <= A_in OR B_in;
		ELSIF Func_in = "100110" THEN --XOR
			wire <= A_in XOR B_in;
		ELSIF Func_in = "100111" THEN --NOR
			wire <= A_in NOR B_in;
		ELSE
			wire <= (OTHERS => '0');
		END IF;
    END PROCESS;
		O_out <= wire;
END behavioral;

