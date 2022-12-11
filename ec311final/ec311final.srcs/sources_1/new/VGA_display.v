`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2022 08:07:38 PM
// Design Name: 
// Module Name: VGA_display
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module VGA_display(
    input wire CLK,             // board clock: 100 MHz on Arty/Basys3/Nexys
    input wire RST_BTN,
    input wire [7:0] random_num,
    input wire [7:0] hit,         
    output wire VGA_HS_O,       // horizontal sync output
    output wire VGA_VS_O,       // vertical sync output
    output wire [3:0] VGA_R,    // 4-bit VGA red output
    output wire [3:0] VGA_G,    // 4-bit VGA green output
    output wire [3:0] VGA_B     // 4-bit VGA blue output
    );

    wire rst = ~RST_BTN;
    
    reg [15:0] cnt;
    reg pix_stb;
    always @(posedge CLK)
        {pix_stb, cnt} <= cnt + 16'h4000;  // divide by 4: (2^16)/4 = 0x4000

    wire [9:0] x;  // current pixel x position: 10-bit value: 0-1023
    wire [8:0] y;  // current pixel y position:  9-bit value: 0-511
    
    vga640x480 display (
        .i_clk(CLK),
        .i_pix_stb(pix_stb),
        .i_rst(rst),
        .o_hs(VGA_HS_O), 
        .o_vs(VGA_VS_O), 
        .o_x(x), 
        .o_y(y)
    );
    wire h11,h12,h13,h14,h15,h16,h17,h21,h22,h23,h24,h25,h26,h27,m11,m12,m13,m14,m15,m16,m17,m21,m22,m23,m24,m25,m26,m27,s11,s12,s13,s14,s15,s16,s17,s21,s22,s23,s24,s25,s26,s27,ms11,ms12,ms13,ms14,ms15,ms16,ms17,ms21,ms22,ms23,ms24,ms25,ms26,ms27,ms31,ms32,ms33,ms34,ms35,ms36,ms37,c1,c2,c3,c4,c5,c6;
    
    reg clk_display;
    //hour 10s place digit
    assign h11 = ((x > 48) & (y > 198) & (x < 72) & (y < 216)) ? 1 : 0;
    assign h12 = ((x > 36) & (y > 210) & (x < 48) & (y < 234)) ? 1 : 0;
    assign h13 = ((x > 72) & (y > 210) & (x < 84) & (y < 234)) ? 1 : 0;
    assign h14 = ((x > 48) & (y > 234) & (x < 72) & (y < 246)) ? 1 : 0;
    assign h15 = ((x > 36) & (y > 246) & (x < 48) & (y < 270)) ? 1 : 0;
    assign h16 = ((x > 72) & (y > 246) & (x < 84) & (y < 270)) ? 1 : 0;
    assign h17 = ((x > 48) & (y > 270) & (x < 72) & (y < 282)) ? 1 : 0;
    //hour 1s place digit
    assign h21 = ((x > 108) & (y > 198) & (x < 132) & (y < 216)) ? 1 : 0;
    assign h22 = ((x > 96) & (y > 210) & (x < 108) & (y < 234)) ? 1 : 0;
    assign h23 = ((x > 132) & (y > 210) & (x < 144) & (y < 234)) ? 1 : 0;
    assign h24 = ((x > 108) & (y > 234) & (x < 132) & (y < 246)) ? 1 : 0;
    assign h25 = ((x > 96) & (y > 246) & (x < 108) & (y < 270)) ? 1 : 0;
    assign h26 = ((x > 132) & (y > 246) & (x < 144) & (y < 270)) ? 1 : 0;
    assign h27 = ((x > 108) & (y > 270) & (x < 132) & (y < 282)) ? 1 : 0;
    //colon between hours and minutes
    assign c1 = ((x > 156) & (y > 222) & (x < 168) & (y < 234)) ? 1 : 0;
    assign c2 = ((x > 156) & (y > 246) & (x < 168) & (y < 258)) ? 1 : 0;
    //minutes 10s place digit
    assign m11 = ((x > 192) & (y > 198) & (x < 216) & (y < 216)) ? 1 : 0;
    assign m12 = ((x > 180) & (y > 210) & (x < 192) & (y < 234)) ? 1 : 0;
    assign m13 = ((x > 216) & (y > 210) & (x < 228) & (y < 234)) ? 1 : 0;
    assign m14 = ((x > 192) & (y > 234) & (x < 216) & (y < 246)) ? 1 : 0;
    assign m15 = ((x > 180) & (y > 246) & (x < 192) & (y < 270)) ? 1 : 0;
    assign m16 = ((x > 216) & (y > 246) & (x < 228) & (y < 270)) ? 1 : 0;
    assign m17 = ((x > 192) & (y > 270) & (x < 216) & (y < 282)) ? 1 : 0;
    //minutes 1s place digit
    assign m21 = ((x > 252) & (y > 198) & (x < 276) & (y < 216)) ? 1 : 0;
    assign m22 = ((x > 240) & (y > 210) & (x < 252) & (y < 234)) ? 1 : 0;
    assign m23 = ((x > 276) & (y > 210) & (x < 288) & (y < 234)) ? 1 : 0;
    assign m24 = ((x > 252) & (y > 234) & (x < 276) & (y < 246)) ? 1 : 0;
    assign m25 = ((x > 240) & (y > 246) & (x < 252) & (y < 270)) ? 1 : 0;
    assign m26 = ((x > 276) & (y > 246) & (x < 288) & (y < 270)) ? 1 : 0;
    assign m27 = ((x > 252) & (y > 270) & (x < 276) & (y < 282)) ? 1 : 0;
    //colon between minutes and seconds
    assign c3 = ((x > 300) & (y > 222) & (x < 312) & (y < 234)) ? 1 : 0;
    assign c4 = ((x > 300) & (y > 246) & (x < 312) & (y < 258)) ? 1 : 0;
    //seconds 10s place digit
    assign m11 = ((x > 336) & (y > 198) & (x < 360) & (y < 216)) ? 1 : 0;
    assign m12 = ((x > 324) & (y > 210) & (x < 336) & (y < 234)) ? 1 : 0;
    assign m13 = ((x > 360) & (y > 210) & (x < 372) & (y < 234)) ? 1 : 0;
    assign m14 = ((x > 336) & (y > 234) & (x < 360) & (y < 246)) ? 1 : 0;
    assign m15 = ((x > 324) & (y > 246) & (x < 336) & (y < 270)) ? 1 : 0;
    assign m16 = ((x > 360) & (y > 246) & (x < 372) & (y < 270)) ? 1 : 0;
    assign m17 = ((x > 336) & (y > 270) & (x < 360) & (y < 282)) ? 1 : 0;
    //seconds 1s place digit
    assign m21 = ((x > 396) & (y > 198) & (x < 420) & (y < 216)) ? 1 : 0;
    assign m22 = ((x > 384) & (y > 210) & (x < 396) & (y < 234)) ? 1 : 0;
    assign m23 = ((x > 420) & (y > 210) & (x < 432) & (y < 234)) ? 1 : 0;
    assign m24 = ((x > 396) & (y > 234) & (x < 420) & (y < 246)) ? 1 : 0;
    assign m25 = ((x > 384) & (y > 246) & (x < 396) & (y < 270)) ? 1 : 0;
    assign m26 = ((x > 420) & (y > 246) & (x < 432) & (y < 270)) ? 1 : 0;
    assign m27 = ((x > 396) & (y > 270) & (x < 420) & (y < 282)) ? 1 : 0;
    //colon between seconds and milliseconds
    assign c5 = ((x > 444) & (y > 222) & (x < 456) & (y < 234)) ? 1 : 0;
    assign c6 = ((x > 444) & (y > 246) & (x < 456) & (y < 258)) ? 1 : 0;
    //milliseconds 100s place digit
    assign m11 = ((x > 480) & (y > 198) & (x < 504) & (y < 216)) ? 1 : 0;
    assign m12 = ((x > 468) & (y > 210) & (x < 480) & (y < 234)) ? 1 : 0;
    assign m13 = ((x > 504) & (y > 210) & (x < 516) & (y < 234)) ? 1 : 0;
    assign m14 = ((x > 480) & (y > 234) & (x < 504) & (y < 246)) ? 1 : 0;
    assign m15 = ((x > 468) & (y > 246) & (x < 480) & (y < 270)) ? 1 : 0;
    assign m16 = ((x > 504) & (y > 246) & (x < 516) & (y < 270)) ? 1 : 0;
    assign m17 = ((x > 480) & (y > 270) & (x < 504) & (y < 282)) ? 1 : 0;
    //milliseconds 10s place digit
    assign m21 = ((x > 540) & (y > 198) & (x < 564) & (y < 216)) ? 1 : 0;
    assign m22 = ((x > 528) & (y > 210) & (x < 540) & (y < 234)) ? 1 : 0;
    assign m23 = ((x > 564) & (y > 210) & (x < 576) & (y < 234)) ? 1 : 0;
    assign m24 = ((x > 540) & (y > 234) & (x < 564) & (y < 246)) ? 1 : 0;
    assign m25 = ((x > 528) & (y > 246) & (x < 540) & (y < 270)) ? 1 : 0;
    assign m26 = ((x > 564) & (y > 246) & (x < 576) & (y < 270)) ? 1 : 0;
    assign m27 = ((x > 540) & (y > 270) & (x < 564) & (y < 282)) ? 1 : 0;
    //milliseconds 1s place digit
    assign m21 = ((x > 600) & (y > 198) & (x < 624) & (y < 216)) ? 1 : 0;
    assign m22 = ((x > 588) & (y > 210) & (x < 600) & (y < 234)) ? 1 : 0;
    assign m23 = ((x > 624) & (y > 210) & (x < 636) & (y < 234)) ? 1 : 0;
    assign m24 = ((x > 600) & (y > 234) & (x < 624) & (y < 246)) ? 1 : 0;
    assign m25 = ((x > 588) & (y > 246) & (x < 600) & (y < 270)) ? 1 : 0;
    assign m26 = ((x > 624) & (y > 246) & (x < 636) & (y < 270)) ? 1 : 0;
    assign m27 = ((x > 600) & (y > 270) & (x < 624) & (y < 282)) ? 1 : 0;
endmodule
