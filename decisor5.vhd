LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY decisor5 IS
	PORT(
		a:		IN std_logic_vector(4 DOWNTO 0);
		b:		IN std_logic_vector(4 DOWNTO 0);  
		z:		OUT std_logic);
END decisor5;

ARCHITECTURE decisor5 OF decisor5 IS
	BEGIN
		PROCESS (a, b)
		BEGIN
			IF (a<b)	THEN	z<='0';
			ELSE				z<='1';
			END IF;
		END PROCESS;
END decisor5;