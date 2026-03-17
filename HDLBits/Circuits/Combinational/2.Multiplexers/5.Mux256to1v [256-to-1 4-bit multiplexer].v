module top_module (
    input [1023:0] in,
    input [7:0] sel,
    output reg [3:0] out
);
    integer i;

    always @(*) begin
        out = 4'b0000;   // avoid latch
        for (i = 0; i < 256; i = i + 1) begin
            if (sel == i)
                out = in[i*4 +: 4];
        end
    end

endmodule