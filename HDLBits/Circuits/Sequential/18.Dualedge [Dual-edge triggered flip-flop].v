module top_module (
    input clk,
    input d,
    output reg q
);
    
    // Flip-flop outputs in 'reg' sequential outputs
    reg out_ff_up;
    reg out_ff_low;
    
    // Mux outputs are pure combinational wires
    wire out_mux_up;
    wire out_mux_low;

    assign out_mux_up  = d ? ~out_ff_low : out_ff_low;
    
    assign out_mux_low = d ? ~out_ff_up  : out_ff_up;

    always @(posedge clk) begin
        out_ff_up <= out_mux_up;
    end
    
    always @(negedge clk) begin
        out_ff_low <= out_mux_low;
    end

    assign q = out_ff_up ^ out_ff_low;

endmodule