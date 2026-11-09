----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.10.2026 14:53:38
-- Design Name: 
-- Module Name: pwm_core - Behavioral
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
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pwm_core is
    generic (G_WIDTH : positive := 8);
    port (clk, rst_n, enable : in std_logic;
        duty : in unsigned(G_WIDTH-1 downto 0);
        pwm_out : out std_logic);

end pwm_core;

architecture rtl of pwm_core is
    signal cnt : unsigned(G_WIDTH-1 downto 0) := (others => '0');
begin
    process (clk) begin
        if rising_edge(clk) then
            if rst_n = '0' then
                cnt <= (others => '0'); pwm_out <= '0';
            else
                cnt <= cnt + 1;
                if enable = '1' and cnt < duty then
                    pwm_out <= '1';
                else
                    pwm_out <= '0';
                end if;
              end if;
            end if;
        end process;
end architecture;
