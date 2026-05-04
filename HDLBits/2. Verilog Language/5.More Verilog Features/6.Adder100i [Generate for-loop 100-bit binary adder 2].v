module top_module( 
    input  [99:0] a, b,
    input  cin,
    output [99:0] cout,
    output [99:0] sum
);

    wire [100:0] carry;   // internal carry chain

    assign carry[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin : rca_block
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate

    // Map internal carries to output cout
    assign cout = carry[100:1];

endmodule

module full_adder (
    input a, b, cin,
    output sum, cout
);
    assign {cout, sum} = a + b + cin;
endmodule