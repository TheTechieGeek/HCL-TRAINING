module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output reg done);

    parameter BYTE1 = 2'd0,
              BYTE2 = 2'd1,
              BYTE3 = 2'd2,
              DONE  = 2'd3;
    		
    reg [1:0] curr_state, next_state;

    // State register (synchronous reset)
    always @(posedge clk) begin
        if(reset)
            curr_state <= BYTE1;
        else
            curr_state <= next_state;
    end
    
    // Next-state logic
    always @(*) begin
        case(curr_state)

            BYTE1:
                if (in[3])
                    next_state = BYTE2;
                else
                    next_state = BYTE1;
            
            BYTE2:
                next_state = BYTE3;
            
            BYTE3:
                next_state = DONE;
            
            DONE:
                if (in[3] == 1)
                    next_state = BYTE2;
            	else
                    next_state = BYTE1;            
            default:
                next_state = BYTE1;
        endcase
    end
    
    // Output logic
    always @(*) begin
        done = (curr_state == DONE);
    end

endmodule
