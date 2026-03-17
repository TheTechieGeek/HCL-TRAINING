module top_module
(
	input clk,
	input areset,
	input in,
	output out
);

	parameter A = 1'b0, B = 1'b1;

	reg curr_state, next_state;

	// Synchronous state transition, sequential logic
	always @(posedge clk) begin
		if (areset) begin
			curr_state <= B;
		end
		else begin
			curr_state <= next_state;
		end
	end

	// Next state transition, combinational logic
	always @(*) begin
		case (curr_state)
			A: begin
                if (in == 0)
                    next_state <= B;
                else
                    next_state <= A;
            end
			B: begin
                if (in == 0)
                    next_state <= A;
                else
                    next_state <= B;
            end
		endcase
	end

	// Output, combinational logic
	always @(*) begin
		case (curr_state)
			A:  out = 0;
			B: 	out = 1;
		endcase
	end

endmodule