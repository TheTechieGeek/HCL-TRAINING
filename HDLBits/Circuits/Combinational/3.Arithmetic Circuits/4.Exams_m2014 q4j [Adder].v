module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire c1, c2, c3;   // internal carries

    // LSB
    full_adder FA0 (
        .a   (x[0]),
        .b   (y[0]),
        .cin (1'b0),
        .sum (sum[0]),
        .cout(c1)
    );

    // Bit 1
    full_adder FA1 (
        .a   (x[1]),
        .b   (y[1]),
        .cin (c1),
        .sum (sum[1]),
        .cout(c2)
    );

    // Bit 2
    full_adder FA2 (
        .a   (x[2]),
        .b   (y[2]),
        .cin (c2),
        .sum (sum[2]),
        .cout(c3)
    );

    // MSB
    full_adder FA3 (
        .a   (x[3]),
        .b   (y[3]),
        .cin (c3),
        .sum (sum[3]),
        .cout(sum[4]) 
    );
endmodule

module full_adder(
  input a, b, cin,
  output cout, sum
);

  assign sum   = a ^ b ^ cin;
  assign cout = ((a ^ b) & cin) | (a & b);
    
endmodule

/*
module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum
);

    wire cout [3:0];
    genvar i;
    generate
        for(i=0 ; i<4 ; i++)begin:fa_s
            if(i != 0) fa ins(x[i], y[i], cout[i-1], sum[i], cout[i]);
                
                else fa inst(x[0], y[0], 0, sum[0], cout[0]);
        end
    endgenerate
    assign sum[4] = cout[3];

endmodule

module fa(
    input x, y, cin,
    output sum, cout
);

    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);

endmodule
*/

