`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2026 14:59:51
// Design Name: 
// Module Name: processor
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

module processor (
    input  wire       clk,
    input  wire       reset,

    output wire [2:0] pc,
    output wire [7:0] instruction,

    output wire [3:0] alu_result,
    output wire [3:0] memory_result,

    output wire [3:0] register_result,
    output wire       zero,
    output wire       carry,
    output wire       halt
);

    // ============================================================
    // Internal Control Signals
    // ============================================================

    wire [2:0] alu_control;
    wire       reg_write;
    wire       mem_read;
    wire       mem_write;
    wire       alu_src;

    // ============================================================
    // Instruction Fields
    // ============================================================

    wire [2:0] opcode;
    wire [1:0] reg_field;
    wire [1:0] source_reg;
    wire [2:0] memory_address;

    assign opcode        = instruction[7:5];
    assign reg_field     = instruction[4:3];
    assign source_reg    = instruction[2:1];
    assign memory_address = instruction[2:0];

    // ============================================================
    // Register File Signals
    // ============================================================

    wire [3:0] register_data1;
    wire [3:0] register_data2;

    // ============================================================
    // ALU Signals
    // ============================================================

    wire [3:0] alu_input_b;
    wire [3:0] alu_output;

    // ============================================================
    // Data Memory Signals
    // ============================================================

    wire [3:0] memory_data;

    // ============================================================
    // Program Counter
    // ============================================================

    program_counter PC (
        .clk    (clk),
        .reset  (reset),
        .enable (~halt),
        .pc     (pc)
    );

    // ============================================================
    // Instruction Memory
    // ============================================================

    instruction_memory IMEM (
        .address     (pc),
        .instruction (instruction)
    );

    // ============================================================
    // Control Unit
    // ============================================================

    control_unit CU (
        .opcode      (opcode),
        .alu_control (alu_control),
        .reg_write   (reg_write),
        .mem_read    (mem_read),
        .mem_write   (mem_write),
        .alu_src     (alu_src),
        .halt        (halt)
    );

    // ============================================================
    // Register File
    // ============================================================

    register_file RF (
        .clk          (clk),
        .reset        (reset),

        .write_enable (reg_write),
        .write_reg    (reg_field),
        .write_data   (memory_result),

        .read_reg1    (reg_field),
        .read_reg2    (source_reg),

        .read_data1   (register_data1),
        .read_data2   (register_data2)
    );

    // ============================================================
    // ALU Input Selection
    // ============================================================

    assign alu_input_b = register_data2;

    // ============================================================
    // ALU
    // ============================================================

    alu ALU (
        .A          (register_data1),
        .B          (alu_input_b),
        .ALU_Control(alu_control),

        .Result     (alu_output),
        .Zero       (zero),
        .Carry      (carry)
    );

    // ============================================================
    // Data Memory
    // ============================================================

    data_memory DMEM (
        .clk       (clk),
        .reset     (reset),

        .mem_read  (mem_read),
        .mem_write (mem_write),

        .address   (memory_address),
        .write_data(register_data1),

        .read_data (memory_data)
    );

    // ============================================================
    // Write-Back Selection
    // ============================================================

    assign memory_result =
            mem_read ? memory_data : alu_output;

    // ============================================================
    // Debug Output
    // ============================================================

    assign alu_result      = alu_output;
    assign register_result = register_data1;

endmodule