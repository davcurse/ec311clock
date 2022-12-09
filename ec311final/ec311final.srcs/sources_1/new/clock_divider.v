`timescale 1ns / 1ps

module clock_divider(
    input clock, reset,
    output reg khz_out, hz_out
    );
    
    reg [31:0] khz_count = 32'b0, hz_count = 32'b0;
    
    parameter khz_divider = 50000;
    parameter hz_divider = 50000000;
    
    initial begin
        khz_out = 1'b0;
        hz_out = 1'b0;
    end
    always @ (posedge clock or negedge reset) begin
        if(!reset)begin
            khz_count <= 32'b0;
            hz_count <= 32'b0;
            khz_out <= 1'b0;
            hz_out <= 1'b0;
         end else begin
            if(khz_count < khz_divider-1) begin
                khz_count <= 32'b0;
                khz_out <=~khz_out;
            end else begin
                khz_count <= khz_count+1;
                khz_out <= khz_out;
            end
            if(hz_count == hz_divider-1) begin
                hz_count <= 32'b0;
                hz_out <=~hz_out;
            end else begin
                hz_count <= hz_count+1;
                hz_out <= hz_out;
            end            
         end
    end // always
endmodule
