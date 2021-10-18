library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity top is
    Generic (LFSR_WIDTH : positive := 15;
             HEX_WIDTH  : positive := 4);
    Port    (reset, clk   : in  STD_LOGIC;
             anode_7seg   : out STD_LOGIC;
             cathode_7seg : out STD_LOGIC_VECTOR(7 downto 0));
end top;

architecture behavioral of top is

    component lfsr
        port(CLK, RESET : in  std_logic);
    end component;

    component counter
        port(CLK, RST : in std_logic;
             C        : out std_logic_vector (1 downto 0));
    end component;

    component mux
        port(D0 : in  STD_LOGIC_VECTOR (HEX_WIDTH-1 downto 0);
             D1 : in  STD_LOGIC_VECTOR (HEX_WIDTH-1 downto 0);
             D2 : in  STD_LOGIC_VECTOR (HEX_WIDTH-1 downto 0);
             D3 : in  STD_LOGIC_VECTOR (HEX_WIDTH-1 downto 0);
             S  : in  STD_LOGIC_VECTOR (1 downto 0);
             Y  : out STD_LOGIC_VECTOR (HEX_WIDTH-1 downto 0)
    );
    end component;

    component dec_l
        port(S : in STD_LOGIC_VECTOR (1 downto 0);
             Y: STD_LOGIC_VECTOR (3 downto 0));
    end component;

    component dec_7seg
    port (D_IN  : in STD_LOGIC_VECTOR (3 downto 0);
          D_OUT : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    signal slow_counter  : std_logic_vector(22 downto 0);
    signal med_counter   : std_logic_vector(16 downto 0);
    
    signal slow_clk : std_logic;
    signal med_clk  : std_logic;

    signal S : std_logic_vector(1 downto 0);
    signal hex_nibble : std_logic_vector(3 downto 0);

    signal lfsr_out     : std_logic_vector(LFSR_WIDTH downto 0);
    signal lfsr_out0    : std_logic_vector(HEX_WIDTH downto 0);
    signal lfsr_out1    : std_logic_vector(HEX_WIDTH downto 0);
    signal lfsr_out2    : std_logic_vector(HEX_WIDTH downto 0);
    signal lfsr_out3    : std_logic_vector(HEX_WIDTH downto 0);
    signal lfsr_out_cur : std_logic_vector(HEX_WIDTH downto 0);

    signal 

begin

    unit: lfsr port map (CLK => slow_clk, RESET => reset, Q => lfsr_out);
    unit: counter port map (CLK => med_clk, RST => reset, C => S);
    unit: dec_l port map (S => S, Y => anode_7seg);
    unit: dec_7seg port map (D_IN => lfsr_out_cur, D_OUT => cathode_7seg);
    unit: mux port map (D0 => lfsr_out0,
                        D1 => lfsr_out1,
                        D2 => lfsr_out2,
                        D3 => lfsr_out3,
                        S => S,
                        Y => lfsr_out_cur);

    -- 50MHz clock divided by 2^23 gives ~6Hz slow clock
    -- 50MHz clock divided by 2^17 gives ~380Hz med clock
    process(clk, reset)
    begin
        if reset = '1' then
            slow_counter <= (others => '0');
            med_counter  <= (others => '0');
        elsif rising_edge(clk) then
            slow_counter <= slow_counter + 1;
            med_counter  <= med_counter + 1;
        end if;
    end process;

    slow_clk <= slow_counter(22)
    med_clk  <= med_counter(16)

    -- Assign LFSR output nibbles to discrete signals
    lfsr_out3 <= lfsr_out(15 downto 12);
    lfsr_out2 <= lfsr_out(11 downto 8);
    lfsr_out1 <= lfsr_out(7 downto 4);
    lfsr_out0 <= lfsr_out(3 downto 0);

end behavioral;