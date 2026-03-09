module cla_carry(
    input [3:0] p,
    input [3:0] g,
    input cin,
    output c1, c2, c3, c4
);

assign c1 = g[0] | (p[0] & cin);

assign c2 = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);

assign c3 = g[2] | (p[2] & g[1]) |
            (p[2] & p[1] & g[0]) |
            (p[2] & p[1] & p[0] & cin);

assign c4 = g[3] | (p[3] & g[2]) |
            (p[3] & p[2] & g[1]) |
            (p[3] & p[2] & p[1] & g[0]) |
            (p[3] & p[2] & p[1] & p[0] & cin);

endmodule