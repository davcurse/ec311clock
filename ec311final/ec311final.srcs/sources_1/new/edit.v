`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2022 08:08:35 AM
// Design Name: 
// Module Name: edit
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


module edit(
    input clk,
    input en,
    input up,
    input down,
    input left,
    input right,
    input [6:0] limit,
    input [28:0] time_in,
    output reg [28:0] time_out,
    output reg [1:0] editing
    );
    always @ (posedge clk) begin
        if (!en) begin
            editing <= 0;
            time_out <= time_in;
        end else begin
            if (right) begin
                editing <= ((editing + 3) + 1) % 3;
            end
            if (left) begin
                editing <= ((editing + 3) - 1) % 3;
            end
            if (up) begin
                case (editing)
                    2'b00: begin
                        time_out[28:22] <= time_out[28:22] + 1;
                        if (time_out[28:22] == limit) begin
                            time_out[28:22] <= 0;
                        end
                    end
                    2'b01: begin
                        time_out[21:16] <= time_out[21:16] + 1;
                        if (time_out[21:16] == 59) begin
                            time_out[21:16] <= 0;
                        end
                    end
                    2'b10: begin
                        time_out[15:10] <= time_out[15:10] + 1;
                        if (time_out[15:10] == 59) begin
                            time_out[15:10] <= 0;
                        end
                    end
                endcase
            end
            if (down) begin
                case (editing)
                    2'b00: begin
                        time_out[28:22] <= time_out[28:22] - 1;
                        if (time_out[28:22] == 0) begin
                            time_out[28:22] <= limit;
                        end
                    end
                    2'b01: begin
                        time_out[21:16] <= time_out[21:16] - 1;
                        if (time_out[21:16] == 0) begin
                            time_out[21:16] <= 59;
                        end
                    end
                    2'b10: begin
                        time_out[15:10] <= time_out[15:10] - 1;
                        if (time_out[15:10] == 0) begin
                            time_out[15:10] <= 59;
                        end
                    end
                endcase
            end
        end
    end
endmodule
