----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.11.2026 16:12:26
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

entity top is
    port (
        CLK100MHZ    : in  std_logic;
        CPU_RESETN   : in  std_logic;
        UART_TXD_IN  : in  std_logic;
        UART_RXD_OUT : out std_logic;
        LED          : out std_logic_vector(15 downto 0)
    );
end entity top;

architecture rtl of top is

    -- Signals connecting the static system to the reconfigurable module
    signal rm_clk : std_logic;
    signal din    : std_logic_vector(15 downto 0);
    signal dout   : std_logic_vector(15 downto 0);

    -- MicroBlaze system wrapper
    component microblaze_wrapper is
        port (
            clk_100MHz     : in  std_logic;
            reset_rtl_0    : in  std_logic;
            rm_clk         : out std_logic;
            rm_din_tri_o   : out std_logic_vector(15 downto 0);
            rm_dout_tri_i  : in  std_logic_vector(15 downto 0);
            uart_rtl_0_rxd : in  std_logic;
            uart_rtl_0_txd : out std_logic
        );
    end component;

    -- Reconfigurable module A
    component rm_a is
        port (
            clk  : in  std_logic;
            din  : in  std_logic_vector(15 downto 0);
            dout : out std_logic_vector(15 downto 0)
        );
    end component;

begin

    -----------------------------------------------------------
    -- Static region: MicroBlaze system
    -----------------------------------------------------------
    u_sys : microblaze_wrapper
        port map (
            clk_100MHz     => CLK100MHZ,
            reset_rtl_0    => CPU_RESETN,
            rm_clk         => rm_clk,
            rm_din_tri_o   => din,
            rm_dout_tri_i  => dout,
            uart_rtl_0_rxd => UART_TXD_IN,
            uart_rtl_0_txd => UART_RXD_OUT
        );

    -----------------------------------------------------------
    -- Reconfigurable partition: Module A
    -----------------------------------------------------------
    u_rm : rm_a
        port map (
            clk  => rm_clk,
            din  => din,
            dout => dout
        );

    -----------------------------------------------------------
    -- Connect module output to the 16 board LEDs
    -----------------------------------------------------------
    LED <= dout;

end architecture rtl;
