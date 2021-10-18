LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity lfsr_tb is
end lfsr_tb;

architecture behavior of lfsr_tb is

    component top
    Port(clk, reset   : IN std_logic;
         anode_7seg   : OUT std_logic;
         cathode_7seg : OUT std_logic_vector(7 downto 0));
    end component;

    signal clk          : std_logic := '0';
    signal reset        : std_logic := '0';
    signal anode_7seg   : std_logic := '0';
    signal cathode_7seg : std_logic_vector(7 downto 0);

begin

    dut: top port map (clk          => clk,
                       reset        => reset,
                       anode_7seg   => anode_7seg,
                       cathode_7seg => cathode_7seg);

    clk   <= not clk after 10 ns;
    reset <= '1', '0' after 100 ns;

end;