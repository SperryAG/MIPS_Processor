----------------------------------------------------------------------------------
-- Create Date:    13:37:02 01/18/2016 
-- Module Name:    CONTROLLER_32Bit - Behavioral 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY CONTROLLER_32Bit IS
	PORT(
		Func       : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		Op         : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		MemToReg   : OUT STD_LOGIC;
		MemWrite   : OUT STD_LOGIC;
		Branch     : OUT STD_LOGIC;
		ALUControl : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		ALUSrc     : OUT STD_LOGIC;
		RegDst     : OUT STD_LOGIC;
		RegWrite   : OUT STD_LOGIC
	);
END CONTROLLER_32Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF CONTROLLER_32Bit IS
BEGIN
    PROCESS (Func, Op)
	BEGIN
        -- R-TYPE Instructions
        ----------------------------
		IF (Op = "000000") THEN
			MemToReg   <= '1';
         MemWrite   <= '0';
         Branch     <= '0';
         ALUControl <= Func;
         ALUSrc     <= '0';
         RegDst     <= '1';
         RegWrite   <= '1';
            
        -- J-TYPE Instructions
        ----------------------------
		ELSIF (Op(5 DOWNTO 1) = "00001") THEN
            
        -- Coprocessor Instructions
        ----------------------------
		ELSIF (Op(5 DOWNTO 2) = "0100") THEN
        
        -- I-Type Instructions
        ----------------------------
		ELSE
			IF (Op = "100011") THEN --lw
				MemToReg   <= '1';
				MemWrite   <= '0';
				Branch     <= '0';
				ALUControl <= Func;
				ALUSrc     <= '1';
				RegDst     <= '0';
				RegWrite   <= '1';
			ELSIF (Op = "101011") THEN --sw
				MemToReg   <= '0'; -- dont care
				MemWrite   <= '1';
				Branch     <= '0';
				ALUControl <= Func;
				ALUSrc     <= '1';
				RegDst     <= '0'; -- dont care
				RegWrite   <= '0';
			ELSIF (Op = "001000") THEN --addi
				MemToReg   <= '1';
				MemWrite   <= '0';
				Branch     <= '0';
				ALUControl <= Func;
				ALUSrc     <= '1';
				RegDst     <= '0';
				RegWrite   <= '1';		
			END IF;
       END IF;
	END PROCESS;
END Behavioral;

