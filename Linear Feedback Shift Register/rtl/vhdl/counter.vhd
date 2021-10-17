library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter is
    generic (WIDTH : 2);
    port    (CLK, RST : in  STD_LOGIC;
             C        : out STD_LOGIC_VECTOR (WIDTH-1 downto 0)
    );
end counter;

architecture rtl of counter is

signal cnt : STD_LOGIC_VECTOR (WIDTH-1 downto 0);

begin

    process(CLK, RST) begin
        if(RST = '1') then
            cnt <= "0000";
        elsif(CLK'event and CLK='1') then
            cnt <= cnt + 1;
        end if;
    end process;

    C <= value;

end architecture rtl;