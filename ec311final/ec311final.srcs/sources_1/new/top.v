`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2022 09:37:18 AM
// Design Name: 
// Module Name: top
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


module top(
    input UP,
    input DOWN,
    input LEFT,
    input RIGHT,
    input TOGGLE,
    input RST_BTN,
    input CLK,
    input EDIT,
    input [1:0] SELECT,
    output wire VGA_HS_O,       // horizontal sync output
    output wire VGA_VS_O,       // vertical sync output
    output wire [3:0] VGA_R,    // 4-bit VGA red output
    output wire [3:0] VGA_G,    // 4-bit VGA green output
    output wire [3:0] VGA_B     // 4-bit VGA blue output
    );
    wire kHz_out;
    wire UP_db;
    wire DOWN_db;
    wire LEFT_db;
    wire RIGHT_db;
    wire TOGGLE_db;
    reg internal_RST;
    reg timer_RST;
    reg stopwatch_RST;
    reg [28:0] out_twelve;
    reg [28:0] out_twentyfour;
    reg [28:0] out_timer;
    reg [28:0] out_stopwatch;
    reg [28:0] myTime;
    reg [62:0] SEGMENTS;
    clock_divider kHZ(CLK, RST_BTN, kHz_out);
    debouncer UPdb(CLK, RST_BTN, UP, UP_db);
    debouncer DOWNdb(CLK, RST_BTN, DOWN, DOWN_db);
    debouncer LEFTdb(CLK, RST_BTN, LEFT, LEFT_db);
    debouncer RIGHTdb(CLK, RST_BTN, RIGHT, RIGHT_db);
    debouncer TOGGLEdb(CLK, RST_BTN, TOGGLE, TOGGLE_db);
    always @ (*) begin
        internal_RST = (((SELECT == 2'b00) | (SELECT == 2'b01)) ? RST_BTN : 1'b1);
        timer_RST = (SELECT == 2'b10) ? RST_BTN : 1'b1;
        stopwatch_RST = (SELECT == 2'b11) ? RST_BTN : 1'b1;
    end
    internal_clock internal(CLK, EDIT, UP_db, DOWN_db, LEFT_db, RIGHT_db, internal_RST, out_twelve, out_twentyfour);
    timer timer(CLK, timer_RST, EDIT, UP_db, DOWN_db, LEFT_db, RIGHT_db, out_timer, );
    stopwatch stopwatch(CLK, stopwatch_RST, TOGGLE_db, out_stopwatch);
    always @ (*) begin
        case (SELECT)
            2'b00: myTime = out_twelve;
            2'b01: myTime = out_twentyfour;
            2'b10: myTime = out_timer;
            2'b11: myTime = out_stopwatch;
        endcase
    end
    splice port(myTime, SEGMENTS);
    VGA_display display(CLK, RST_BTN, SEGMENTS, VGA_HS_O, VGA_VS_O, VGA_R, VGA_G, VGA_B);
endmodule
