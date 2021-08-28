library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.std_logic_unsigned.all;

entity REAL_CLOCK is
port
(
  CLK:    		in  std_logic;
  RST:  		in  std_logic;
  TEST_MODE:    in	std_logic;
  DATA_IN:      in  std_logic_vector(5 downto 0);
  LOAD:         in  std_logic;
  SEL_SEC:      in  std_logic;
  SEL_MIN:      in  std_logic;
  SEL_HOU:      in  std_logic;
  SEC_OUT:	out	std_logic_vector(5 downto 0);
  MIN_OUT:	out	std_logic_vector(5 downto 0);
  HOU_OUT:	out	std_logic_vector(4 downto 0)
);
end REAL_CLOCK;

architecture REAL_CLOCK_ARC of REAL_CLOCK is
  signal TC_TB:	std_logic;
  signal Q_TB:	std_logic_vector(26 downto 0);
  signal Q_SEC:		std_logic_vector(5 downto 0);
  signal Q_MIN:		std_logic_vector(5 downto 0);
  signal Q_HOU:		std_logic_vector(4 downto 0);
  

begin



--THe SECONDS COUNTER
process
begin
	wait until rising_edge(CLK);
	if (RST = '1') then
		Q_SEC <= (others => '0');
	else
		if(LOAD= '1') and (SEL_SEC = '1') then
             Q_SEC <= DATA_IN;
         else			 
		    if (TC_TB = '1') then
			    if (Q_SEC < 59) then
				    Q_SEC <= Q_SEC + 1;
			    else
				    Q_SEC <= (others => '0');
			    end if;
			end if;
		 end if;
    end if;
end process;

--THE MINUTES COUNTER
process
begin
	wait until rising_edge(CLK);
	if (RST = '1') then
		Q_MIN <= (others => '0');
	else
		if(LOAD = '1') and (SEL_MIN = '1') then
             Q_MIN <= DATA_IN;
        else			 
		    if (TC_TB = '1') then
			    if (Q_MIN < 59) then
				    Q_MIN <= Q_MIN + 1;
			    else
				    Q_MIN <= (others => '0');
			    end if;
			end if;
		 end if;
    end if;
end process;

--THE HOURS COUNTER
process
begin
	wait until rising_edge(CLK);
	if (RST = '1') then
		Q_HOU <= (others => '0');
	else
	    if (LOAD = '1') and (SEL_HOU = '1') then
		    Q_HOU <= DATA_IN(4 downto 0); 
		else	
		    if ((TC_TB = '1') and (Q_MIN = 59) and (Q_SEC = 59)) then
			    if (Q_HOU < 23) then
				    Q_HOU <= Q_HOU + 1;
			    else
				    Q_HOU <= (others => '0');
			    end if;
		    end if;
	    end if;
	end if;
end process;

--THE TIMEBASE COUNTER
process
begin
	wait until rising_edge(CLK);
	if (RST = '1') then
		Q_TB <= (others => '0');
		TC_TB <= '0';
	else
		if (TEST_MODE = '1') then
			if (Q_TB < 9) then
				Q_TB <= Q_TB + 1;
				TC_TB <= '0';
			else
				Q_TB <= (others => '0');
				TC_TB <= '1';
			end if;	
		else
			if (Q_TB < 99999999) then
				Q_TB <= Q_TB + 1;
				TC_TB <= '0';
			else
				Q_TB <= (others => '0');
				TC_TB <= '1';
			end if;	
		end if;
	end if;
end process;

--PORT MAP
SEC_OUT <= Q_SEC;
MIN_OUT <= Q_MIN;
HOU_OUT <= Q_HOU;

end REAL_CLOCK_ARC;