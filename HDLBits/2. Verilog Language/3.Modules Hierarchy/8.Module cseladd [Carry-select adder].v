module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] sum_mux_1, sum_mux_0, sum_mux, sum_1;
    wire cout_1; // select line of the mux
    
    add16 add1(.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(sum_1), .cout(cout_1));
    
    add16 add2(.a(a[31:16]), .b(b[31:16]), .cin(1'b0), .sum(sum_mux_0), .cout()); // adder with cin = 0 
    add16 add3(.a(a[31:16]), .b(b[31:16]), .cin(1'b1), .sum(sum_mux_1), .cout()); // adder with cin = 1

    always @(*) begin
      case(cout_1)
          1'b0: sum_mux = sum_mux_0;
          1'b1: sum_mux = sum_mux_1;
      endcase
    end

    assign sum = {sum_mux, sum_1};

endmodule

