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
           RESET : in STD_LOGIC;
           LED : out STD_LOGIC;
           BTNU : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           BTND : in STD_LOGIC;
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0)
           );
end top;

architecture Behavioral of top is

signal s_buttonUp : std_logic;
signal s_buttonC : std_logic;
signal s_buttonDWN : std_logic;
signal s_en : std_logic;
signal data : std_logic_vector (6 downto 0);
signal send : std_logic;

signal s_led :std_logic;
signal s_blinkerEnable : std_logic := '0';
signal s_finished : std_logic;

begin

LED <= s_led;

dbcU : entity work.debouncer
         generic map(
          pwm => 1
                    )
        port map(
            Clock => s_en,
            Reset => '0',
            button_in => BTNU,
            button_out => s_buttonUp
        );
        
dbcC : entity work.debouncer
    generic map(
          pwm => 1
                    )
        port map(
            Clock => s_en,
            Reset => '0',
            button_in => BTNC,
            button_out => s_buttonC
        );
        
dbcD : entity work.debouncer
generic map(
          pwm => 1
                    )
        port map(
            Clock => s_en,
            Reset => '0',
            button_in => BTND,
            button_out => s_buttonDWN
        );
        
        
clk_en0 : entity work.clock_enable
      generic map(
          g_MAX => 25000000
      )
      port map(
          clk   => CLK100MHZ,--- WRITE YOUR CODE HERE
          reset => RESET,--- WRITE YOUR CODE HERE
          ce_o  => s_en
      );
      
hex2seg : entity work.hex_7seg
        port map(
            hex_i    => data,
            seg_o(6) => CA,
            seg_o(5) => CB,
            seg_o(4) => CC,
            seg_o(3) => CD,
            seg_o(2) => CE,
            seg_o(1) => CF,
            seg_o(0) => CG
        );

    -- Connect one common anode to 3.3V
    AN <= b"1111_0111";

state : entity work.state_machine
port map(
           clk => CLK100MHZ,
           reset => RESET,
           btn_up => s_buttonUp,
           btn_dwn => s_buttonDWN,
           btn_enter => s_buttonC,
           enable => s_en,
           letter => data,
           finished => s_finished,
           send => send,
           blinkerEnable => s_blinkerEnable
        );
        
blink : entity work.blinker
port map(
           clockEnable => s_en,
           reset => RESET,
           letter => data,
           enable => s_blinkerEnable,
           finished => s_finished,
           led => s_led
        );

end Behavioral;
