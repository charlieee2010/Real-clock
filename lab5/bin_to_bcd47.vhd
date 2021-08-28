Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity BIN_TO_BCD is
port(
	BINVAL   : in  std_logic_vector (5 downto 0);
	MS_DIGIT : out std_logic_vector (3 downto 0);
	LS_DIGIT : out std_logic_vector (3 downto 0)
);
end BIN_TO_BCD;

architecture BIN_TO_BCD_ARC of BIN_TO_BCD is
begin
process(BINVAL)
begin
	case BINVAL is
		when "000000" => MS_DIGIT <= x"0" ;LS_DIGIT <= x"0" ;
		when "000001" => MS_DIGIT <= x"0" ;LS_DIGIT <= x"1" ;
		when "000010" => MS_DIGIT <= x"0" ;LS_DIGIT <= x"2" ;
		when "000011" => MS_DIGIT <= x"0" ;LS_DIGIT <= x"3" ;
		when "000100" => MS_DIGIT <= x"0" ;LS_DIGIT <= x"4" ;
		when "000101" => MS_DIGIT <= x"0" ;LS_DIGIT <= x"5" ;
		when "000110" => MS_DIGIT <= x"0" ;LS_DIGIT <= x"6" ;
		when "000111" => MS_DIGIT <= x"0" ;LS_DIGIT <= x"7" ;
		when "001000" => MS_DIGIT <= x"0" ;LS_DIGIT <= x"8" ;
		when "001001" => MS_DIGIT <= x"0" ;LS_DIGIT <= x"9" ;
		when "001010" => MS_DIGIT <= x"1" ;LS_DIGIT <= x"0" ;
		when "001011" => MS_DIGIT <= x"1" ;LS_DIGIT <= x"1" ;
		when "001100" => MS_DIGIT <= x"1" ;LS_DIGIT <= x"2" ;
		when "001101" => MS_DIGIT <= x"1" ;LS_DIGIT <= x"3" ;
		when "001110" => MS_DIGIT <= x"1" ;LS_DIGIT <= x"4" ;
		when "001111" => MS_DIGIT <= x"1" ;LS_DIGIT <= x"5" ;
		when "010000" => MS_DIGIT <= x"1" ;LS_DIGIT <= x"6" ;
		when "010001" => MS_DIGIT <= x"1" ;LS_DIGIT <= x"7" ;
		when "010010" => MS_DIGIT <= x"1" ;LS_DIGIT <= x"8" ;
		when "010011" => MS_DIGIT <= x"1" ;LS_DIGIT <= x"9" ;
		when "010100" => MS_DIGIT <= x"2" ;LS_DIGIT <= x"0" ;
		when "010101" => MS_DIGIT <= x"2" ;LS_DIGIT <= x"1" ;
		when "010110" => MS_DIGIT <= x"2" ;LS_DIGIT <= x"2" ;
		when "010111" => MS_DIGIT <= x"2" ;LS_DIGIT <= x"3" ;
		when "011000" => MS_DIGIT <= x"2" ;LS_DIGIT <= x"4" ;
		when "011001" => MS_DIGIT <= x"2" ;LS_DIGIT <= x"5" ;
		when "011010" => MS_DIGIT <= x"2" ;LS_DIGIT <= x"6" ;
		when "011011" => MS_DIGIT <= x"2" ;LS_DIGIT <= x"7" ;
		when "011100" => MS_DIGIT <= x"2" ;LS_DIGIT <= x"8" ;
		when "011101" => MS_DIGIT <= x"2" ;LS_DIGIT <= x"9" ;
		when "011110" => MS_DIGIT <= x"3" ;LS_DIGIT <= x"0" ;
		when "011111" => MS_DIGIT <= x"3" ;LS_DIGIT <= x"1" ;
		when "100000" => MS_DIGIT <= x"3" ;LS_DIGIT <= x"2" ;
		when "100001" => MS_DIGIT <= x"3" ;LS_DIGIT <= x"3" ;
		when "100010" => MS_DIGIT <= x"3" ;LS_DIGIT <= x"4" ;
		when "100011" => MS_DIGIT <= x"3" ;LS_DIGIT <= x"5" ;
		when "100100" => MS_DIGIT <= x"3" ;LS_DIGIT <= x"6" ;
		when "100101" => MS_DIGIT <= x"3" ;LS_DIGIT <= x"7" ;
		when "100110" => MS_DIGIT <= x"3" ;LS_DIGIT <= x"8" ;
		when "100111" => MS_DIGIT <= x"3" ;LS_DIGIT <= x"9" ;
		when "101000" => MS_DIGIT <= x"4" ;LS_DIGIT <= x"0" ;
		when "101001" => MS_DIGIT <= x"4" ;LS_DIGIT <= x"1" ;
		when "101010" => MS_DIGIT <= x"4" ;LS_DIGIT <= x"2" ;
		when "101011" => MS_DIGIT <= x"4" ;LS_DIGIT <= x"3" ;
		when "101100" => MS_DIGIT <= x"4" ;LS_DIGIT <= x"4" ;
		when "101101" => MS_DIGIT <= x"4" ;LS_DIGIT <= x"5" ;
		when "101110" => MS_DIGIT <= x"4" ;LS_DIGIT <= x"6" ;
		when "101111" => MS_DIGIT <= x"4" ;LS_DIGIT <= x"7" ;
		when "110000" => MS_DIGIT <= x"4" ;LS_DIGIT <= x"8" ;
		when "110001" => MS_DIGIT <= x"4" ;LS_DIGIT <= x"9" ;
		when "110010" => MS_DIGIT <= x"5" ;LS_DIGIT <= x"0" ;
		when "110011" => MS_DIGIT <= x"5" ;LS_DIGIT <= x"1" ;
		when "110100" => MS_DIGIT <= x"5" ;LS_DIGIT <= x"2" ;
		when "110101" => MS_DIGIT <= x"5" ;LS_DIGIT <= x"3" ;
		when "110110" => MS_DIGIT <= x"5" ;LS_DIGIT <= x"4" ;
		when "110111" => MS_DIGIT <= x"5" ;LS_DIGIT <= x"5" ;
		when "111000" => MS_DIGIT <= x"5" ;LS_DIGIT <= x"6" ;
		when "111001" => MS_DIGIT <= x"5" ;LS_DIGIT <= x"7" ;
		when "111010" => MS_DIGIT <= x"5" ;LS_DIGIT <= x"8" ;
		when "111011" => MS_DIGIT <= x"5" ;LS_DIGIT <= x"9" ;
		when OTHERS   => MS_DIGIT <= "XXXX" ;LS_DIGIT <= "XXXX" ;
	end case;
end process;
end BIN_TO_BCD_ARC;