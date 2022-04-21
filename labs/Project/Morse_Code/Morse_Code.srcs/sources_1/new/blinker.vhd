----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2022 02:23:44 PM
-- Design Name: 
-- Module Name: blinker - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;   -- Package for arithmetic operations

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity blinker is
  Port (
    clockEnable : in STD_LOGIC;
    letter : in STD_LOGIC_VECTOR( 6 downto 0);
    enable : in STD_LOGIC;
    finished : out STD_LOGIC;
    test : out STD_LOGIC;
    led : out std_logic);
end blinker;

architecture Behavioral of blinker is

signal s_morse : std_logic_vector( 4 downto 0);
signal s_morseLenght : unsigned( 2 downto 0);
signal s_morseIterator : unsigned( 2 downto 0);
signal s_timingIterator : unsigned( 2 downto 0);
begin

morseDecoder : process(letter, clockEnable)
    begin
        case letter is
            when "0000000" =>
                s_morse <= "11111"; -- 0
                s_morseLenght <="101";
            when "0000001" =>
                s_morse <= "11110"; -- 1
                s_morseLenght <="101";
--            when "0000010" =>
--                seg_o <= "0010010"; -- 2
--            when "0000011" =>
--                seg_o <= "0000110"; -- 3
--            when "0000100" =>
--                seg_o <= "1001100"; -- 4
--            when "0000101" =>
--                seg_o <= "0100100"; -- 5
--            when "0000110" =>
--                seg_o <= "0100000"; -- 6
--            when "0000111" =>
--                seg_o <= "0001111"; -- 7
--            when "0001000" =>
--                seg_o <= "0000000"; -- 8
--            when "0001001" =>
--                seg_o <= "0000100"; -- 9
--            when "0001010" =>
--                seg_o <= "0001000"; -- A
--            when "0001011" =>
--                seg_o <= "1100000"; -- b
--            when "0001100" =>
--                seg_o <= "0110001"; -- C
--            when "0001101" =>
--                seg_o <= "1000010"; -- d
--            when "0001110" =>
--                seg_o <= "0110000"; -- E
--            when "0001111" =>
--                seg_o <= "0111000"; -- F
--            when "0010000" =>
--                seg_o <= "0100001"; -- G
--            when "0010001" =>
--                seg_o <= "1101000"; -- H
--            when "0010010" =>
--                seg_o <= "1101111"; -- i
--            when "0010011" =>
--                seg_o <= "1000011"; -- J
--            when "0010100" =>
--                seg_o <= "0101000"; -- K
--            when "0010101" =>
--                seg_o <= "1110001"; -- L
--            when "0010110" =>
--                seg_o <= "0101010"; -- M
--            when "0010111" =>
--                seg_o <= "1101010"; -- N
--            when "0011000" =>
--                seg_o <= "1100010"; -- o
--            when "0011001" =>
--                seg_o <= "0011000"; -- P
--            when "0011010" =>
--                seg_o <= "0001100"; -- q
--            when "0011011" =>
--                seg_o <= "1111010"; -- r
--            when "0011100" =>
--                seg_o <= "0100101"; -- S
--            when "0011101" =>
--                seg_o <= "1000110"; -- t
--            when "0011110" =>
--                seg_o <= "1000001"; -- U
--            when "0011111" =>
--                seg_o <= "1100011"; -- V
--            when "0100000" =>
--                seg_o <= "1010100"; -- W
--            when "0100001" =>
--                seg_o <= "1001000"; -- X
--            when "0100010" =>
--                seg_o <= "1000100"; -- Y
            when others =>
                s_morse <= "00011"; -- 1
                s_morseLenght <="100";
        end case;
    end process morseDecoder;

    blinkdecoder : process(s_morseLenght, clockEnable)
    begin
        
        if (clockEnable'event and clockEnable = '1') then
        
                if ( s_morseIterator = s_morseLenght) then
                    finished <= '1';
                    s_morseIterator <= to_unsigned(0,3);
                    test<= '1';
                elsif (enable ='1') then
                    finished <= '0';
                    test<= '0';
                    if ((s_morse(to_integer(s_morseIterator))) = '1') then
                        led <= '1';
                        if ( s_timingIterator = 3) then
                            led <= '0';
                            s_timingIterator <= (to_unsigned(0,3));
                            s_morseIterator <= s_morseIterator+1;
                        else
                            s_timingIterator <= s_timingIterator + 1;
                        end if;
                    elsif ((s_morse(to_integer(s_morseIterator))) = '0') then
                        led <= '1';
                        if ( s_timingIterator = 1) then
                            led <= '0';
                            s_timingIterator <= to_unsigned(0,3);
                            s_morseIterator <= s_morseIterator+1;
                        else
                            s_timingIterator <= s_timingIterator + 1;
                        end if;
                    end if;
                
                end if;
        end if;
    end process blinkdecoder;


end Behavioral;
