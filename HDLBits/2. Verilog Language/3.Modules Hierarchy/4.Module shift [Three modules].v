module top_module ( 
    input clk, 
    input d, 
    output q 
);
    wire q_1, q_2;
    my_dff inst1(.clk(clk), .d(d), .q(q_1));
    my_dff inst2(.clk(clk), .d(q_1), .q(q_2));
    my_dff inst3(.clk(clk), .d(q_2), .q(q));

endmodule
