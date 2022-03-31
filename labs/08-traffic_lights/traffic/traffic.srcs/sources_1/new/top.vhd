----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2022 01:43:02 PM
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port ( CLK100MHZ : in STD_LOGIC;
           LED16_R : out STD_LOGIC;
           LED16_G : out STD_LOGIC;
           LED16_B : out STD_LOGIC;
           LED17_R : out STD_LOGIC;
           LED17_G : out STD_LOGIC;
           LED17_B : out STD_LOGIC;
           SW1 : in STD_LOGIC;
           SW2 : STD_LOGIC;
           BTNC : in STD_LOGIC);
end top;

architecture Behavioral of top is

signal s_southLed  : std_logic_vector (2 downto 0);
signal s_westLed  : std_logic_vector (2 downto 0);

begin
    --------------------------------------------------------
    -- Instance (copy) of tlc entity
    tlc : entity work.tlc
        port map(
            clk   => CLK100MHZ,
            reset => BTNC,
            south_o => s_southLed,
            west_o => s_westLed,
            sensor1 => SW1,
            sensor2 => SW2
        );
        
    LED16_R <= s_southLed(2);
    LED16_G <= s_southLed(1);
    LED16_B <= s_southLed(0);
    LED17_R <= s_westLed(2);
    LED17_G <= s_westLed(1);
    LED17_B <= s_westLed(0);
end Behavioral;
