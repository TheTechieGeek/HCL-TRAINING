module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum 
);
    
    full_adder FA0 (
        .a   (a[0]),
        .b   (b[0]),
        .cin (cin),
        .sum (sum[0]),
        .cout(cout[0])
    );

    full_adder FA1 (
        .a   (a[1]),
        .b   (b[1]),
        .cin (cout[0]),
        .sum (sum[1]),
        .cout(cout[1])
    );

    full_adder FA2 (
        .a   (a[2]),
        .b   (b[2]),
        .cin (cout[1]),
        .sum (sum[2]),
        .cout(cout[2])   // final carry-out
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
module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    
    genvar i;
    generate
        for(i=0;i<3;i++)begin:adr
            if(i!=0) 
                fa inst1(a[i],b[i],cout[i-1],cout[i],sum[i]);
        
        else fa inst2(a[0],b[0],cin,cout[0],sum[0]);
        end
    endgenerate
    
endmodule

module fa(
    input a,b,cin,
    output cout,sum
);
    assign {cout,sum}=a+b+cin;
endmodule
*/     