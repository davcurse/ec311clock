`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2022 03:27:43 PM
// Design Name: 
// Module Name: converter
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


module converter(bin, bcd);
    input [9:0] bin;
    output [15:0] bcd;
    
    reg [15:0] bcd;
    reg [4:0] i;

     always @(bin)
        begin
            bcd = 0; 
            for (i = 0; i < 10; i = i+1) 
            begin
                bcd = {bcd[14:0],bin[9-i]};
                if(i < 9 && bcd[3:0] > 4) 
                    bcd[3:0] = bcd[3:0] + 3;
                if(i < 9 && bcd[7:4] > 4)
                    bcd[7:4] = bcd[7:4] + 3;
                if(i < 9 && bcd[11:8] > 4)
                    bcd[11:8] = bcd[11:8] + 3;
                if(i < 9 && bcd[15:12] > 4)
                    bcd[15:12] = bcd[15:12] + 3;
            end
        end     
                
endmodule    
    
    
//    wire [9:0] millisecond;
//    wire [5:0] minute, second;
//    wire [6:0] hour;
    
//    // Spliced the jits into their respective categories
//    assign millisecond = myTime[9:0];
//    assign second = myTime[15:10];
//    assign minute = myTime[21:16];
//    assign hour = myTime[28:22];
    
//    // Millisecond conversion??
//    wire[4:0] hundredPlace;
//    wire[4:0] tenPlace;
//    wire[4:0] onePlace;
//    assign hundredPlace = millisecond / 100; //hopefully this is integer division
//    assign tenPlace = (millisecond % 100) / 10;
//    assign onePlace = millisecond % 10;
    
    
//    // Second conversion??
//    wire[4:0] tenPlaceS;
//    wire[4:0] onePlaceS;
//    assign tenPlaceS = second / 10;
//    assign onePlaceS = second % 10;
    
//    // minute conversion??
//    wire[4:0] tenPlaceM;
//    wire[4:0] onePlaceM;
//    assign tenPlaceM = second / 10;
//    assign onePlaceM = second % 10;
