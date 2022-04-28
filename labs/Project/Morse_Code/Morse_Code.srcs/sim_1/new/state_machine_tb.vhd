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

entity state_machine_tb is
--  Port ( );
end state_machine_tb;

architecture Behavioral of state_machine_tb is

          signal s_clk_100MHz : STD_LOGIC;
          signal s_reset : STD_LOGIC := '0';
          signal s_btn_up : STD_LOGIC := '0';
          signal s_btn_dwn : STD_LOGIC:= '0';
          signal s_btn_enter : STD_LOGIC:= '0';
          signal s_enable : STD_LOGIC := '0';
          signal s_blinkerEnable : STD_LOGIC := '0';
          signal s_letter : STD_LOGIC_VECTOR( 6 downto 0);
          signal s_finished : STD_LOGIC := '0';



begin

test : entity work.state_machine
    port map
        (
            clk => s_clk_100MHz,
           reset => s_reset,
           btn_up => s_btn_up,
           btn_dwn => s_btn_dwn,
           btn_enter => s_btn_enter,
           enable => s_enable,
           blinkerEnable => s_blinkerEnable,
           letter => s_letter,
           finished => s_finished
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
        
        s_btn_up <= '1'; wait for 200 ns; 
        s_btn_up <= '0'; wait for 50 ns; 
        s_btn_dwn <= '1'; wait for 300 ns;
        s_btn_dwn <= '0'; wait for 50 ns;
        s_btn_enter <= '1'; wait for 200 ns;
        s_btn_enter <= '0'; wait for 50 ns;
        s_finished <= '1'; wait for 50 ns;
        s_reset <= '0'; wait for 200 ns;
        -- Reset activated
        s_reset <= '1'; wait for 500 ns;
        -- Reset deactivated
        s_reset <= '0';
        
        
        wait;
    end process p_reset_gen;

end Behavioral;
