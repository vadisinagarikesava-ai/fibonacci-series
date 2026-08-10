module fibonacci (
    input        clk,
    input        reset,
    input        enable,
    output reg [15:0] fibonacci_number
);

    reg [15:0] previous;
    reg [15:0] current;

    always @(posedge clk) begin
        if (reset) begin
            previous         <= 16'd0;
            current          <= 16'd1;
            fibonacci_number <= 16'd0;
        end
        else if (enable) begin
            fibonacci_number <= current;
            previous         <= current;
            current          <= previous + current;
        end
    end

endmodule