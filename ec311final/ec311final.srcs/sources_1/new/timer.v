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
//    output reg [3:0] editing,
    output reg [6:0] hours,
    output reg [5:0] minutes, seconds,
    output reg [9:0] milliseconds
    );
//    reg [3:0] editing;
//    reg [6:0] hours;
//    reg [5:0] minutes, seconds;
//    reg [9:0] milliseconds;
    wire kiHz;
    clock_divider kHz(clk, reset, kiHz);
    always @ (posedge clk or negedge reset) begin
        if (!reset) begin
            mytime <= 0;
            hours <= 01;
            minutes <= 01;
            seconds <= 01;
            milliseconds <= 01;
//            editing <= 0;
        end else begin
            mytime <= {hours, minutes, seconds, milliseconds};
            end
    end
//    always @ (posedge kiHz) begin
    always @ (posedge clk) begin
       if (!edit && {hours, minutes, seconds, milliseconds} != 0) begin
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
endmodule
