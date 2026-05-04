module top_module (
    input clk,
    input x,
    output z
);

    wire out_high, out_mid, out_low;
    wire out_d1, out_d2, out_d3;
    wire out_d1bar, out_d2bar, out_d3bar;

    // Inversions
    assign out_d1bar = ~out_d1;
    assign out_d2bar = out_d2;     // (same as original)
    assign out_d3bar = ~out_d3;

    // Combinational logic
    assign out_high = x ^ out_d1;
    assign out_mid  = x & out_d2bar;
    assign out_low  = x | out_d3bar;

    // Instantiate 3 flip-flops
    stage s1 (
        .clk(clk),
        .d(out_high),
        .q(out_d1)
    );

    stage s2 (
        .clk(clk),
        .d(out_mid),
        .q(out_d2)
    );

    stage s3 (
        .clk(clk),
        .d(out_low),
        .q(out_d3)
    );

    // Final output
    assign z = ~(out_d1 | out_d2 | out_d3);

endmodule

module stage (
    input clk,
    input d,
    output reg q
);

    always @(posedge clk) begin
        q <= d;
    end

endmodule

/*
module top_module (
    input clk,
    input x,
    output z
); 
    wire out_high, out_mid, out_low;
    wire out_d1, out_d2, out_d3;
    wire out_d1bar, out_d2bar, out_d3bar;
    
    assign out_d1bar = ~out_d1;
    assign out_d2bar = out_d2;
    assign out_d3bar = ~out_d3;
    
    assign out_high = x ^ out_d1;
    assign out_mid = x & out_d2bar;
    assign out_low = x | out_d3bar;
    
    always @(posedge clk) begin
        out_d1 <= out_high;
        out_d2 <= out_mid;
        out_d3 <= out_low;
    end
    
    assign z = ~(out_d1 | out_d2 | out_d3);
endmodule
*/