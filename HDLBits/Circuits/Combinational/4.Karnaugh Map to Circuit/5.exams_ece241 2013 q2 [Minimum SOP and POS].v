module top_module (
    input a,
    input b,
    input c,
    input d,
    output wire out_sop,
    output wire out_pos
); 
    assign out_sop = (c & d) | (c & ~a & ~b);
    assign out_pos = c & (~a | b) & (d | ~b);

endmodule
