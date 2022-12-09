`timescale 1ns / 1ps

module debouncer_tb();
    reg clk;
    reg resetn;
    reg button_in;
    
    wire button_out;
    wire [19:0] deb_count;
    
    debouncer db(clk,resetn,button_in,button_out,deb_count);
    
    initial
        begin
            clk = 1'b0;
            resetn = 1'b0;
            #100 resetn = 1'b1;
            button_in = 1'b0;
        end
        always begin
            #5 clk = ~clk;
        end
        always begin
            #500 button_in = 1;
            #500 button_in = 0;
            #500 button_in = 1;
            #500 button_in = 0;
            #500 button_in = 1;
            #500 button_in = 0;
            #500 button_in = 1;
            #500 button_in = 0;
            #500 button_in = 1;
            #500 button_in = 0;
            #500 button_in = 1;
            #500 button_in = 0;
            #500 button_in = 1;
            #15000000 button_in = 0;
            #100 $stop;
        end
    
endmodule