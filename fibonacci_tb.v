`timescale 1ns/1ps

module fibonacci_tb;

    reg clk;
    reg reset;
    reg enable;

    wire [15:0] fibonacci_number;

    fibonacci uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .fibonacci_number(fibonacci_number)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $monitor("Time = %0t | Fibonacci Number = %0d",
                 $time, fibonacci_number);

        clk    = 0;
        reset  = 1;
        enable = 0;

        #10;
        reset  = 0;
        enable = 1;

        #100;

        $finish;
    end

endmodule