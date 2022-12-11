`timescale 1ns / 1ps

module debouncer (
    input wire clk_i,
    input wire resetn_btn_i,
    input wire increment_counter_btn_i,
    output reg button_out
);

    reg deb_count_start;
    reg output_exist;
    reg [19:0] deb_count;
    always @ (posedge clk_i or negedge resetn_btn_i) begin
        if (!resetn_btn_i) begin
            button_out <= 0;
            deb_count_start <= 0;
            deb_count <= 0;
            output_exist <= 0;
        end else begin
            if (increment_counter_btn_i == 1) begin
                if (output_exist == 0) begin
                    if (deb_count_start == 0) begin
                        deb_count_start <= 1;
                        deb_count = deb_count + 1'b1;
                    end else
                        deb_count = deb_count + 1'b1;
                        if (deb_count == 1000000) begin
                            button_out <= 1;
                            deb_count_start <= 0;
                            deb_count <= 0;
                            output_exist <= 1;
                        end
                end else
                    button_out <= 0;
            end else begin
                deb_count_start <= 0;
                deb_count <= 0;
                output_exist <= 0;
            end
         end
     end
                        
endmodule
