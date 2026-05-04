module top_module (
    input [7:0] in,
    output reg [2:0] pos
);
    always @(*) begin
        pos = 0;
        casez(in)
            8'bzzzzzzz1: pos = 0;
            8'bzzzzzz1z: pos = 1;
            8'bzzzzz1zz: pos = 2;
            8'bzzzz1zzz: pos = 3;
            8'bzzz1zzzz: pos = 4;
            8'bzz1zzzzz: pos = 5;
            8'bz1zzzzzz: pos = 6;
            8'b1zzzzzzz: pos = 7;
        endcase
    end
endmodule

/*
module top_module (
    input [7:0] in,
    output reg [2:0] pos
);

    integer i;
    reg found;

    always @(*) begin
        pos = 0;
        found = 0;
        
        for(i = 0; i < 8; i = i + 1) begin
            if(in[i] && !found) begin
                pos = i;
                found = 1;
            end
        end
    end

endmodule
*/