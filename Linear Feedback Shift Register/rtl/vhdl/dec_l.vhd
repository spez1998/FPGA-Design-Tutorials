library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dec_l is
    port    (S  : in   STD_LOGIC_VECTOR (1 downto 0);
             Y  : out  STD_LOGIC_VECTOR (7 downto 0)
    );

end dec_l;

architecture behav of dec_l is

begin

    process(S) begin
        if(S = "00") then
            Y <= "11111110";
        elsif(S = "01") then
            Y <= "11111101";
        elsif(S = "10") then
            Y <= "11111011";
        elsif(S = "11") then
            Y <= "11110111";
        end if;
    end process;


end architecture behav;
