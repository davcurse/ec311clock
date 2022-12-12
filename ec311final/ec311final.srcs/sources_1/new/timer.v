`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2022 12:42:55 PM
// Design Name: 
// Module Name: timer
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


module timer(
    input clk,
    input reset,
    input edit,
    input up,
    input down,
    input left,
    input right,
    output reg [28:0] mytime,
    output wire [1:0] editing
//    output reg [6:0] hours,
//    output reg [5:0] minutes, seconds,
//    output reg [9:0] milliseconds
    );
    reg [6:0] hours;
    reg [5:0] minutes, seconds;
    reg [9:0] milliseconds;
    wire kiHz;
    
    wire [9:0] EDITmillisecond;
    wire [5:0] EDITminute, EDITsecond;
    wire [6:0] EDIThours;
    wire [6:0] limit;
    assign limit = 99;
    clock_divider kHz(clk, reset, kiHz);
    edit editor(clk, edit, up, down, left, right, limit, {hours, minutes, seconds, milliseconds}, {EDIThours, EDITminute, EDITsecond, EDITmillisecond}, editing);
    always @ (posedge kiHz or negedge reset) begin
        if (!reset) begin
            mytime <= 0;
            hours <= 0;
            minutes <= 0;
            seconds <= 0;
            milliseconds <= 0;
        end else begin
        mytime = {hours, minutes, seconds, milliseconds};
        if (edit) begin
            {hours, minutes, seconds, milliseconds} <= {EDIThours, EDITminute, EDITsecond, EDITmillisecond};
        end else if ({hours, minutes, seconds, milliseconds} != 0) begin
            milliseconds <= milliseconds - 1;
            if (milliseconds == 0) begin
                milliseconds <= 999;
                seconds <= seconds - 1;
                if (seconds == 0) begin
                    seconds <= 59;
                    minutes <= minutes - 1;
                    if (minutes == 0) begin
                        minutes <= 59;
                        hours <= hours - 1;
                    end 
                end
            end
        end
        end
    end
endmodule
