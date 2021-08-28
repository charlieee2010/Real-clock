library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity BCD_FOR_7SEGMENT_SSD is
Port (
	BCDin_SSD 			: in  STD_LOGIC_VECTOR (3 downto 0);
	Seven_Segment_SSD 	: out STD_LOGIC_VECTOR (6 downto 0)
);
end BCD_FOR_7SEGMENT_SSD;
 
architecture BC_ARC of BCD_FOR_7SEGMENT_SSD is
 
begin
 
process(BCDin_SSD)
begin
 
	case BCDin_SSD is
		when x"0" =>	Seven_Segment_SSD <= "1111110"; ---0
		when x"1" =>	Seven_Segment_SSD <= "0110000"; ---1
		when x"2" =>	Seven_Segment_SSD <= "1101101"; ---2
		when x"3" =>	Seven_Segment_SSD <= "1111001"; ---3
		when x"4" =>	Seven_Segment_SSD <= "0110011"; ---4
		when x"5" =>	Seven_Segment_SSD <= "1011011"; ---5
		when x"6" =>	Seven_Segment_SSD <= "1011111"; ---6
		when x"7" =>	Seven_Segment_SSD <= "1110000"; ---7
		when x"8" =>	Seven_Segment_SSD <= "1111111"; ---8
		when x"9" =>	Seven_Segment_SSD <= "1111011"; ---9
		when others =>	Seven_Segment_SSD <= "XXXXXXX"; ---NULL
	end case;
 
end process;
 
end BC_ARC;
