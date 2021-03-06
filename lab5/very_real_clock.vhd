Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity VERY_REAL_CLOCK is
port
(
	CLK:    			in  std_logic;
	RST:  			    in  std_logic;
	TEST_MODE:    		in	std_logic;
	LOAD:               in  std_logic;
	DATA_IN:            in  std_logic_vector(5 downto 0);
	ADDRS:              in std_logic_vector (1 downto 0);
	B_SEG_OUT:      	out std_logic_vector(6 downto 0);
	ANODE_OUT:	        out	std_logic_vector(3 downto 0);
	SSD_SEG_OUT:    	out std_logic_vector(6 downto 0);
	CATHODE_OUT:	    out	std_logic
);
end VERY_REAL_CLOCK;

architecture VERY_ARC of VERY_REAL_CLOCK is

--components--

component REAL_CLOCK
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
  SEC_OUT:	    out	std_logic_vector(5 downto 0);
  MIN_OUT:	    out	std_logic_vector(5 downto 0);
  HOU_OUT:	    out	std_logic_vector(4 downto 0)
);	
end component;

component BIN_TO_BCD
port
(
	BINVAL : in  std_logic_vector (5 downto 0);
	MS_DIGIT : out std_logic_vector (3 downto 0);
	LS_DIGIT : out std_logic_vector (3 downto 0)
);	
end component;

component BCD_FOR_7SEGMENT
port
(
	BCDin:			 in  std_logic_vector(3 downto 0);
	Seven_Segment:	 out std_logic_vector(6 downto 0)
);
end component;

component BCD_FOR_7SEGMENT_SSD
port
(
	BCDin_SSD 			: in  std_logic_vector(3 downto 0);
	Seven_Segment_SSD 	: out std_logic_vector(6 downto 0)
);
end component;

--internals signals--
--from-REAL_CLOCK:
signal Q_SEC:	     std_logic_vector(5 downto 0);
signal Q_MIN:	     std_logic_vector(5 downto 0);
signal Q_HOU:	     std_logic_vector(4 downto 0);
signal Q_HOU_EXT:	 std_logic_vector(5 downto 0);
signal SEL_SEC:      std_logic;
signal SEL_MIN:      std_logic;
signal SEL_HOU:      std_logic;

--from-BIN_TO_BCD:
signal MS_SEC:	std_logic_vector (3 downto 0);
signal LS_SEC:	std_logic_vector (3 downto 0);
signal MS_MIN:	std_logic_vector (3 downto 0);
signal LS_MIN:	std_logic_vector (3 downto 0);
signal MS_HOU:	std_logic_vector (3 downto 0);
signal LS_HOU:  std_logic_vector (3 downto 0);
--from-BCD_FOR_7SEGMENT:
signal MS_SEG_SEC:	std_logic_vector(6 downto 0);
signal LS_SEG_SEC:	std_logic_vector(6 downto 0);
signal MS_SEG_MIN:	std_logic_vector(6 downto 0);
signal LS_SEG_MIN:	std_logic_vector(6 downto 0);
--from-BCD_FOR_7SEGMENT_SSD:
signal MS_SEG_HOU:	std_logic_vector(6 downto 0);
signal LS_SEG_HOU:	std_logic_vector(6 downto 0);
--inner counter:
signal IN_CNTR:		std_logic_vector(1 downto 0);

begin
--port-maps:
--extended hours
Q_HOU_EXT <= '0'&Q_HOU;          -- add a zero for the SSD
--REAL_CLOCK:
PM0:	REAL_CLOCK 	   port map (CLK,RST,TEST_MODE,DATA_IN,LOAD,SEL_SEC,SEL_MIN,SEL_HOU,Q_SEC,Q_MIN,Q_HOU);
--BIN_TO_BCD:
PM1:	BIN_TO_BCD	 		port map (Q_SEC,MS_SEC,LS_SEC);
PM2:	BIN_TO_BCD 			port map (Q_MIN,MS_MIN,LS_MIN);
PM3:	BIN_TO_BCD 			port map (Q_HOU_EXT,MS_HOU,LS_HOU);
--BCD_FOR_7SEGMENT:
PM4:	BCD_FOR_7SEGMENT 	port map (MS_SEC,MS_SEG_SEC);
PM5:	BCD_FOR_7SEGMENT	port map (LS_SEC,LS_SEG_SEC);
PM6:	BCD_FOR_7SEGMENT	port map (MS_MIN,MS_SEG_MIN);
PM7:	BCD_FOR_7SEGMENT	port map (LS_MIN,LS_SEG_MIN);
--BCD_TO_7SEGMENT_SSD:
PM8:	BCD_FOR_7SEGMENT_SSD port map (MS_HOU,MS_SEG_HOU);
PM9:	BCD_FOR_7SEGMENT_SSD port map (LS_HOU,LS_SEG_HOU);



--The internal counter
process
begin
	wait until rising_edge(CLK);
	if (RST = '1') then
		IN_CNTR <= (others => '0');
	else
		IN_CNTR <= IN_CNTR + 1;
	end if;
end process;

--Basys Mux
process (IN_CNTR,MS_SEG_SEC,LS_SEG_SEC,MS_SEG_MIN,LS_SEG_MIN)
begin
case IN_CNTR is
    when "00" =>
        ANODE_OUT <= "0111"; 
        B_SEG_OUT <= MS_SEG_MIN;
    when "01" =>
        ANODE_OUT <= "1011"; 
        B_SEG_OUT <= LS_SEG_MIN;
    when "10" =>
        ANODE_OUT <= "1101"; 
        B_SEG_OUT <= MS_SEG_SEC;
    when "11" =>
        ANODE_OUT <= "1110"; 
        B_SEG_OUT <= LS_SEG_SEC; 
	when others =>
		ANODE_OUT <= "XXXX"; 
        B_SEG_OUT <= "XXXXXXX";
    end case;
end process;

--SSD Mux
process (IN_CNTR(0),MS_SEG_HOU,LS_SEG_HOU)
begin
case IN_CNTR(0) is
    when '0' =>
        CATHODE_OUT <= '0'; 
        SSD_SEG_OUT <= MS_SEG_HOU;
    when '1' =>
        CATHODE_OUT <= '1'; 
        SSD_SEG_OUT <= LS_SEG_HOU;
	when others =>
		CATHODE_OUT <= 'X'; 
        SSD_SEG_OUT <= "XXXXXXX";
    end case;
end process;
-----the decoder
    SEL_SEC <= '1' when (ADDRS = "01") else '0';
	SEL_MIN <= '1' when (ADDRS = "10") else '0';
	SEL_HOU <= '1' when (ADDRS = "11") else '0';
end VERY_ARC;