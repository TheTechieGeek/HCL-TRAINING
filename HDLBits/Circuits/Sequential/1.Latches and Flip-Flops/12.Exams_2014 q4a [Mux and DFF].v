module top_module (
    input clk,
    input w, R, E, L,
    output reg Q
);
    wire out_mux, in_d;
    
    assign out_mux = E ? w : Q;
    assign in_d = L ? R : out_mux;
    
    always @(posedge clk) begin
        Q <= in_d;
    end

endmodule
