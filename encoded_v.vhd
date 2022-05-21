library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity encoded_v is
	port(clk,freq_in:in std_logic;
		  freq_out:out std_logic_vector(1 downto 0));
end;

architecture bhv of encoded_v is
begin
process(clk,freq_in) is
variable count:integer range 0 to 3;
begin	
	if clk'event and clk='1' then
		if (freq_in='1') then
			count:=0;
			freq_out<="01";
		else
			if(count=3) then
				count:=0;
				freq_out<="11";
			else
				count:=count+1;
				freq_out<="00";
			end if;
		end if;
	end if;		
end process;
end;
