//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
//Date        : Fri Nov  6 14:06:53 2026
//Host        : LAPTOP-C5OCR9QS running 64-bit major release  (build 9200)
//Command     : generate_target microblaze_wrapper.bd
//Design      : microblaze_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module microblaze_wrapper
   (an_tri_o,
    clk_100MHz,
    led_tri_o,
    pwm_b,
    pwm_g,
    pwm_r,
    reset_rtl_0,
    seg_tri_o,
    sw_tri_i,
    uart_rtl_0_rxd,
    uart_rtl_0_txd);
  output [7:0]an_tri_o;
  input clk_100MHz;
  output [15:0]led_tri_o;
  output pwm_b;
  output pwm_g;
  output pwm_r;
  input reset_rtl_0;
  output [7:0]seg_tri_o;
  input [15:0]sw_tri_i;
  input uart_rtl_0_rxd;
  output uart_rtl_0_txd;

  wire [7:0]an_tri_o;
  wire clk_100MHz;
  wire [15:0]led_tri_o;
  wire pwm_b;
  wire pwm_g;
  wire pwm_r;
  wire reset_rtl_0;
  wire [7:0]seg_tri_o;
  wire [15:0]sw_tri_i;
  wire uart_rtl_0_rxd;
  wire uart_rtl_0_txd;

  microblaze microblaze_i
       (.an_tri_o(an_tri_o),
        .clk_100MHz(clk_100MHz),
        .led_tri_o(led_tri_o),
        .pwm_b(pwm_b),
        .pwm_g(pwm_g),
        .pwm_r(pwm_r),
        .reset_rtl_0(reset_rtl_0),
        .seg_tri_o(seg_tri_o),
        .sw_tri_i(sw_tri_i),
        .uart_rtl_0_rxd(uart_rtl_0_rxd),
        .uart_rtl_0_txd(uart_rtl_0_txd));
endmodule
