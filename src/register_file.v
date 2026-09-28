`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2026 23:08:56
// Design Name: 
// Module Name: register_file
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

module register_file (
    input  wire       clk,
    input  wire       reset,

    input  wire       write_enable,
    input  wire [1:0] write_reg,
    input  wire [3:0] write_data,

    input  wire [1:0] read_reg1,
    input  wire [1:0] read_reg2,

    output wire [3:0] read_data1,
    output wire [3:0] read_data2
);

    // Four 4-bit registers
    reg [3:0] registers [0:3];

    // Synchronous reset and write
    always @(posedge clk) begin

        if (reset) begin
            registers[0] <= 4'b0000;
            registers[1] <= 4'b0000;
            registers[2] <= 4'b0000;
            registers[3] <= 4'b0000;
        end

        else if (write_enable) begin
            registers[write_reg] <= write_data;
        end

    end

    // Combinational read ports
    assign read_data1 = registers[read_reg1];
    assign read_data2 = registers[read_reg2];

endmodule