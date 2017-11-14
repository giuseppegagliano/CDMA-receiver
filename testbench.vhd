LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY testbench IS

END testbench;

ARCHITECTURE testbench OF testbench IS

COMPONENT cdmareceiver
	   port( code			: IN  std_logic;
         chip			: IN  std_logic;		
         clk			: IN  std_logic;
		 x1				: INOUT std_logic;
		 rst			: INOUT std_logic;
		 x2				: INOUT std_logic_vector(4 DOWNTO 0);
		 bn				: OUT std_logic);
END COMPONENT;					  

----------------------------------------------------------------------------
	CONSTANT	SF:			integer	:=	16;	  
	CONSTANT	mClkPer:	TIME	:=	20 ns;  		-- Master Clk period   
	CONSTANT	TestLen :  INTEGER 	:=	160;      		-- No. of Count (MckPer/2) for test		   
																		   

-- I N P U T     S I G N A L S
	SIGNAL   clk	: std_logic :=	'1';   
	SIGNAL   code	: std_logic	:=	'0';
	SIGNAL   chip	: std_logic	:=	'0';	   			  
																			
-- O U T P U T     S I G N A L S								  
	SIGNAL   bits	: std_logic; 								  
	SIGNAL   x1		: std_logic;								  
	SIGNAL   rst	: std_logic;								  
	SIGNAL   x2		: std_logic_vector(4 downto 0);

	SIGNAL clk_cycle : INTEGER;
	SIGNAL Testing: Boolean := True;
	
BEGIN

	I :	cdmaReceiver PORT MAP(code, chip, clk,x1,rst,x2, bits);	
	
	-- Generates clk
	clk     <= NOT clk AFTER mClkPer/2 WHEN Testing ELSE '0';  					 

   -- Runs simulation for TestLen cycles;

Test_Proc:
	PROCESS(clk)
	VARIABLE count: INTEGER:= 0; 
	BEGIN
		clk_cycle <= (count+1)/2;			
		CASE count IS		  
-- BIT 1
			WHEN	4	=>	code	<= '0';
						chip	<= '1';
			WHEN	6	=>	code	<= '1';
						chip	<= '0';
			WHEN	8	=>	code	<= '0';
						chip	<= '1';
			WHEN	10	=>	code	<= '1';
						chip	<= '0';
			WHEN	12	=>	code	<= '0';
						chip	<= '1';
			WHEN	14	=>	code	<= '1';
						chip	<= '0';
			WHEN	16	=>	code	<= '0';
						chip	<= '1';
			WHEN	18	=>	code	<= '1';
						chip	<= '0';
			WHEN	20	=>	code	<= '0';
						chip	<= '1';
			WHEN	22	=>	code	<= '1';
						chip	<= '0';
			WHEN	24	=>	code	<= '0';
						chip	<= '1';
			WHEN	26	=>	code	<= '1';
						chip	<= '0';
			WHEN	28	=>	code	<= '0';
						chip	<= '1';
			WHEN	30	=>	code	<= '1';
						chip	<= '0';
			WHEN	32	=>	code	<= '0';
						chip	<= '1';
			WHEN	34	=>	code	<= '1';
						chip	<= '0';	  
			WHEN	36	=>	code	<= '0';
						chip	<= '0';
	  
-- BIT 0						
			WHEN	42	=>	code	<= '1';
						chip	<= '1';
			WHEN	44	=>	code	<= '0';
						chip	<= '0';
			WHEN	46	=>	code	<= '1';
						chip	<= '1';
			WHEN	48	=>	code	<= '0';
						chip	<= '0';
			WHEN	50	=>	code	<= '1';
						chip	<= '1';
			WHEN	52	=>	code	<= '0';
						chip	<= '0';
			WHEN	54	=>	code	<= '1';
						chip	<= '1';
			WHEN	56	=>	code	<= '0';
						chip	<= '0';
			WHEN	58	=>	code	<= '1';
						chip	<= '1';
			WHEN	60	=>	code	<= '0';
						chip	<= '0';
			WHEN	62	=>	code	<= '1';
						chip	<= '1';
			WHEN	64	=>	code	<= '0';
						chip	<= '0';
			WHEN	66	=>	code	<= '1';
						chip	<= '1';
			WHEN	68	=>	code	<= '0';
						chip	<= '0';
			WHEN	70	=>	code	<= '1';
						chip	<= '1';
			WHEN	72	=>	code	<= '0';
						chip	<= '0';
						
--	BIT 1
			WHEN	80	=>	code	<= '0';
						chip	<= '1';
			WHEN	82	=>	code	<= '1';
						chip	<= '0';
			WHEN	84	=>	code	<= '0';
						chip	<= '1';
			WHEN	86	=>	code	<= '1';
						chip	<= '0';
			WHEN	88	=>	code	<= '0';
						chip	<= '1';
			WHEN	90	=>	code	<= '1';
						chip	<= '0';
			WHEN	92	=>	code	<= '0';
						chip	<= '1';
			WHEN	94	=>	code	<= '1';
						chip	<= '0';
			WHEN	96	=>	code	<= '0';
						chip	<= '1';
			WHEN	98	=>	code	<= '1';
						chip	<= '0';
			WHEN	100	=>	code	<= '0';
						chip	<= '1';
			WHEN	102	=>	code	<= '1';
						chip	<= '0';
			WHEN	104	=>	code	<= '0';
						chip	<= '1';
			WHEN	106	=>	code	<= '1';
						chip	<= '0';
			WHEN	108	=>	code	<= '0';
						chip	<= '1';
			WHEN	110	=>	code	<= '1';
						chip	<= '0';
			WHEN	112	=>	code	<= '0';
						chip	<= '0';
						
-- BIT 1
			WHEN	118	=>	code	<= '0';
						chip	<= '1';
			WHEN	120	=>	code	<= '1';
						chip	<= '0';
			WHEN	122	=>	code	<= '0';
						chip	<= '1';
			WHEN	124	=>	code	<= '1';
						chip	<= '0';
			WHEN	126	=>	code	<= '0';
						chip	<= '1';
			WHEN	128	=>	code	<= '1';
						chip	<= '0';
			WHEN	130	=>	code	<= '0';
						chip	<= '1';
			WHEN	132	=>	code	<= '1';
						chip	<= '0';
			WHEN	134	=>	code	<= '0';
						chip	<= '1';
			WHEN	136	=>	code	<= '1';
						chip	<= '0';
			WHEN	138	=>	code	<= '0';
						chip	<= '1';
			WHEN	140	=>	code	<= '1';
						chip	<= '0';
			WHEN	142	=>	code	<= '0';
						chip	<= '1';
			WHEN	144	=>	code	<= '1';
						chip	<= '0';
			WHEN	146	=>	code	<= '0';
						chip	<= '1';
			WHEN	148	=>	code	<= '1';
						chip	<= '0';
			WHEN	150	=>	code	<= '0';
						chip	<= '0';



			WHEN (TestLen - 1) =>   Testing <= False;
			WHEN OTHERS => NULL;
		END CASE;
		count:= count + 1;
	END PROCESS Test_Proc;
END testbench;
