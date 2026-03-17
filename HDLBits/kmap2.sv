`timescale 1ns / 1ps

module kmap1(
    input a,
    input b,
    input c,
    input d,
    output out

    );
    assign out = (~b & ~c) | (~a & ~d) | (b & c & d) | (a & c & d) ;
   
endmodule
