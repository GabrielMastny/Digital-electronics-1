----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/28/2022 01:46:22 PM
-- Design Name: 
-- Module Name: state_machine_tb - Behavioral
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

entity blinker_tb is
--  Port ( );
end blinker_tb;

architecture Behavioral of blinker_tb is

          signal s_clk_100MHz : STD_LOGIC;
          signal s_reset : STD_LOGIC := '0';
          signal s_enable : STD_LOGIC := '0';
          signal s_letter : STD_LOGIC_VECTOR( 6 downto 0);
          signal s_finished : STD_LOGIC := '0';
          signal s_led : STD_LOGIC := '0';



begin

test : entity work.blinker
    port map
        (
           clockEnable => s_clk_100MHz,
           reset => s_reset,
           enable => s_enable,
           letter => s_letter,
           finished => s_finished,
           led => s_led
        );
        
         p_clk_gen : process
    begin
        while now < 10000 ns loop -- 10 usec of simulation
            s_clk_100MHz <= '0';
            wait for 10 ns;
            s_clk_100MHz <= '1';
            wait for 10 ns;
        end loop;
        wait;
    end process p_clk_gen;


    p_reset_gen : process
    begin
       
         s_enable <= '1';
        
        s_letter <= "0000011"; wait for 200 ns;
        s_letter <= "0010000"; wait for 200 ns;
        s_enable <= '1'; wait for 50 ns;
        s_reset <= '0'; wait for 200 ns;
        -- Reset activated
        s_reset <= '1'; wait for 500 ns;
        -- Reset deactivated
        s_reset <= '0';
        
        wait;
    end process p_reset_gen;

end Behavioral;
