///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2022 Xilinx, Inc.
// All Rights Reserved
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor     : Xilinx
// \   \   \/     Version    : 14.7
//  \   \         Application: Xilinx CORE Generator
//  /   /         Filename   : ila.v
// /___/   /\     Timestamp  : Fri Oct 28 04:16:20 UTC 2022
// \   \  /  \
//  \___\/\___\
//
// Design Name: Verilog Synthesis Wrapper
///////////////////////////////////////////////////////////////////////////////
// This wrapper is used to integrate with Project Navigator and PlanAhead

`timescale 1ns/1ps

module ila(
    CONTROL,
    CLK,
    TRIG0,
    TRIG1,
    TRIG2) /* synthesis syn_black_box syn_noprune=1 */;


inout [35 : 0] CONTROL;
input CLK;
input [7 : 0] TRIG0;
input [15 : 0] TRIG1;
input [12 : 0] TRIG2;

endmodule
