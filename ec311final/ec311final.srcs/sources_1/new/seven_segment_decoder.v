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
        4'b0000: sevenBit_out <= 7'b0000001; // one to one mapping of input to output
        4'b0001: sevenBit_out <= 7'b1001111;
        4'b0010: sevenBit_out <= 7'b0010010;
        4'b0011: sevenBit_out <= 7'b0000110;
        4'b0100: sevenBit_out <= 7'b1001100;
        4'b0101: sevenBit_out <= 7'b0100100;
        4'b0110: sevenBit_out <= 7'b0100000;
        4'b0111: sevenBit_out <= 7'b0001111;
        4'b1000: sevenBit_out <= 7'b0000000;
        4'b1001: sevenBit_out <= 7'b0000100;
        4'b1010: sevenBit_out <= 7'b0001000;
        4'b1011: sevenBit_out <= 7'b1100000;
        4'b1100: sevenBit_out <= 7'b0110001;
        4'b1101: sevenBit_out <= 7'b1000010;
        4'b1110: sevenBit_out <= 7'b0110000;
        4'b1111: sevenBit_out <= 7'b0111000;
        endcase
     end //always
endmodule
