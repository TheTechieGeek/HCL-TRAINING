module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   
);     
	wire andab,andcd,orout;
    assign andab = a & b;
    assign andcd = c&d; 
    assign orout = andab | andcd;
	   
    assign out = orout;
    assign out_n = ~(orout);
endmodule