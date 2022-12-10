`timescale 1ns / 1ps

module stopwatch_tb();

    reg clk;
    reg resetn;
    reg toggle;
    wire [28:0] num;
//    wire [6:0] hours;
//    wire [5:0] minutes;
//    wire [5:0] seconds;
//    wire [9:0] ms;
    
//    stopwatch sw(clk, resetn, toggle, num, hours, minutes, seconds, ms);
    stopwatch sw(clk, resetn, toggle, num);    
    
    initial
        begin
            clk = 1'b0;
            resetn = 1'b0;
            #50
            resetn = 1'b1;
            toggle = 1'b1;
            #10
            toggle = 1'b0;
        end
        always begin
            
            #5 clk = ~clk;
        end
                
endmodule
