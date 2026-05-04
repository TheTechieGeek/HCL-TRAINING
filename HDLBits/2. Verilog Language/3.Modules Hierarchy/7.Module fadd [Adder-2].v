module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] sum_low, sum_high;
    wire carry_mid;

    // Lower 16-bit addition
    add16 lower (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),        // no carry-in
        .sum(sum_low),
        .cout(carry_mid)   // carry to upper block
    );

    // Upper 16-bit addition
    add16 upper (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(carry_mid),   // carry from lower block
        .sum(sum_high),
        .cout()            // ignored
    );

    // Final 32-bit result
    assign sum = {sum_high, sum_low};

endmodule

module add1 (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);

endmodule