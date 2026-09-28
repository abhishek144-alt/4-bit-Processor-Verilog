`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2026 14:26:24
// Design Name: 
// Module Name: control_unit_tb
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

module control_unit_tb;

    reg  [2:0] opcode;

    wire [2:0] alu_control;
    wire       reg_write;
    wire       mem_read;
    wire       mem_write;
    wire       alu_src;
    wire       halt;

    // Instantiate Control Unit
    control_unit uut (
        .opcode(opcode),

        .alu_control(alu_control),
        .reg_write(reg_write),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .alu_src(alu_src),
        .halt(halt)
    );

    initial begin

        // ADD
        opcode = 3'b000;
        #10;

        // SUB
        opcode = 3'b001;
        #10;

        // AND
        opcode = 3'b010;
        #10;

        // OR
        opcode = 3'b011;
        #10;

        // XOR
        opcode = 3'b100;
        #10;

        // LOAD
        opcode = 3'b101;
        #10;

        // STORE
        opcode = 3'b110;
        #10;

        // HALT
        opcode = 3'b111;
        #10;

        $finish;

    end

    initial begin

        $monitor(
            "Time=%0t | Opcode=%b | ALU_Control=%b | RegWrite=%b | MemRead=%b | MemWrite=%b | ALUSrc=%b | Halt=%b",
            $time,
            opcode,
            alu_control,
            reg_write,
            mem_read,
            mem_write,
            alu_src,
            halt
        );

    end

endmodule
