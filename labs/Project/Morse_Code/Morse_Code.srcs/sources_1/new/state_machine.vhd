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
           letter : out STD_LOGIC_VECTOR( 6 downto 0);
           send : out STD_LOGIC);
end state_machine;

architecture Behavioral of state_machine is

    type t_state is (IDLE,
                     BTNUP,
                     BTNENTER,
                     BTNDOWN);
                     
    signal s_state : t_state;
    
    signal s_en : std_logic;
    
    signal s_letter : std_logic_vector (6 downto 0) := "0000000";

begin

morse : process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then   -- Synchronous reset
                s_state <= IDLE;   -- Set initial state

            elsif (s_en = '1') then
                case s_state is
                
                    when IDLE =>
                        send <= '0';
                            
                        if (btn_up = '1') then
                            s_state <= BTNUP;
                        elsif (btn_dwn = '1') then
                            s_state <= BTNDOWN;
                        elsif ( btn_enter = '1') then
                            s_state <= BTNENTER;
                        else
                            s_state <= IDLE;
                        end if;
                        
                    when BTNUP =>
                         s_letter <= s_letter + 1;
                         s_state <= IDLE;
                         
                    when BTNDOWN =>
                         s_letter <= s_letter - 1;
                         s_state <= IDLE;
                         
                    when BTNENTER =>
                         send <= '1';
                         s_state <= IDLE;
                        
                    when others =>
                        s_state <= IDLE;
                        s_cnt   <= c_ZERO;
                end case;
            end if; -- Synchronous reset
        end if; -- Rising edge
    end process morse;


end Behavioral;
