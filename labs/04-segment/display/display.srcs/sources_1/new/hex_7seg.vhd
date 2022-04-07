------------------------------------------------------------
--
-- Template for 7-segment display decoder.
-- Nexys A7-50T, Vivado v2020.1, EDA Playground
--
-- Copyright (c) 2018-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for seven7-segment display decoder
------------------------------------------------------------
entity hex_7seg is
    port(
        hex_i : in  std_logic_vector(7 - 1 downto 0);
        seg_o : out std_logic_vector(7 - 1 downto 0)
    );
end entity hex_7seg;

------------------------------------------------------------
-- Architecture body for seven-segment display decoder
------------------------------------------------------------
architecture Behavioral of hex_7seg is
begin
    --------------------------------------------------------
    -- p_7seg_decoder:
    -- A combinational process for 7-segment display (Common
    -- Anode) decoder. Any time "hex_i" is changed, the process
    -- is "executed". Output pin seg_o(6) controls segment A,
    -- seg_o(5) segment B, etc.
    --       segment A
    --        | segment B
    --        |  | segment C
    --        +-+|  |   ...   segment G
    --          ||+-+          |
    --          |||            |
    -- seg_o = "0000001"-------+
    --------------------------------------------------------
    p_7seg_decoder : process(hex_i)
    begin
        case hex_i is
            when "0000000" =>
                seg_o <= "0000001"; -- 0
            when "0000001" =>
                seg_o <= "1001111"; -- 1
            when "0000010" =>
                seg_o <= "0010010"; -- 2
            when "0000011" =>
                seg_o <= "0000110"; -- 3
            when "0000100" =>
                seg_o <= "1001100"; -- 4
            when "0000101" =>
                seg_o <= "0100100"; -- 5
            when "0000110" =>
                seg_o <= "0100000"; -- 6
            when "0000111" =>
                seg_o <= "0001111"; -- 7
            when "0001000" =>
                seg_o <= "0000000"; -- 8
            when "0001001" =>
                seg_o <= "0000100"; -- 9
            when "0001010" =>
                seg_o <= "0001000"; -- A
            when "0001011" =>
                seg_o <= "1100000"; -- b
            when "0001100" =>
                seg_o <= "0110001"; -- C
            when "0001101" =>
                seg_o <= "1000010"; -- d
            when "0001110" =>
                seg_o <= "0110000"; -- E
            when "0001111" =>
                seg_o <= "0111000"; -- F
            when "0010000" =>
                seg_o <= "0100001"; -- G
            when "0010001" =>
                seg_o <= "1101000"; -- H
            when "0010010" =>
                seg_o <= "1101111"; -- i
            when "0010011" =>
                seg_o <= "1000011"; -- J
            when "0010100" =>
                seg_o <= "0101000"; -- K
            when "0010101" =>
                seg_o <= "1110001"; -- L
            when "0010110" =>
                seg_o <= "0101010"; -- M
            when "0010111" =>
                seg_o <= "1101010"; -- N
            when "0011000" =>
                seg_o <= "1100010"; -- o
            when "0011001" =>
                seg_o <= "0011000"; -- P
            when "0011010" =>
                seg_o <= "0001100"; -- q
            when "0011011" =>
                seg_o <= "1111010"; -- r
            when "0011100" =>
                seg_o <= "0100101"; -- S
            when "0011101" =>
                seg_o <= "1000110"; -- t
            when "0011110" =>
                seg_o <= "1000001"; -- U
            when "0011111" =>
                seg_o <= "1100011"; -- V
            when "0100000" =>
                seg_o <= "1010100"; -- W
            when "0100001" =>
                seg_o <= "1001000"; -- X
            when "0100010" =>
                seg_o <= "1000100"; -- Y
            when others =>
                seg_o <= "0010011"; -- Z
        end case;
    end process p_7seg_decoder;

end architecture Behavioral;
