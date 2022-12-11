`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2022 12:44:05 PM
// Design Name: 
// Module Name: seven_segment_decoder
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


module seven_segment_decoder(
    input [3:0] fourBit_in,
    output reg [6:0] sevenBit_out
    );
    
    always@(*)begin
    case(fourBit_in)
        4'b0000: sevenBit_out <= 7'b1110111; // one to one mapping of input to output
        4'b0001: sevenBit_out <= 7'b0010010;
        4'b0010: sevenBit_out <= 7'b1011101;
        4'b0011: sevenBit_out <= 7'b1011011;
        4'b0100: sevenBit_out <= 7'b0111010;
        4'b0101: sevenBit_out <= 7'b1101011;
        4'b0110: sevenBit_out <= 7'b1101111;
        4'b0111: sevenBit_out <= 7'b1010010;
        4'b1000: sevenBit_out <= 7'b1111111;
        4'b1001: sevenBit_out <= 7'b1111010;
//        4'b1010: sevenBit_out <= 7'b; // don't need
//        4'b1011: sevenBit_out <= 7'b;
//        4'b1100: sevenBit_out <= 7'b;
//        4'b1101: sevenBit_out <= 7'b;
//        4'b1110: sevenBit_out <= 7'b;
//        4'b1111: sevenBit_out <= 7'b;
        endcase
     end //always
endmodule
