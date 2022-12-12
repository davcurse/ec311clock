`timescale 1ns / 1ps

module stopwatch(
    input clk,
    input resetn,
    input toggle,
    output reg [28:0] num
// for testing __
//    output reg [6:0] hours,
//    output reg [5:0] minutes,
//    output reg [5:0] seconds,
//    output reg [9:0] ms
    );
    
    wire khz_clock;
    reg mode;
    reg [6:0] hours;
    reg [5:0] minutes;
    reg [5:0] seconds;
    reg [9:0] ms;
    clock_divider cd(clk, resetn, khz_clock);
    always @ (posedge clk) begin
        if (!resetn) begin
            mode <= 0;
        end else begin
            if (toggle) begin
                mode <= ~mode;
            end
        end
    end
    always @ (posedge khz_clock or negedge resetn) begin
        if (!resetn) begin
            num <= 0;
            hours <= 0;
            minutes <= 0;
            seconds <= 0;
            ms <= 0;
        end else begin
        num <= {hours,minutes,seconds,ms};
        if (mode) begin
            ms <= ms + 1;
            if (ms == 999) begin
                ms <= 0;
                seconds <= seconds + 1;
                if (seconds == 59) begin
                    seconds <= 0;
                    minutes <= minutes + 1;
                    if (minutes == 59) begin
                        minutes <= 0;
                        hours <= hours + 1;
                        if (hours == 99) begin
                            hours <= 0;
                            minutes <= 0;
                            seconds <= 0;
                            ms <= 0;
                        end
                    end
                end
            end
        end
        end
    end //always
               
endmodule
