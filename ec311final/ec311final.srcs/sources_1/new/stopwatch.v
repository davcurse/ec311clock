`timescale 1ns / 1ps

module stopwatch(
    input clk,
    input resetn,
    input toggle,
    output reg [35:0] num,
    output reg khz_clock
    );
    
    clock_divider cd(clk, resetn, khz_clock);
    reg mode;
    
    always @ (posedge clk or negedge resetn) begin
        if (!resetn) begin
            num <= 0;
            mode <= 0;
        end else begin
            if (toggle)
                mode <= ~mode;
        end
    end //always
    
    always @ (posedge khz_clock or negedge resetn) begin
        if (mode == 1) begin
            if (num[3:0] == 9) begin
                
                
            
    
    
    
endmodule
