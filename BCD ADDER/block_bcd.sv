module pg_block(
    input a,
    input b,
    output p,
    output g
);
    
assign p = a ^ b;
assign g = a & b;

endmodule