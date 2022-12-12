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

module internal_clock(
input clk, 
input edit_sw, 
input reset, 
input up,
input down, 
input left, 
input right, 
output reg[28:0] clock12, clock24, 
output wire [1:0] editing
);

reg [9:0] millisecond;
reg [5:0] minute, second;
reg [6:0] hour12, hour24; 

wire [9:0] EDITmillisecond;
wire [5:0] EDITminute, EDITsecond;
wire [6:0] EDIThour12, EDIThour24; 


//reg[9:0] millisecond;
//reg [5:0] minute, second;
//reg [4:0] hour12, hour24; // this is the bit size for the 24 hour clock cuz 32
wire khz_clock;
wire [6:0] limit;
assign limit = 23;
// Instantiate the edit jit
edit edit1(.clk(clk), .en(edit_sw), .up(up), .down(down), .left(left), .right(right), .limit(limit), .time_in({hour24, minute, second, millisecond}), .time_out({EDIThour24, EDITminute, EDITsecond, EDITmillisecond}), .editing(editing));

// Instantiate that jit
clock_divider clock1(.clock(clk), .reset(reset), .khz_out(khz_clock));

always @ (posedge khz_clock or negedge reset) begin
    if(!reset) begin
        hour24 <= 0;
        hour12 <= 0;
        minute <= 0;
        second <= 0;
        millisecond <= 0;
        clock12 <= 0;
        clock24 <= 0;
    end else begin
    if(hour24 > 23) begin // This is for the 24 hour clock
        hour24 <= 5'b00000;
    end
    if(hour24 > 12) begin // This is for the 12 hour clock when 24 hour clock is at 12
        hour12 <= hour24 - 12;
    end else if (hour24 == 0) begin
        hour12 <= 12;
    end else begin
        hour12 <= hour24;
    end
    clock24 = {hour24, minute, second, millisecond};
    clock12 = {hour12, minute, second, millisecond};   
    if (edit_sw) begin
        {hour24, minute, second, millisecond} <= {EDIThour24, EDITminute, EDITsecond, EDITmillisecond}; 
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
                    end
                end
            end
        end
    end   
end //always

endmodule
