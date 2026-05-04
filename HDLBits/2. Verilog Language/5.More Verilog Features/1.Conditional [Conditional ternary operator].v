module top_module (
    input  [7:0] a, b, c, d,   // unsigned inputs
    output [7:0] min
);

    wire [7:0] m1, m2;

    // First level comparisons
    assign m1 = (a < b) ? a : b;
    assign m2 = (c < d) ? c : d;

    // Final comparison
    assign min = (m1 < m2) ? m1 : m2;

endmodule