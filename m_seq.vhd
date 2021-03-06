library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_1164.all;

entity m_seq is
	port(clk:in std_logic;
		  m:out std_logic);
end;

architecture bhv of m_seq is
	signal m_init: std_logic_vector(6 downto 0):="1000000";
	begin 
	process(clk,m_init) is
		begin
		if clk'event and clk='1' then
			m_init(0)<=m_init(1);
			m_init(1)<=m_init(2);
			m_init(2)<=m_init(3);
			m_init(3)<=m_init(4);
			m_init(4)<=m_init(5);
			m_init(5)<=m_init(6);
			m_init(6)<=m_init(0) xor m_init(1);
		end if;
		m<=m_init(0);
	end process;
end;