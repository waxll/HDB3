library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity encoded_b is 
	port(clk:in std_logic;
		  freq_in:in std_logic_vector(1 downto 0);
		  freq_out: out std_logic_vector(1 downto 0));
end;

architecture bhv of encoded_b is
signal temp0,temp1,temp2:std_logic_vector(1 downto 0);
signal count: integer range 0 to 99;
begin

p1:process(clk,freq_in) is
--variable	count: integer range 1 to 100;
--variable first_v: integer range 0 to 1;
begin
	if clk'event and clk='1' then
		temp2<=temp1;
		temp1<=temp0;
		temp0<=freq_in;
		if(freq_in="11") then
			if (count rem 2=0) then
				temp2<="10";
				freq_out<=temp2;
			end if;
			count<=0;
		else 
			freq_out<=temp2;
		end if;
		if(freq_in="01") then 
			count<=count+1;
		end if;
	end if;
end process;
end;