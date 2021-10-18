library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
    generic (WIDTH : natural:= 4);
    port    (D0 : in  STD_LOGIC_VECTOR (WIDTH-1 downto 0);
             D1 : in  STD_LOGIC_VECTOR (WIDTH-1 downto 0);
             D2 : in  STD_LOGIC_VECTOR (WIDTH-1 downto 0);
             D3 : in  STD_LOGIC_VECTOR (WIDTH-1 downto 0);
             S  : in  STD_LOGIC_VECTOR (1 downto 0);
             Y  : out STD_LOGIC_VECTOR (WIDTH-1 downto 0)
    );

end mux;

architecture behav of mux is

begin

    process(S, D0, D1, D2, D3) begin
        if(S = "00") then
            Y <= D0;
        elsif (S = "01") then
            Y <= D1;
        elsif (S = "10") then
            Y <= D2;
        elsif (S = "11") then
            Y <= D3;
        end if;
    end process;

end architecture behav;

architecture struct of mux is

begin

    Y <= (D0 and not S(1) and not S(0)) or
         (D1 and not S(1) and not S(0)) or
         (D2 and not S(1) and not S(0)) or
         (D3 and not S(1) and not S(0));

end architecture struct;