`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2022 04:10:12 PM
// Design Name: 
// Module Name: splice
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


module splice(myTime, segs);

    input [28:0] myTime;
    output [62:0] segs;
    wire [9:0] millisecond;
    wire [5:0] minute, second;
    wire [6:0] hour;
    wire [15:0] msBCD, minBCD, secBCD, hrBCD;
    assign millisecond = myTime[9:0]; // ten bit
    assign second = myTime[15:10]; // six bit
    assign minute = myTime[21:16]; // six bit
    assign hour = myTime[28:22]; // seven bit  
    
    // instantiate converter 
    converter msCon(millisecond, msBCD);
    converter secCon(second, secBCD);
    converter minCon(minute, minBCD);
    converter hrCon(hour, hrBCD);
    
    // instantiate seven segs deconder
    seven_segment_decoder hr1(hrBCD[7:4], segs[62:56]);
    seven_segment_decoder hr2(hrBCD[3:0], segs[55:49]);
    
    seven_segment_decoder min1(minBCD[7:4], segs[48:42]);
    seven_segment_decoder min2(minBCD[3:0], segs[41:35]);
    
    seven_segment_decoder sec1(secBCD[7:4], segs[34:28]);
    seven_segment_decoder sec2(secBCD[3:0], segs[27:21]);
    
    seven_segment_decoder ms1(msBCD[11:8], segs[20:14]);
    seven_segment_decoder ms2(msBCD[7:4], segs[13:7]);
    seven_segment_decoder ms3(msBCD[3:0], segs[6:0]);
    
    
    
    // call on the converter module
    

endmodule
