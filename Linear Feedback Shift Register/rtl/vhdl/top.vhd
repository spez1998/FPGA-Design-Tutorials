library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity top is
    Generic (WIDTH: 15);
    Port    (reset, clk : in  STD_LOGIC;
             Q          : out STD_LOGIC_VECTOR (WIDTH-1 downto 0));
end top;

architecture behavioral of top is

    component lfsr
        port(CLK, RESET : in  std_logic;
             Q          : out std_logic_vector (WIDTH-1 downto 0));
    end component;

    signal counter  : std_logic_vector(22 downto 0);
    signal slow_clk : std_logic;

begin

    unit: lfsr port map (CLK => slow_clk, RESET => reset, Q => Q);

    -- 50MHz clock divided by 2^23 gives ~6Hz slow clock
    process(clk, reset)
    begin
        if reset = '1' then
            counter <= (others => '0');
        elsif rising_edge(clk) then
            counter <= counter + 1;
        end if;
    end process;

    slow_clk <= counter(22)

end behavioral;