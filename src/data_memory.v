`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2026 14:48:29
// Design Name: 
// Module Name: data_memory
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


module data_memory (
    input  wire       clk,
    input  wire       reset,

    input  wire       mem_read,
    input  wire       mem_write,

    input  wire [2:0] address,
    input  wire [3:0] write_data,

    output wire [3:0] read_data
);

    // 8 locations × 4 bits
    reg [3:0] memory [0:7];

    // Write operation and reset
    always @(posedge clk) begin

        if (reset) begin
            memory[0] <= 4'b0101;  // 5
            memory[1] <= 4'b0011;  // 3
            memory[2] <= 4'b0000;  // Result location
            memory[3] <= 4'b0000;
            memory[4] <= 4'b0000;
            memory[5] <= 4'b0000;
            memory[6] <= 4'b0000;
            memory[7] <= 4'b0000;
        end

        else if (mem_write) begin
            memory[address] <= write_data;
        end

    end

    // Combinational read
    assign read_data = mem_read ? memory[address] : 4'b0000;

endmodule
