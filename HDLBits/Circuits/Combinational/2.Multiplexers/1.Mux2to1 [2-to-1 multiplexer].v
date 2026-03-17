module top_module( 
    input a, b, sel,
    output out 
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
