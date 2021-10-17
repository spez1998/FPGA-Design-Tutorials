LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity lfsr_tb is
end lfsr_tb;

architecture behavior of lfsr_tb is

    component lfsr
    Port(clk   : IN std_logic;
         reset : IN std_logic;
         Q     : OUT std_logic_vector(15 downto 0));
    end component;

    signal clk   : std_logic := '0';
    signal reset : std_logic := '0';
    signal Q     : std_logic_vector(15 downto 0);

begin

    dut: lfsr port map
            (clk => clk, reset => reset, Q => Q);

    clk   <= not clk after 10 ns;
    reset <= '1', '0' after 100 ns;

end;