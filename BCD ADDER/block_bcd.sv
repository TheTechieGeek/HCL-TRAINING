module BCD_digit(
    input  logic [3:0] a,
    input  logic [3:0] b,
    input  logic       cin,
    output logic [3:0] sum,
    output logic       cout
);

    logic [4:0] temp;

    always_comb begin
        temp = a + b + cin;

        if (temp > 9) begin
            temp = temp + 5'd6;
            cout = 1;
        end
        else begin
            cout = 0;
        end

        sum = temp[3:0];
    end

endmodule
