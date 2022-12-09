`timescale 1ns / 1ps

module clock_divider_testbench();

    reg clock, reset;
    wire khz_out, hz_out;
    
    clock_divider CD(.clock(clock), .reset(reset), .khz_out(khz_out), .hz_out(hz_out));
    
    always begin
    #5 clock=~clock;
    end // always
    
    initial begin
        reset = 1;
        clock = 0;
        #10 reset = 0;
        #10 reset = 1;
    end
endmodule
