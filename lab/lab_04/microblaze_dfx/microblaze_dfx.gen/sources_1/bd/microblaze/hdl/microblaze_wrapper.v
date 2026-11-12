//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
//Date        : Thu Nov 12 17:14:26 2026
//Host        : LAPTOP-C5OCR9QS running 64-bit major release  (build 9200)
//Command     : generate_target microblaze_wrapper.bd
//Design      : microblaze_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module microblaze_wrapper
   (clk_100MHz,
    reset_rtl_0,
    rm_clk,
    rm_din_tri_o,
    rm_dout_tri_i,
    uart_rtl_0_rxd,
    uart_rtl_0_txd);
  input clk_100MHz;
  input reset_rtl_0;
  output rm_clk;
  output [15:0]rm_din_tri_o;
  input [15:0]rm_dout_tri_i;
  input uart_rtl_0_rxd;
  output uart_rtl_0_txd;

  wire clk_100MHz;
  wire reset_rtl_0;
  wire rm_clk;
  wire [15:0]rm_din_tri_o;
  wire [15:0]rm_dout_tri_i;
  wire uart_rtl_0_rxd;
  wire uart_rtl_0_txd;

  microblaze microblaze_i
       (.clk_100MHz(clk_100MHz),
        .reset_rtl_0(reset_rtl_0),
        .rm_clk(rm_clk),
        .rm_din_tri_o(rm_din_tri_o),
        .rm_dout_tri_i(rm_dout_tri_i),
        .uart_rtl_0_rxd(uart_rtl_0_rxd),
        .uart_rtl_0_txd(uart_rtl_0_txd));
endmodule
