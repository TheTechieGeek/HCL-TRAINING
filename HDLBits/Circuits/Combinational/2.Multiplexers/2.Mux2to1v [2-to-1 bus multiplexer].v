module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out 
);
    always @(*) begin
        case(sel)
            0: begin
                out = a;
            end
            1: begin
                out = b;
            end
        endcase
    end
    

endmodule
