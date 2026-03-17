module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg curr_state, next_state;

    always @(*) begin
        case(curr_state)
            OFF: begin
                if (j== 1)
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

    always @(posedge clk) begin
        if(reset) begin
            curr_state <= OFF;
        end
        else
            curr_state <= next_state;
    end
    
    always @(*) begin
        case(curr_state)
            ON: begin
                out = 1'b1;
            end
            OFF: begin
                out = 1'b0;
            end
        endcase
    end
    
endmodule
