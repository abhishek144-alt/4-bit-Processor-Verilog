`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2026 14:32:59
// Design Name: 
// Module Name: program_counter_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////




module program_counter_tb;

    reg clk;
    reg reset;

    wire [2:0] pc;

    // Instantiate Program Counter
    program_counter uut (
        .clk(clk),
        .reset(reset),
        .pc(pc)
    );

    // Clock generation
    initial begin
        clk = 0;

        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin

        // Reset
        reset = 1;

        #10;

        // Release reset
        reset = 0;

        #80;

        // Reset again
        reset = 1;

        #10;

        reset = 0;

        #30;

        $finish;

    end

endmodule
