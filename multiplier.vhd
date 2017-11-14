LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY multiplier IS
	PORT(
		a:		IN std_logic;
		b:		IN std_logic; 
		clk:	IN std_logic;
		z:		OUT std_logic);
END multiplier;

ARCHITECTURE multiplier OF multiplier IS
	BEGIN
		PROCESS (clk)
		BEGIN 	   	  
			IF(clk'event AND clk='1')	THEN	z <= a XOR b;
			END IF;
		END PROCESS;
END multiplier;