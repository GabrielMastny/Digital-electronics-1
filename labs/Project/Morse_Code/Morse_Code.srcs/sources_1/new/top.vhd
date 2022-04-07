----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2022 02:31:39 PM
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
           LED : out STD_LOGIC;
           BTNU : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           BTND : in STD_LOGIC);
end top;

architecture Behavioral of top is

signal s_buttonUp : std_logic;
signal s_buttonC : std_logic;
signal s_buttonDWN : std_logic;
signal s_en : std_logic;


begin

dbcU : entity work.debouncer
         generic map(
          pwm => 20
                    )
        port map(
            Clock <= CLK100MHZ,
            Reset <= '0',
            button_in <= BTNU,
            button_out <= s_buttonUp
        );
        
dbcC : entity work.debouncer
    generic map(
          pwm => 20
                    )
        port map(
            Clock <= CLK100MHZ,
            Reset <= '0',
            button_in <= BTNC,
            button_out <= s_buttonC
        );
        
dbcD : entity work.debouncer
generic map(
          pwm => 20
                    )
        port map(
            Clock <= CLK100MHZ,
            Reset <= '0',
            button_in <= BTND,
            button_out <= s_buttonDWN
        );
        
        
clk_en0 : entity work.clock_enable
      generic map(
          g_MAX => 25000000
      )
      port map(
          clk   => CLK100MHZ,--- WRITE YOUR CODE HERE
          reset => '0',--- WRITE YOUR CODE HERE
          ce_o  => s_en
      );




end Behavioral;
