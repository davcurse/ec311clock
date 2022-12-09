`timescale 1ns / 1ps

module clock_divider(
    input clock, reset,
    output reg khz_out
    );
    
    reg [31:0] khz_count = 32'b0, hz_count = 32'b0;
    
    parameter khz_divider = 100000;
//    parameter hz_divider = 50000000;
    
    initial begin
        khz_out = 1'b0;
//        hz_out = 1'b0;
    end
    always @ (posedge clock or negedge reset) begin
        if(!reset)begin
            khz_out <= 1'b0;
//            hz_out <= 1'b0;
         end else begin
            khz_count <= khz_count + 1;
            if(khz_count >= khz_divider-1)
                khz_count <= 32'b0;
            else
                khz_out <= (khz_count<32'd100000/2)?1'b1:1'b0;
            end
//            if(hz_count == hz_divider-1) begin
//                hz_count <= 32'b0;
//                hz_out <=~hz_out;
//            end else begin
//                hz_count <= hz_count+1;
//                hz_out <= hz_out;
//            end            
    end //always
endmodule
