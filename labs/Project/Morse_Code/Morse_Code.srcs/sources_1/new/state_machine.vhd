----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2022 01:56:33 PM
-- Design Name: 
-- Module Name: state_machine - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity state_machine is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           btn_up : in STD_LOGIC;
           btn_dwn : in STD_LOGIC;
           btn_enter : in STD_LOGIC;
           enable : in STD_LOGIC;
           blinkerEnable : out STD_LOGIC;
           letter : out STD_LOGIC_VECTOR( 6 downto 0);
           send : out STD_LOGIC;
           finished : in STD_LOGIC;
           test2 : out STD_LOGIC);
end state_machine;

architecture Behavioral of state_machine is

    type t_state is (IDLE,
                     BTNUP,
                     BTNENTER,
                     BTNDOWN);
                     
    signal s_state : t_state;
    
    signal s_en : std_logic;
    
    signal s_blinkerEnable : std_logic;
    
    signal s_letter : unsigned(6 downto 0):= "0000000";

begin
s_en <= enable;
letter <= std_logic_vector(s_letter);

morse : process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then   -- Synchronous reset
                s_state <= IDLE;   -- Set initial state

            elsif (s_en = '1') then
                case s_state is
                
                    when IDLE =>
                        send <= '0';
                        test2 <= '0';    
                        if (btn_up = '1') then
                            s_state <= BTNUP;
                        elsif (btn_dwn = '1') then
                            s_state <= BTNDOWN;
                        elsif ( btn_enter = '1') then
                            blinkerEnable <= '1';
                            s_state <= BTNENTER;
                        else
                            s_state <= IDLE;
                        end if;
                        
                    when BTNUP =>
                         
                         s_state <= IDLE;
                         
                         
                         if (s_letter = "0100011") then
                            s_letter <= "0000000";
                        else
                            s_letter <= s_letter + 1;
                        end if;
                    when BTNDOWN =>
                         
                         s_state <= IDLE;
                         
                         if (s_letter = "0000000") then
                            s_letter <= "0100011";
                        else
                            s_letter <= s_letter - 1;
                        end if;
                         
                    when BTNENTER =>
                        test2 <= '1';
                        if ( finished = '1') then
                            blinkerEnable <= '0';
                            s_state <= IDLE;
                        end if;
                    
                        
                    when others =>
                        s_state <= IDLE;
                end case;
                
            else
            end if; -- Synchronous reset
        end if; -- Rising edge
    end process morse;


end Behavioral;
