`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2026 14:45:23
// Design Name: 
// Module Name: instruction_memory_tb
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


`timescale 1ns/1ps

module instruction_memory_tb;

    reg [2:0] address;

    wire [7:0] instruction;

    // Instantiate Instruction Memory
    instruction_memory uut (
        .address(address),
        .instruction(instruction)
    );

    initial begin

        address = 3'b000;
        #10;

        address = 3'b001;
        #10;

        address = 3'b010;
        #10;

        address = 3'b011;
        #10;

        address = 3'b100;
        #10;

        address = 3'b101;
        #10;

        address = 3'b110;
        #10;

        address = 3'b111;
        #10;

        $finish;

    end

endmodule
