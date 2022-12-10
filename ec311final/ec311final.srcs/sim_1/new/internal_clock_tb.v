`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2022 06:58:45 PM
// Design Name: 
// Module Name: internal_clock_tb
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


module internal_clock_tb();
    // Input
    reg clk, edit_sw, reset;
    // Output
    wire [28:0] clock12, clock24;
    wire [9:0]millisecond;
    wire [5:0] minute, second;
    wire [4:0] hour12, hour24;
    
    internal_clock jit(.clk(clk), .edit_sw(edit_sw), .reset(reset), .clock12(clock12), .clock24(clock24), .millisecond(millisecond), .minute(minute), .second(second), .hour12(hour12), .hour24(hour24));
    
    initial begin
        clk = 0;
        edit_sw = 0;
    end
    
    always begin
    #5 clk =~ clk;
    end
    
    initial begin
        reset = 0; #50
        reset = 1;
    end

endmodule
