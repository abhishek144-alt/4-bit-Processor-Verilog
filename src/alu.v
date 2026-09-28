`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2026 22:52:06
// Design Name: 
// Module Name: alu
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


module alu (
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire [2:0] ALU_Control,

    output reg  [3:0] Result,
    output reg        Zero,
    output reg        Carry
);

    reg [4:0] temp;

    always @(*) begin

        // Default values
        Result = 4'b0000;
        Carry  = 1'b0;
        temp   = 5'b00000;

        case (ALU_Control)

            // 000 - Addition
            3'b000: begin
                temp   = A + B;
                Result = temp[3:0];
                Carry  = temp[4];
            end

            // 001 - Subtraction
            3'b001: begin
                Result = A - B;
                Carry  = 1'b0;
            end

            // 010 - AND
            3'b010: begin
                Result = A & B;
            end

            // 011 - OR
            3'b011: begin
                Result = A | B;
            end

            // 100 - XOR
            3'b100: begin
                Result = A ^ B;
            end

            // 101 - NOT A
            3'b101: begin
                Result = ~A;
            end

            // 110 - Increment A
            3'b110: begin
                temp   = A + 1'b1;
                Result = temp[3:0];
                Carry  = temp[4];
            end

            // 111 - Decrement A
            3'b111: begin
                Result = A - 1'b1;
            end

            default: begin
                Result = 4'b0000;
                Carry  = 1'b0;
            end

        endcase

        // Zero flag
        if (Result == 4'b0000)
            Zero = 1'b1;
        else
            Zero = 1'b0;

    end

endmodule
