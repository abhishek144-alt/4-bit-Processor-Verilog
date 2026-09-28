`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2026 14:44:59
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory (
    input  wire [2:0] address,
    output reg  [7:0] instruction
);

    always @(*) begin

        case (address)

            3'b000: instruction = 8'b10101000; // LOAD R1,[0]

            3'b001: instruction = 8'b10110001; // LOAD R2,[1]

            3'b010: instruction = 8'b00001100; // ADD R1,R2

            3'b011: instruction = 8'b11001010; // STORE R1,[2]

            3'b100: instruction = 8'b11100000; // HALT

            3'b101: instruction = 8'b00000000; // Unused

            3'b110: instruction = 8'b00000000; // Unused

            3'b111: instruction = 8'b00000000; // Unused

            default: instruction = 8'b00000000;

        endcase

    end

endmodule
