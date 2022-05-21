library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity find_v is
	port(clk: in std_logic;
		  freq_in: in std_logic_vector(1 downto 0);
		  freq_out: out std_logic_vector(1 downto 0));
end;

architecture bhv of find_v is
signal count: integer range 0 to 2;
signal temp0: std_logic_vector(1 downto 0):="10";
signal temp1: std_logic_vector(1 downto 0):="01";
signal temp2: std_logic_vector(1 downto 0):="10";
signal temp3: std_logic_vector(1 downto 0):="01";
signal temp4: std_logic_vector(1 downto 0):="10";
signal temp5: std_logic_vector(1 downto 0):="01";
begin

p0:process(clk,freq_in) is 
begin
	if(clk'event and clk='1') then
		temp0<= freq_in;
		temp1<=temp0;
		temp2<=temp1;
		temp3<=temp2;
		temp4<=temp3;
		temp5<=temp4;
		freq_out<=temp5;
		if(temp2="00" and temp3="00" and temp1=temp4 ) then 
			temp1<="00";
			temp4<="00";
--		elsif(temp2="00" and temp3="00" and temp4="00" and temp1=temp5) then 
--			temp5<="00";
		end if;
	end if;
end process;
end;