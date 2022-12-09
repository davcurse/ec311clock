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
    input kHz,
    input reset,
    input edit,
    input up,
    input down,
    input left,
    input right,
    output reg [35:0] mytime
    );
    reg [3:0] editing;
    
    always @ (posedge clk or negedge reset) begin
        if (!reset) begin
            mytime <= 0;
            editing <= 0;
        end else begin
//            if (edit) begin 
//                if (right) editing <= editing + 1;
//                if (left) editing <= editing + 1;
//                editing = editing % 9;
//                if (up) 
//        editing stuff
        end
    end
endmodule
