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
    reset : in STD_LOGIC;
    letter : in STD_LOGIC_VECTOR( 6 downto 0);
    enable : in STD_LOGIC;
    finished : out STD_LOGIC;
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
        if rising_edge(clockEnable) then
            if (reset = '1') then
            s_morse <= "00000"; -- 0
            s_morseLenght <="000";
            else
                case letter is
                    when "0000000" =>
                        s_morse <= "11111"; -- 0
                        s_morseLenght <="101";
                    when "0000001" =>
                        s_morse <= "11110"; -- 1
                        s_morseLenght <="101";
                    when "0000010" =>
                        s_morse <= "11100"; -- 2
                        s_morseLenght <="101";
                    when "0000011" =>
                        s_morse <= "11000"; -- 3
                        s_morseLenght <="101";
                    when "0000100" =>
                        s_morse <= "10000"; -- 4
                        s_morseLenght <="101";
                    when "0000101" =>
                        s_morse <= "00000"; -- 5
                        s_morseLenght <="101";
                    when "0000110" =>
                        s_morse <= "00001"; -- 6
                        s_morseLenght <="101";
                    when "0000111" =>
                        s_morse <= "00011"; -- 7
                        s_morseLenght <="101";
                    when "0001000" =>
                        s_morse <= "00111"; -- 8
                        s_morseLenght <="101";
                    when "0001001" =>
                        s_morse <= "01111"; -- 9
                        s_morseLenght <="101";
                    when "0001010" =>
                        s_morse <= "00010"; -- A
                        s_morseLenght <="010";
                    when "0001011" =>
                        s_morse <= "00001"; -- B
                        s_morseLenght <="100";
                    when "0001100" =>
                        s_morse <= "00101"; -- C
                        s_morseLenght <="100";
                    when "0001101" =>
                        s_morse <= "00001"; -- D
                        s_morseLenght <="011";
                    when "0001110" =>
                        s_morse <= "00000"; -- E
                        s_morseLenght <="001";
                    when "0001111" =>
                        s_morse <= "00100"; -- F
                        s_morseLenght <="100";
                    when "0010000" =>
                        s_morse <= "00011"; -- G
                        s_morseLenght <="011";
                    when "0010001" =>
                        s_morse <= "00000"; -- H
                        s_morseLenght <="100";
                    when "0010010" =>
                        s_morse <= "00000"; -- I
                        s_morseLenght <="010";
                    when "0010011" =>
                        s_morse <= "01110"; -- J
                        s_morseLenght <="100";
                    when "0010100" =>
                        s_morse <= "00101"; -- K
                        s_morseLenght <="011";
                    when "0010101" =>
                        s_morse <= "00010"; -- L
                        s_morseLenght <="100";
                    when "0010110" =>
                        s_morse <= "00011"; -- M
                        s_morseLenght <="010";
                    when "0010111" =>
                        s_morse <= "00001"; -- N
                        s_morseLenght <="010";
                    when "0011000" =>
                        s_morse <= "00111"; -- O
                        s_morseLenght <="011";
                    when "0011001" =>
                        s_morse <= "00110"; -- P
                        s_morseLenght <="100";
                    when "0011010" =>
                        s_morse <= "01011"; -- Q
                        s_morseLenght <="100";
                    when "0011011" =>
                        s_morse <= "00010"; -- R
                        s_morseLenght <="010";
                    when "0011100" =>
                        s_morse <= "00000"; -- S
                        s_morseLenght <="011";
                    when "0011101" =>
                        s_morse <= "00001"; -- T
                        s_morseLenght <="001";
                    when "0011110" =>
                        s_morse <= "00100"; -- U
                        s_morseLenght <="011";
                    when "0011111" =>
                        s_morse <= "01000"; -- V
                        s_morseLenght <="100";
                    when "0100000" =>
                        s_morse <= "00110"; -- W
                        s_morseLenght <="011";
                    when "0100001" =>
                        s_morse <= "01001"; -- X
                        s_morseLenght <="100";
                    when "0100010" =>
                        s_morse <= "01101"; -- Y
                        s_morseLenght <="100";
                    when others =>
                        s_morse <= "00011"; -- Z
                        s_morseLenght <="100";
                end case; 
            end if;
        end if;        
    end process morseDecoder;

    blinkdecoder : process(s_morseLenght, clockEnable, reset)
    begin
        if rising_edge(clockEnable) then
            if (reset = '1') then
                finished <= '1';
                led <= '0';
                s_timingIterator <= (to_unsigned(0,3));
                s_morseIterator <= (to_unsigned(0,3));
            else                
                if ( s_morseIterator = s_morseLenght) then
                    finished <= '1';
                    s_morseIterator <= to_unsigned(0,3);
                elsif (enable ='1') then
                    finished <= '0';
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
        end if;
    end process blinkdecoder;


end Behavioral;
