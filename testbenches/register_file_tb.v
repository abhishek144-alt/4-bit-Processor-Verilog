`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2026 23:10:25
// Design Name: 
// Module Name: register_file_tb
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

module register_file_tb;

    reg        clk;
    reg        reset;

    reg        write_enable;
    reg  [1:0] write_reg;
    reg  [3:0] write_data;

    reg  [1:0] read_reg1;
    reg  [1:0] read_reg2;

    wire [3:0] read_data1;
    wire [3:0] read_data2;

    // Instantiate Register File
    register_file uut (
        .clk(clk),
        .reset(reset),

        .write_enable(write_enable),
        .write_reg(write_reg),
        .write_data(write_data),

        .read_reg1(read_reg1),
        .read_reg2(read_reg2),

        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    // Clock generation
    initial begin
        clk = 0;

        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin

        // Initial values
        reset       = 1;
        write_enable = 0;
        write_reg   = 2'b00;
        write_data  = 4'b0000;

        read_reg1   = 2'b00;
        read_reg2   = 2'b00;

        // Hold reset
        #10;

        // Release reset
        reset = 0;

        // --------------------------------
        // Write 5 to R1
        // --------------------------------
        write_enable = 1;
        write_reg    = 2'b01;
        write_data   = 4'b0101;

        #10;

        // --------------------------------
        // Write 3 to R2
        // --------------------------------
        write_reg    = 2'b10;
        write_data   = 4'b0011;

        #10;

        // Disable writing
        write_enable = 0;

        // Read R1 and R2
        read_reg1 = 2'b01;
        read_reg2 = 2'b10;

        #10;

        // --------------------------------
        // Write 9 to R3
        // --------------------------------
        write_enable = 1;
        write_reg    = 2'b11;
        write_data   = 4'b1001;

        #10;

        write_enable = 0;

        // Read R2 and R3
        read_reg1 = 2'b10;
        read_reg2 = 2'b11;

        #10;

        // --------------------------------
        // Read R0 and R1
        // --------------------------------
        read_reg1 = 2'b00;
        read_reg2 = 2'b01;

        #10;

        $finish;

    end

    // Display values
    initial begin

        $monitor(
            "Time=%0t | Reset=%b | WE=%b | WReg=%b | WData=%b | R1=%b | R2=%b | Data1=%b | Data2=%b",
            $time,
            reset,
            write_enable,
            write_reg,
            write_data,
            read_reg1,
            read_reg2,
            read_data1,
            read_data2
        );

    end

endmodule