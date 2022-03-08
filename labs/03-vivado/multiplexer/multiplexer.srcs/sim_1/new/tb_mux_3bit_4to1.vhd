----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2022 01:57:20 PM
-- Design Name: 
-- Module Name: tb_mux_3bit_4to1 - Behavioral
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

entity tb_mux_3bit_4to1 is
--  Port ( );
end tb_mux_3bit_4to1;

architecture Behavioral of tb_mux_3bit_4to1 is

signal a_s : std_logic_vector(2 downto 0);
signal b_s : std_logic_vector(2 downto 0);
signal c_s : std_logic_vector(2 downto 0);
signal d_s : std_logic_vector(2 downto 0);
signal sel_s : std_logic_vector(1 downto 0);
signal f_s : std_logic_vector(2 downto 0);

begin

uut_mux_3bit_4to1 : entity work.mux_3bit_4to1
port map(
    a_i => a_s,
    b_i => b_s,
    c_i => c_s,
    d_i => d_s,
    sel_i => sel_s,
    f_o => f_s
);

p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;

        a_s <= "001";
        b_s <= "010";
        c_s <= "011";
        d_s <= "100";
        
        sel_s <= "00";
        wait for 50 ns;
        
        sel_s <= "01";
        wait for 50 ns;
        
        sel_s <= "10";
        wait for 50 ns;
        
        sel_s <= "11";



        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait; -- Data generation process is suspended forever
    end process p_stimulus;
end Behavioral;
