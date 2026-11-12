----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.11.2026 16:18:45
-- Design Name: 
-- Module Name: rm_a - Behavioral
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

entity rm_a is
    port (
        clk  : in  std_logic;
        din  : in  std_logic_vector(15 downto 0);
        dout : out std_logic_vector(15 downto 0)
    );
end entity rm_a;

architecture rtl of rm_a is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            dout <= din;
        end if;
    end process;
end architecture rtl;
