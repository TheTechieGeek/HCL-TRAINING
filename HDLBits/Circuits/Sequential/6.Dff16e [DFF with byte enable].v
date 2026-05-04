module top_module (
    input clk,
    input resetn,           // Active-low synchronous reset
    input [1:0] byteena,
    input [15:0] d,
    output reg [15:0] q
);

    always @(posedge clk) begin
        if (!resetn) begin
            q <= 16'b0;     // Reset all 16 DFFs to 0
        end 
        else begin
            // Lower byte
            if (byteena[0])
                q[7:0] <= d[7:0];
            // Upper byte
            if (byteena[1])
                q[15:8] <= d[15:8];
        end
    end

endmodule