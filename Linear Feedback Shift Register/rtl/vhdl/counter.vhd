library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter is
    generic (WIDTH : natural:= 2);
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

    C <= cnt;

end architecture rtl;