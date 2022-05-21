library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity freq_clk is
	port(clk: in std_logic;
			clk_out: out std_logic);
end;

architecture bhv of freq_clk is
constant multiple: integer:=50;
begin
process(clk) is
	variable count: integer range 0 to multiple-1;
	begin
	if clk'event and clk='1' then
		if(count<multiple/2) then
			clk_out<='0';
			count:=count+1;
		elsif(count<multiple-1) then
			clk_out<='1';
			count:=count+1;
		else
			count:=0;
		end if;
	end if;
end process;
end;