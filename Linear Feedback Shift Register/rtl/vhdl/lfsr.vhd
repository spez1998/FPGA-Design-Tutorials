library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lfsr is
    Generic (WIDTH : natural:= 16);
    Port    (CLK   : in STD_LOGIC;
             RESET : in STD_LOGIC;
             Q     : out STD_LOGIC_VECTOR (WIDTH-1 downto 0)
);

end lfsr;

architecture RTL of lfsr is
    signal QI: STD_LOGIC_VECTOR(WIDTH-1 downto 0);

begin
    process(RESET, CLK) begin
        if RESET = '1' then
            QI <= (0 => '1', others => '0');
        elsif rising_edge(CLK) then
            QI <= (QI(12) xor QI(3) xor QI(1) xor QI(0)) & QI(15 downto 1);
        end if;
    end process;

    Q <= QI;

end RTL;