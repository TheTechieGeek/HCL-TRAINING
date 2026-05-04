module top_module (
    input  wire in,
    input  wire clk,
    output reg  out
);

    wire d;
    assign d = (in ^ out);
    always @(posedge clk) begin
        out <= d;
    end

endmodule