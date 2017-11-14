LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


ENTITY cdmaReceiver IS		   
   PORT( code			: IN  std_logic;
         chip			: IN  std_logic;		
         clk			: IN  std_logic;
		 x1				: INOUT std_logic;
		 rst			: INOUT std_logic;
		 x2				: INOUT std_logic_vector(4 DOWNTO 0);
		 bn				: OUT std_logic);
END cdmaReceiver;


ARCHITECTURE cdmaReceiver OF cdmaReceiver IS	 							  
									
CONSTANT	THRESHOLD:	std_logic_vector(4 DOWNTO 0):="00111";
CONSTANT	SF:			integer:=16;	
--SIGNAL		x1:			std_logic;   
--SIGNAL		x2:			std_logic_vector(4 DOWNTO 0); 
--SIGNAL		rst:		std_logic	<=	'1';

COMPONENT multiplier
	PORT (	a: 		IN std_logic;
			b: 		IN std_logic; 
			clk:	IN std_logic;
			z: 		OUT std_logic);
END COMPONENT;

COMPONENT accumulator5
	PORT (	clk,rst,D: IN std_logic;	 			
			Q : OUT std_logic_vector(4 DOWNTO 0));
END COMPONENT;

COMPONENT decisor5 IS
	PORT(
		a:		IN std_logic_vector(4 DOWNTO 0);
		b:		IN std_logic_vector(4 DOWNTO 0);  
		z:		OUT std_logic);
END COMPONENT;

BEGIN					   
	S1: multiplier PORT MAP(code,chip,clk,x1);		
	S2: accumulator5 PORT MAP(clk, rst, x1, x2);
	S3:	decisor5 PORT MAP(x2, THRESHOLD, bn);	
	
	PROCESS(clk) 
	VARIABLE	count:	integer		:=	0;
	BEGIN
		IF(clk'event AND clk='1')	THEN		   	
			IF(count=0)			THEN	rst<='1';	
			ELSIF(count=1)		THEN	rst<='0';	 
			ELSIF(count=SF+3)	THEN
				count:=0;
				rst<='1';	   
			END IF;
			count:=count+1;
		END IF;
	END PROCESS;  
END cdmaReceiver;
