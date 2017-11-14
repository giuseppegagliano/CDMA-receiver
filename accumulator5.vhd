library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all; 
 
entity accumulator5 is 
  port(clk, rst, D: in  std_logic;
        Q : out std_logic_vector(4 downto 0)); 
end accumulator5; 		 

architecture accumulator5 of accumulator5 is 
  signal tmp: std_logic_vector(4 downto 0); 
  begin 
    process (clk, rst) 
      begin 
        if (rst='1') then						tmp <= "00000"; 
        elsif (clk'event and clk='1')	then	tmp <= tmp + D; 
        end if; 
    end process; 
    Q <= tmp; 
end accumulator5;