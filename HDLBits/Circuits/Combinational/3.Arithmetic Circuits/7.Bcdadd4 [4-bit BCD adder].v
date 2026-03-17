module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum 
);

    wire [3:0] count;   // carry signals between BCD adders
    genvar i;

    generate
        for (i = 0; i < 4; i = i + 1) begin : bcdadd
            if (i == 0) begin
                bcd_fadd inst (
                    a[3:0],
                    b[3:0],
                    cin,
                    count[i],
                    sum[3:0]
                );
            end 
            else begin
                bcd_fadd inst (
                    a[4*i+3 : 4*i],
                    b[4*i+3 : 4*i],
                    count[i-1],
                    count[i],
                    sum[4*i+3 : 4*i]
                );
            end
        end
    endgenerate

    assign cout = count[3];

endmodule
/*
module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum 
);

    wire [3:0] count;   // carry signals between BCD adders
    genvar i;

    generate
        for (i = 0; i < 4; i = i + 1) begin : bcdadd
            if (i == 0) begin
                bcd_fadd inst (
                    a[3:0],
                    b[3:0],
                    cin,
                    count[i],
                    sum[3:0]
                );
            end 
            else begin
                bcd_fadd inst (
                    a[4*i+3 : 4*i],
                    b[4*i+3 : 4*i],
                    count[i-1],
                    count[i],
                    sum[4*i+3 : 4*i]
                );
            end
        end
    endgenerate

    assign cout = count[3];

endmodule
*/