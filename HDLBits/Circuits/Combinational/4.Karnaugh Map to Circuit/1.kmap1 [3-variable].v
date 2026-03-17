module top_module (
    input a,
    input b,
    input c,
    output out 
);

    always @(*) begin
        out = a | b | c;
    end

endmodule