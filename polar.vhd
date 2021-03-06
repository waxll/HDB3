library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity polar is 
	port(clk:in std_logic;
		  seq_in:in std_logic_vector(1 downto 0);
		  seq_out:out std_logic_vector(1 downto 0));
end;

architecture bhv of polar is
begin

p1:process(clk,seq_in)
	variable even_v,even_b:std_logic;
	begin
		if clk'event and clk='1' then
			if (seq_in="01" or seq_in="10") then
				seq_out(0)<=even_b;
				seq_out(1)<=not even_b;
				even_b:= not even_b;
			elsif(seq_in="11") then 
				seq_out(0)<=even_v;
				seq_out(1)<=not even_v;
				even_v:=not even_v;
			else
				seq_out<="00";
			end if;
		end if;
	end process;
end;
