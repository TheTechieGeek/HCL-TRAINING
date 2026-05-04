module top_module(
    input clk, 
    input in,
    input areset,
    output out
);
    parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
    reg[1:0] curr_state, next_state;
    
    // State register (sequential)
    always @(posedge clk) begin
        if (reset)
            curr_state <= A;        // reset to OFF
        else
            curr_state <= next_state; // update state
    end

    // Next state transition logic for each state
    always @(*) begin
        case(curr_state)
            A: begin
                if(in == 0)
                    next_state = A;
                else 
                    next_state = B;
            end
            
            B: begin
                if(in == 0)
                    next_state = C;
                else 
                    next_state = B;
            end
            
            C: begin
                if(in == 0)
                    next_state = A;
                else 
                    next_state = D;
            end
            
            D: begin
                if(in == 0)
                    next_state = C;
                else 
                    next_state = B;
            end
        endcase
    end
    
    // Output logic
    always @(*) begin
        case(curr_state)
            A: out = 1'b0;
            B: out = 1'b0;
            C: out = 1'b0;
            D: out = 1'b1;
        endcase
    end
    
endmodule
