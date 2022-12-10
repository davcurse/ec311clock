`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2022 12:42:18 PM
// Design Name: 
// Module Name: internal_clock
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

// output 36 bit string that corresponds to 9 digits
// input would be a switch (toggling between edit and not edit)
// clock (1 Khz cock), reset(red one)
// up and down, left and right buttons

// outputs 12 and 24 hour clock times
// output am and pm

module internal_clock(clk, edit_sw, reset, clock12, clock24, millisecond, minute, second, hour12, hour24);

input clk, edit_sw, reset;
output reg [28:0] clock12, clock24;

output reg[9:0] millisecond;
output reg [5:0] minute, second;
output reg [6:0] hour12, hour24; 

//reg[9:0] millisecond;
//reg [5:0] minute, second;
//reg [4:0] hour12, hour24; // this is the bit size for the 24 hour clock cuz 32
wire khz_clock;

// Instantiate that jit
clock_divider clock1(.clock(clk), .reset(reset), .khz_out(khz_clock));

    always @ (posedge khz_clk or negedge reset) begin
    if(!reset) begin
        hour24 <= 0;
        hour12 <= 0;
        minute <= 0;
        second <= 0;
        millisecond <= 0;
        clock12 <= 0;
        clock24 <= 0;
    end else begin
        millisecond <= millisecond + 1'b1;
        if(millisecond == 10'b1111100111) begin
            millisecond <= 10'b0000000000;
            second <= second + 1'b1;
            if(second == 6'b111011) begin
                second <= 6'b000000;
                minute <= minute + 1'b1;
                if(minute == 6'b111011) begin
                    minute <= 6'b000000;
                    hour24 <= hour24 + 1'b1;
                    hour12 <= hour12 + 1'b1;
                    
                    if(hour24 == 5'b11000) begin // This is for the 24 hour clock
                        hour24 <= 5'b00000;
            //            minute = 6'b000000;
            //            second = 6'b000000;
            //            millisecond = 10'b0000000000;
                    end
                    
                    if(hour12 == 5'b01100) begin // This is for the 12 hour clock
                        hour12 <= 5'b00000;
            //            minute = 6'b000000;
            //            second = 6'b000000;
            //            millisecond = 10'b0000000000;
                    end        
                end
            end
        end



        

        
        clock24 = {hour24, minute, second, millisecond};
        clock12 = {hour12, minute, second, millisecond};
        
    end
        

end //always

endmodule
