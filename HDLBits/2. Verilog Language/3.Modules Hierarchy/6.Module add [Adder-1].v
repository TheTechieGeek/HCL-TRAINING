module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] sum_1, sum_2;
    wire cout_1;

    // Lower 16 bits
    add16 add1 (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum_1),
        .cout(cout_1)
    );

    // Upper 16 bits
    add16 add2 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(cout_1),
        .sum(sum_2),
        .cout()   // ignored
    );

    assign sum = {sum_2, sum_1};

endmodule