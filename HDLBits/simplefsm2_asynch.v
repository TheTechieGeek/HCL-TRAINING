module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF (active high)
    input j,
    input k,
    output reg out
);

    parameter OFF = 1'b0,
              ON  = 1'b1;

    reg curr_state, next_state;

    // Next-state logic (combinational)
    always @(*) begin
        case (curr_state)
            OFF: begin
                if (j == 1)
                    next_state = ON;
                else
                    next_state = OFF;
            end

            ON: begin
                if (k == 1)
                    next_state = OFF;
                else
                    next_state = ON;
            end
        endcase
    end

    // State register (sequential)
    always @(posedge clk or posedge areset) begin
        if (areset)
            curr_state <= OFF;        // reset to OFF
        else
            curr_state <= next_state; // update state
    end

    // Output logic (Moore)
    always @(*) begin
        case (curr_state)
            OFF: out = 1'b0;
            ON : out = 1'b1;
        endcase
    end

endmodule