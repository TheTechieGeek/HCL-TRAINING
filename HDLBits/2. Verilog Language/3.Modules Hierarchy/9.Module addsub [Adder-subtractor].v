module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire [15:0] sum_1, sum_2;
    wire [31:0] out_xor;
    wire cout_1;

    // XOR for conditional inversion (add/sub control)
    assign out_xor = b ^ {32{sub}};

    // Lower 16 bits
    add16 add1(
        .a(a[15:0]),
        .b(out_xor[15:0]),
        .cin(sub),
        .sum(sum_1),
        .cout(cout_1)
    );

    // Upper 16 bits
    add16 add2(
        .a(a[31:16]),
        .b(out_xor[31:16]),
        .cin(cout_1),
        .sum(sum_2),
        .cout()
    );

    // Final result
    assign sum = {sum_2, sum_1};

endmodule
