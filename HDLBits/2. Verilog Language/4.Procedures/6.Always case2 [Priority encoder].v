module top_module (
    input [3:0] in,
    output reg [1:0] pos
);

    integer i;
    reg found;

    always @(*) begin
        pos = 0;
        found = 0;
        
        for(i = 0; i < 4; i = i + 1) begin
            if(in[i] && !found) begin
                pos = i;
                found = 1;
            end
        end
    end

endmodule