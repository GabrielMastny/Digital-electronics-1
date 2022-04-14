library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity debouncer is
    generic(
        pwm : natural := 1  
        );  -- Note that there IS a semicolon between generic 
    port(   Clock : in std_logic;
            Reset : in std_logic;
            button_in : in std_logic;
            button_out : out std_logic
        );
end debouncer;

architecture behav of debouncer is

signal count : integer := 0;
type state_type is (idle,wait_time); --state machine
signal state : state_type := idle;

begin
  
process(Reset,Clock)
begin
    if(Reset = '1') then
        state <= idle;
        button_out <= '0';
   elsif(rising_edge(Clock)) then
        case (state) is
            when idle =>
                if(button_in = '1') then  
                    state <= wait_time;
                else
                    state <= idle; --wait until button is pressed.
                end if;
                button_out <= '0';
            when wait_time =>
                if(count = pwm) then
                    count <= 0;
                    if(button_in = '1') then
                        button_out <= '1';
                    end if;
                    state <= idle;  
                else
                    count <= count + 1;
                end if; 
        end case;       
    end if;        
end process;                  
                                                                                
end architecture behav;