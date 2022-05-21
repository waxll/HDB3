library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity insert_v_b is 
	port(clk: in std_logic;
		  seq_in: in std_logic_vector(1 downto 0);
		  seq_out: out std_logic_vector(1 downto 0));
end;

architecture bhv of insert_v_b is
signal temp0,temp1,temp2,temp3,temp4: std_logic_vector(1 downto 0);
begin
p1:process(clk,seq_in) is
	variable pol:std_logic;
	begin
		if clk'event and clk='1' then
			temp0<=seq_in;
			temp1<=temp0;
			temp2<=temp1;
			temp3<=temp2;
			temp4<=temp3;
			if temp0=temp3 and temp0/="00" and temp1="00" and temp2="00" then
				temp4<="00";
				temp1<="00";
			else
				seq_out<=temp4;
			end if;
		end if;
	end process;
end;
				