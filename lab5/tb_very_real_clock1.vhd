library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.std_logic_unsigned.all;

entity TB_VERY_REAL_CLOCK1 is
end TB_VERY_REAL_CLOCK1;

architecture TB_VERY_ARC of TB_VERY_REAL_CLOCK1 is
  
component VERY_REAL_CLOCK 
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
end component;  
  
	signal tbCLK:			    std_logic:= '1';
	signal tbRST:		        std_logic;
	signal tbTEST_MODE:			std_logic:= '1';
	signal tbLOAD:              std_logic;
	signal tbDATA_IN:            std_logic_vector(5 downto 0);
	signal tbADDRS:              std_logic_vector (1 downto 0);
	signal tbB_SEG_OUT:	        std_logic_vector(6 downto 0);
	signal tbANODE_OUT:		    std_logic_vector(3 downto 0);
	signal tbSSD_SEG_OUT:	    std_logic_vector(6 downto 0);
	signal tbCATHODE_OUT:	   	std_logic;

begin

DUT: VERY_REAL_CLOCK
port map
(
	CLK   				=> 	tbCLK,
	RST 				=> 	tbRST,
	TEST_MODE			=> 	tbTEST_MODE,
	LOAD                =>  tbLOAD,
	DATA_IN             =>  tbDATA_IN,
	ADDRS               =>  tbADDRS,
	B_SEG_OUT	        => 	tbB_SEG_OUT,
	ANODE_OUT		    =>	tbANODE_OUT,
	SSD_SEG_OUT	        =>	tbSSD_SEG_OUT,
	CATHODE_OUT		    =>	tbCATHODE_OUT
);


L1: tbRST <= '1',
               '0' after 13 ns;

L2:process
begin
  wait for 5 ns;
  tbCLK <= not(tbCLK);
end process;

tbDATA_IN <= "010111", -- 23
          "111010" after 50 ns, --58
          "000000" after 100 ns;

tbADDRS <= "11", --hour
          "10" after 50 ns,
          "01" after 100 ns;

tbLOAD <= '0',
		  '1' after 20 ns,
          '0' after 45 ns,
		  '1' after 70 ns,
          '0' after 95 ns,
		  '1' after 120 ns,
          '0' after 145 ns;

			
end TB_VERY_ARC;
	