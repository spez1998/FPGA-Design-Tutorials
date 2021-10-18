library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dec_7seg is
    port (D_IN  : in STD_LOGIC_VECTOR (3 downto 0);
          D_OUT : out STD_LOGIC_VECTOR (7 downto 0));
end dec_7seg;

architecture rtl of dec_7seg is

begin
    
    -- Active low outputs
    -- D_OUT[8:0] corresponds to C[A, B, C, ..., G], DP.
    process(D_IN) begin
        case D_IN is
            when "0000" => D_OUT <= "11111101";
            when "0001" => D_OUT <= "10011111";
            when "0010" => D_OUT <= "00100101";
            when "0011" => D_OUT <= "00001101";
            when "0100" => D_OUT <= "10011001";
            when "0101" => D_OUT <= "01001001";
            when "0110" => D_OUT <= "01000001";
            when "0111" => D_OUT <= "00011111";
            when "1000" => D_OUT <= "00000001";
            when "1001" => D_OUT <= "00001001";
            when "1010" => D_OUT <= "00010001";
            when "1011" => D_OUT <= "11000001";
            when "1100" => D_OUT <= "01100011";
            when "1101" => D_OUT <= "10000101";
            when "1110" => D_OUT <= "01100001";
            when "1111" => D_OUT <= "01110001";
            when others => D_OUT <= "11111111";
        end case;
    end process;

end architecture rtl;