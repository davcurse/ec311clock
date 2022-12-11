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
    input wire [62:0] segments,
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
    
    reg segs;
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
    assign s11 = ((x > 336) & (y > 198) & (x < 360) & (y < 216)) ? 1 : 0;
    assign s12 = ((x > 324) & (y > 210) & (x < 336) & (y < 234)) ? 1 : 0;
    assign s13 = ((x > 360) & (y > 210) & (x < 372) & (y < 234)) ? 1 : 0;
    assign s14 = ((x > 336) & (y > 234) & (x < 360) & (y < 246)) ? 1 : 0;
    assign s15 = ((x > 324) & (y > 246) & (x < 336) & (y < 270)) ? 1 : 0;
    assign s16 = ((x > 360) & (y > 246) & (x < 372) & (y < 270)) ? 1 : 0;
    assign s17 = ((x > 336) & (y > 270) & (x < 360) & (y < 282)) ? 1 : 0;
    //seconds 1s place digit
    assign s21 = ((x > 396) & (y > 198) & (x < 420) & (y < 216)) ? 1 : 0;
    assign s22 = ((x > 384) & (y > 210) & (x < 396) & (y < 234)) ? 1 : 0;
    assign s23 = ((x > 420) & (y > 210) & (x < 432) & (y < 234)) ? 1 : 0;
    assign s24 = ((x > 396) & (y > 234) & (x < 420) & (y < 246)) ? 1 : 0;
    assign s25 = ((x > 384) & (y > 246) & (x < 396) & (y < 270)) ? 1 : 0;
    assign s26 = ((x > 420) & (y > 246) & (x < 432) & (y < 270)) ? 1 : 0;
    assign s27 = ((x > 396) & (y > 270) & (x < 420) & (y < 282)) ? 1 : 0;
    //colon between seconds and milliseconds
    assign c5 = ((x > 444) & (y > 222) & (x < 456) & (y < 234)) ? 1 : 0;
    assign c6 = ((x > 444) & (y > 246) & (x < 456) & (y < 258)) ? 1 : 0;
    //milliseconds 100s place digit
    assign ms11 = ((x > 480) & (y > 198) & (x < 504) & (y < 216)) ? 1 : 0;
    assign ms12 = ((x > 468) & (y > 210) & (x < 480) & (y < 234)) ? 1 : 0;
    assign ms13 = ((x > 504) & (y > 210) & (x < 516) & (y < 234)) ? 1 : 0;
    assign ms14 = ((x > 480) & (y > 234) & (x < 504) & (y < 246)) ? 1 : 0;
    assign ms15 = ((x > 468) & (y > 246) & (x < 480) & (y < 270)) ? 1 : 0;
    assign ms16 = ((x > 504) & (y > 246) & (x < 516) & (y < 270)) ? 1 : 0;
    assign ms17 = ((x > 480) & (y > 270) & (x < 504) & (y < 282)) ? 1 : 0;
    //milliseconds 10s place digit
    assign ms21 = ((x > 540) & (y > 198) & (x < 564) & (y < 216)) ? 1 : 0;
    assign ms22 = ((x > 528) & (y > 210) & (x < 540) & (y < 234)) ? 1 : 0;
    assign ms23 = ((x > 564) & (y > 210) & (x < 576) & (y < 234)) ? 1 : 0;
    assign ms24 = ((x > 540) & (y > 234) & (x < 564) & (y < 246)) ? 1 : 0;
    assign ms25 = ((x > 528) & (y > 246) & (x < 540) & (y < 270)) ? 1 : 0;
    assign ms26 = ((x > 564) & (y > 246) & (x < 576) & (y < 270)) ? 1 : 0;
    assign ms27 = ((x > 540) & (y > 270) & (x < 564) & (y < 282)) ? 1 : 0;
    //milliseconds 1s place digit
    assign ms31 = ((x > 600) & (y > 198) & (x < 624) & (y < 216)) ? 1 : 0;
    assign ms32 = ((x > 588) & (y > 210) & (x < 600) & (y < 234)) ? 1 : 0;
    assign ms33 = ((x > 624) & (y > 210) & (x < 636) & (y < 234)) ? 1 : 0;
    assign ms34 = ((x > 600) & (y > 234) & (x < 624) & (y < 246)) ? 1 : 0;
    assign ms35 = ((x > 588) & (y > 246) & (x < 600) & (y < 270)) ? 1 : 0;
    assign ms36 = ((x > 624) & (y > 246) & (x < 636) & (y < 270)) ? 1 : 0;
    assign ms37 = ((x > 600) & (y > 270) & (x < 624) & (y < 282)) ? 1 : 0;
    
    assign VGA_R[3] = segs;
    
    always @ (*) begin
        segs = 0;
        if (h11) begin
            segs = segs + segments[62];
        end else if (h12) begin
            segs = segs + segments[61];
        end else if (h13) begin
            segs = segs + segments[60];
        end else if (h14) begin
            segs = segs + segments[59];
        end else if (h15) begin
            segs = segs + segments[58];
        end else if (h16) begin
            segs = segs + segments[57];
        end else if (h17) begin
            segs = segs + segments[56];
        end else if (h21) begin
            segs = segs + segments[55];
        end else if (h22) begin
            segs = segs + segments[54];
        end else if (h23) begin
            segs = segs + segments[53];
        end else if (h24) begin
            segs = segs + segments[52];
        end else if (h25) begin
            segs = segs + segments[51];
        end else if (h26) begin
            segs = segs + segments[50];
        end else if (h27) begin
            segs = segs + segments[49];
        end else if (m11) begin
            segs = segs + segments[48];
        end else if (m12) begin
            segs = segs + segments[47];
        end else if (m13) begin
            segs = segs + segments[46];
        end else if (m14) begin
            segs = segs + segments[45];
        end else if (m15) begin
            segs = segs + segments[44];
        end else if (m16) begin
            segs = segs + segments[43];
        end else if (m17) begin
            segs = segs + segments[42];
        end else if (m21) begin
            segs = segs + segments[41];
        end else if (m22) begin
            segs = segs + segments[40];
        end else if (m23) begin
            segs = segs + segments[39];
        end else if (m24) begin
            segs = segs + segments[38];
        end else if (m25) begin
            segs = segs + segments[37];
        end else if (m26) begin
            segs = segs + segments[36];
        end else if (m27) begin
            segs = segs + segments[35];
        end else if (s11) begin
            segs = segs + segments[34];
        end else if (s12) begin
            segs = segs + segments[33];
        end else if (s13) begin
            segs = segs + segments[32];
        end else if (s14) begin
            segs = segs + segments[31];
        end else if (s15) begin
            segs = segs + segments[30];
        end else if (s16) begin
            segs = segs + segments[29];
        end else if (s17) begin
            segs = segs + segments[28];
        end else if (s21) begin
            segs = segs + segments[27];
        end else if (s22) begin
            segs = segs + segments[26];
        end else if (s23) begin
            segs = segs + segments[25];
        end else if (s24) begin
            segs = segs + segments[24];
        end else if (s25) begin
            segs = segs + segments[23];
        end else if (s26) begin
            segs = segs + segments[22];
        end else if (s27) begin
            segs = segs + segments[21];
        end else if (ms11) begin
            segs = segs + segments[20];
        end else if (ms12) begin
            segs = segs + segments[19];
        end else if (ms13) begin
            segs = segs + segments[18];
        end else if (ms14) begin
            segs = segs + segments[17];
        end else if (ms15) begin
            segs = segs + segments[16];
        end else if (ms16) begin
            segs = segs + segments[15];
        end else if (ms17) begin
            segs = segs + segments[14];
        end else if (ms21) begin
            segs = segs + segments[13];
        end else if (ms22) begin
            segs = segs + segments[12];
        end else if (ms23) begin
            segs = segs + segments[11];
        end else if (ms24) begin
            segs = segs + segments[10];
        end else if (ms25) begin
            segs = segs + segments[9];
        end else if (ms26) begin
            segs = segs + segments[8];
        end else if (ms27) begin
            segs = segs + segments[7];
        end else if (ms31) begin
            segs = segs + segments[6];
        end else if (ms32) begin
            segs = segs + segments[5];
        end else if (ms33) begin
            segs = segs + segments[4];
        end else if (ms34) begin
            segs = segs + segments[3];
        end else if (ms35) begin
            segs = segs + segments[2];
        end else if (ms36) begin
            segs = segs + segments[1];
        end else if (ms37) begin
            segs = segs + segments[0];
        end else if (c1 | c2 | c3 | c4 | c5 | c6) begin
            segs = 1;
        end
    end
endmodule
