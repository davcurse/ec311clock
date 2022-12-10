`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2022 07:20:38 PM
// Design Name: 
// Module Name: timer_TB
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


module timer_TB(
    );
reg clk, reset, edit, up, down, left, right;
wire [28:0] mytime;
wire [6:0] hours;
wire [5:0] minutes, seconds;
wire [9:0] milliseconds;

timer tm(clk, reset, edit, up, down, left, right, mytime, hours, minutes, seconds, milliseconds);

initial begin
    clk = 0;
    reset = 0;
    edit = 0;
    #50
    reset = 1;
    end
    always begin #5 clk = ~clk;
    end
endmodule
