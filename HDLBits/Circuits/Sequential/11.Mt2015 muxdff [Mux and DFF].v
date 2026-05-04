module top_module (
    input clk,
    input L,
    input r_in,
    input q_in,
    output reg Q
);

    wire d;
    // 2:1 MUX
    // 0 → q_in (feedback)
    // 1 → r_in (load)
    assign d = (L) ? r_in : q_in;

    // D Flip-Flop (posedge triggered)
    always @(posedge clk) begin
        Q <= d;
    end

endmodule