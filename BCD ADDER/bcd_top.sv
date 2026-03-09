`timescale 1ns / 1ps
`include "BCD_digit.sv"

module bcd_adder #(
    parameter N = 12      // Must be multiple of 4
)(
    input  logic [N-1:0] a,
    input  logic [N-1:0] b,
    input  logic         cin,
    output logic [N-1:0] sum,
    output logic         cout
);

    localparam DIGITS = N/4;

    logic [DIGITS:0] carry;

    assign carry[0] = cin;

    genvar i;

    generate
        for (i = 0; i < DIGITS; i++) begin : BCD_STAGE

            BCD_digit digit_adder (
                .a   (a[i*4 +: 4]),
                .b   (b[i*4 +: 4]),
                .cin (carry[i]),
                .sum (sum[i*4 +: 4]),
                .cout(carry[i+1])
            );

        end
    endgenerate

    assign cout = carry[DIGITS];

endmodule
