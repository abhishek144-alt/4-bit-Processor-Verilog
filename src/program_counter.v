`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2026 14:32:34
// Design Name: 
// Module Name: program_counter
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


module program_counter (
    input  wire       clk,
    input  wire       reset,
    input  wire       enable,
    output reg  [2:0] pc
);

    always @(posedge clk) begin

        if (reset)
            pc <= 3'b000;

        else if (enable)
            pc <= pc + 3'b001;

        else
            pc <= pc;

    end

endmodule
