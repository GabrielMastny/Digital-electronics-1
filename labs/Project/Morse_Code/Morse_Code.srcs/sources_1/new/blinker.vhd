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
    enable : inout STD_LOGIC;
    morse : out std_logic_vector( 4 downto 0));
end blinker;

architecture Behavioral of blinker is

signal s_morse : std_logic_vector( 4 downto 0);
signal s_morseLenght : std_logic_vector( 2 downto 0);

begin

morseDecoder : process(letter)
    begin
        case letter is
            when "0000000" =>
                s_morse <= "00000"; -- 0
                s_morseLenght <="101";
--            when "0000001" =>
--                seg_o <= "1001111"; -- 1
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
                s_morse <= "01111"; -- 1
                s_morseLenght <="101";
        end case;
    end process morseDecoder;

    blinkdecoder : process(s_morseLenght)
    begin
        case s_morseLenght is
            when "101" =>
                
            when "100" =>
            
            when "011" =>
            
            when "010" =>
            
            when "001" =>
            when others =>
            
        end case;
    end process blinkdecoder;


end Behavioral;
