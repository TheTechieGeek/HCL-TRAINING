module top_module(
    input clk,
    input areset,    // Active-low asynchronous reset
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging
);

    // 3 bits required for 6 states
    reg [2:0] curr_state, next_state;

    // State encoding
    parameter WALK_LEFT  = 3'd0,
              WALK_RIGHT = 3'd1,
              DIG_LEFT   = 3'd2,
              DIG_RIGHT  = 3'd3,
              FALL_LEFT  = 3'd4,
              FALL_RIGHT = 3'd5;

    //-------------------------------------------------
    // State Register (Sequential Logic)
    //-------------------------------------------------
    always @(posedge clk or posedge areset) begin
        if (areset)
            curr_state <= WALK_LEFT;   // Brainwashed: start walking left
        else
            curr_state <= next_state;
    end

    //-------------------------------------------------
    // Next-State Logic (Combinational)
    //-------------------------------------------------
    always @(*) begin
        case (curr_state)

            //-------------------------------------------------
            // WALK LEFT
            //-------------------------------------------------
            WALK_LEFT: begin
                if (!ground)                 // Highest priority: FALL
                    next_state = FALL_LEFT;
                else if (dig)                // Next priority: DIG
                    next_state = DIG_LEFT;
                else if (bump_left)          // Lowest priority: SWITCH
                    next_state = WALK_RIGHT;
                else
                    next_state = WALK_LEFT;
            end

            //-------------------------------------------------
            // WALK RIGHT
            //-------------------------------------------------
            WALK_RIGHT: begin
                if (!ground)
                    next_state = FALL_RIGHT;
                else if (dig)
                    next_state = DIG_RIGHT;
                else if (bump_right)
                    next_state = WALK_LEFT;
                else
                    next_state = WALK_RIGHT;
            end

            //-------------------------------------------------
            // DIG LEFT
            //-------------------------------------------------
            DIG_LEFT: begin
                if (!ground)                 // Stop digging if no ground
                    next_state = FALL_LEFT;
                else
                    next_state = DIG_LEFT;
            end

            //-------------------------------------------------
            // DIG RIGHT
            //-------------------------------------------------
            DIG_RIGHT: begin
                if (!ground)
                    next_state = FALL_RIGHT;
                else
                    next_state = DIG_RIGHT;
            end

            //-------------------------------------------------
            // FALL LEFT
            //-------------------------------------------------
            FALL_LEFT: begin
                if (ground)                  // Resume walking when land
                    next_state = WALK_LEFT;
                else
                    next_state = FALL_LEFT;
            end

            //-------------------------------------------------
            // FALL RIGHT
            //-------------------------------------------------
            FALL_RIGHT: begin
                if (ground)
                    next_state = WALK_RIGHT;
                else
                    next_state = FALL_RIGHT;
            end

            //-------------------------------------------------
            // Default Safety
            //-------------------------------------------------
            default: next_state = WALK_LEFT;

        endcase
    end
    
    always @(*) begin
    	walk_left  = 0;
    	walk_right = 0;
    	aaah       = 0;
    	digging    = 0;
        
        case(curr_state)
            WALK_LEFT  : walk_left  = 1;
            WALK_RIGHT : walk_right = 1;
            FALL_LEFT  : aaah = 1;
            FALL_RIGHT : aaah = 1;
            DIG_LEFT   : digging = 1;
            DIG_RIGHT  : digging = 1;
        endcase
    end    

endmodule