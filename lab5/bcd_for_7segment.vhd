library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity BCD_FOR_7SEGMENT is
Port (
	BCDin 			: in  STD_LOGIC_VECTOR (3 downto 0);
	Seven_Segment 	: out STD_LOGIC_VECTOR (6 downto 0)
);
end BCD_FOR_7SEGMENT;
 
architecture BC_ARC of BCD_FOR_7SEGMENT is
 
begin
 
process(BCDin)
begin
	case BCDin is
		when x"0" =>	Seven_Segment <= "0000001"; ---0
		when x"1" =>	Seven_Segment <= "1001111"; ---1
		when x"2" =>	Seven_Segment <= "0010010"; ---2
		when x"3" =>	Seven_Segment <= "0000110"; ---3
		when x"4" =>	Seven_Segment <= "1001100"; ---4
		when x"5" =>	Seven_Segment <= "0100100"; ---5
		when x"6" =>	Seven_Segment <= "0100000"; ---6
		when x"7" =>	Seven_Segment <= "0001111"; ---7
		when x"8" =>	Seven_Segment <= "0000000"; ---8
		when x"9" =>	Seven_Segment <= "0000100"; ---9
		when others =>	Seven_Segment <= "XXXXXXX"; ---NULL
	end case;
 
end process;
 
end BC_ARC;
