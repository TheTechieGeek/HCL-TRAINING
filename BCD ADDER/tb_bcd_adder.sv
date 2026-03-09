`timescale 1ns/1ps

module tb_bcd_adder;

    // Parameter
    parameter N = 12;

    // Testbench signals
    logic [N-1:0] a;
    logic [N-1:0] b;
    logic cin;

    logic [N-1:0] sum;
    logic cout;

    // Instantiate DUT
    bcd_adder #(.N(N)) dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Test procedure
    initial begin

        $display("----------------------------------------------------");
        $display("   A        B        CIN     SUM       COUT");
        $display("----------------------------------------------------");

        cin = 0;

        // Test Case 1
        a = 12'h25;   // 25
        b = 12'h38;   // 38
        #10;
        $display("%h   %h    %b     %h     %b", a, b, cin, sum, cout);

        // Test Case 2
        a = 12'h19;   // 19
        b = 12'h27;   // 27
        #10;
        $display("%h   %h    %b     %h     %b", a, b, cin, sum, cout);

        // Test Case 3
        a = 12'h45;   // 45
        b = 12'h55;   // 55
        #10;
        $display("%h   %h    %b     %h     %b", a, b, cin, sum, cout);

        // Test Case 4
        a = 12'h99;   // 99
        b = 12'h95;   // 01
        #10;
        $display("%h   %h    %b     %h     %b", a, b, cin, sum, cout);

        // Test Case 5
        a = 12'h145;   // 12
        b = 12'h134;   // 34
        #10;
        $display("%h   %h    %b     %h     %b", a, b, cin, sum, cout);

        // Test Case 6 with carry-in
        cin = 1;
        a = 12'h8;
        b = 12'h7;
        #10;
        $display("%h   %h    %b     %h     %b", a, b, cin, sum, cout);

        $display("----------------------------------------------------");

        #10 $finish;

    end
  
  initial begin
    $dumpfile("tb_bcd_adder.vcd");
    $dumpvars(0, tb_bcd_adder);
  end
  

endmodule
