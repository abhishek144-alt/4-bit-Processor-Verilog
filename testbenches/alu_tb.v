`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2026 22:58:15
// Design Name: 
// Module Name: alu_tb
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

module alu_tb;

    reg  [3:0] A;
    reg  [3:0] B;
    reg  [2:0] ALU_Control;

    wire [3:0] Result;
    wire       Zero;
    wire       Carry;

    // Instantiate ALU
    alu uut (
        .A(A),
        .B(B),
        .ALU_Control(ALU_Control),
        .Result(Result),
        .Zero(Zero),
        .Carry(Carry)
    );

    initial begin

        // Display results
        $monitor("Time=%0t | A=%b | B=%b | Control=%b | Result=%b | Zero=%b | Carry=%b",
                 $time, A, B, ALU_Control, Result, Zero, Carry);

        // -------------------------
        // Test 1: ADD
        // 5 + 3 = 8
        // -------------------------
        A = 4'b0101;
        B = 4'b0011;
        ALU_Control = 3'b000;
        #10;

        // -------------------------
        // Test 2: SUB
        // 7 - 2 = 5
        // -------------------------
        A = 4'b0111;
        B = 4'b0010;
        ALU_Control = 3'b001;
        #10;

        // -------------------------
        // Test 3: AND
        // 1100 & 1010 = 1000
        // -------------------------
        A = 4'b1100;
        B = 4'b1010;
        ALU_Control = 3'b010;
        #10;

        // -------------------------
        // Test 4: OR
        // 1100 | 1010 = 1110
        // -------------------------
        A = 4'b1100;
        B = 4'b1010;
        ALU_Control = 3'b011;
        #10;

        // -------------------------
        // Test 5: XOR
        // 1100 ^ 1010 = 0110
        // -------------------------
        A = 4'b1100;
        B = 4'b1010;
        ALU_Control = 3'b100;
        #10;

        // -------------------------
        // Test 6: NOT
        // ~1010 = 0101
        // -------------------------
        A = 4'b1010;
        B = 4'b0000;
        ALU_Control = 3'b101;
        #10;

        // -------------------------
        // Test 7: Increment
        // 0101 + 1 = 0110
        // -------------------------
        A = 4'b0101;
        B = 4'b0000;
        ALU_Control = 3'b110;
        #10;

        // -------------------------
        // Test 8: Decrement
        // 0101 - 1 = 0100
        // -------------------------
        A = 4'b0101;
        B = 4'b0000;
        ALU_Control = 3'b111;
        #10;

        // -------------------------
        // Test 9: Carry
        // 1111 + 0001 = 0000
        // Carry = 1
        // -------------------------
        A = 4'b1111;
        B = 4'b0001;
        ALU_Control = 3'b000;
        #10;

        $finish;

    end

endmodule