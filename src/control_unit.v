`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2026 14:25:55
// Design Name: 
// Module Name: control_unit
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

module control_unit (
    input  wire [2:0] opcode,

    output reg  [2:0] alu_control,
    output reg        reg_write,
    output reg        mem_read,
    output reg        mem_write,
    output reg        alu_src,
    output reg        halt
);

    always @(*) begin

        // Safe default values
        alu_control = 3'b000;
        reg_write   = 1'b0;
        mem_read    = 1'b0;
        mem_write   = 1'b0;
        alu_src     = 1'b0;
        halt        = 1'b0;

        case (opcode)

            // ADD
            3'b000: begin
                alu_control = 3'b000;
                reg_write   = 1'b1;
            end

            // SUB
            3'b001: begin
                alu_control = 3'b001;
                reg_write   = 1'b1;
            end

            // AND
            3'b010: begin
                alu_control = 3'b010;
                reg_write   = 1'b1;
            end

            // OR
            3'b011: begin
                alu_control = 3'b011;
                reg_write   = 1'b1;
            end

            // XOR
            3'b100: begin
                alu_control = 3'b100;
                reg_write   = 1'b1;
            end

            // LOAD
            3'b101: begin
                mem_read  = 1'b1;
                reg_write = 1'b1;
            end

            // STORE
            3'b110: begin
                mem_write = 1'b1;
            end

            // HALT
            3'b111: begin
                halt = 1'b1;
            end

            default: begin
                alu_control = 3'b000;
                reg_write   = 1'b0;
                mem_read    = 1'b0;
                mem_write   = 1'b0;
                alu_src     = 1'b0;
                halt        = 1'b0;
            end

        endcase
    end

endmodule
