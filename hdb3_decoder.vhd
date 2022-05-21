library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity hdb3_decoder is
port( clk:in std_logic;  
      dein:in std_logic_vector(1 downto 0);     
      deout:out std_logic);
end hdb3_decoder;

architecture behave of hdb3_decoder is
signal D1,D0:std_logic_vector(3 downto 0);
signal m:std_logic_vector(1 downto 0):="00";
signal t:std_logic_vector(1 downto 0);
begin  
  t<=dein;    
process(clk,dein)is    
begin   
   if(clk='1' and clk'event)then        
D1(2 downto 0)<=D1(3 downto 1);        
D0(2 downto 0)<=D0(3 downto 1);
if((t="11") or (t="01")) then
          if(t=m) then
            D1(3 downto 0)<="0000";D0(3 downto 0)<="0000";
          else   
            m<=t;
            D1(3)<=t(1);D0(3)<=t(0);
             end if;
        else  
          D1(3)<=t(1);D0(3)<=t(0);
             end if;     
if((D1(0)='1' and D0(0)='1')or(D1(0)='0' and D0(0)='1')) then
        deout<='1';
        else deout<='0';
        end if;
      end if;
    end process;
end behave;