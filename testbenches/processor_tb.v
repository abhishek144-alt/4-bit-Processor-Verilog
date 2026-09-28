`timescale 1ns / 1ps

module processor_tb;

    // Clock and reset
    reg clk;
    reg reset;

    // Processor outputs
    wire [2:0] pc;
    wire [7:0] instruction;
    wire [3:0] alu_result;
    wire [3:0] memory_result;
    wire [3:0] register_result;
    wire zero;
    wire carry;
    wire halt;

    // ============================================================
    // Processor Instance
    // ============================================================

    processor DUT (
        .clk             (clk),
        .reset           (reset),

        .pc              (pc),
        .instruction     (instruction),

        .alu_result      (alu_result),
        .memory_result   (memory_result),
        .register_result (register_result),

        .zero            (zero),
        .carry           (carry),
        .halt            (halt)
    );

    // ============================================================
    // Clock Generation
    // 10 ns clock period
    // ============================================================

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    // ============================================================
    // Test Sequence
    // ============================================================

    initial begin

        // Initial reset
        reset = 1'b1;

        #20;

        // Release reset
        reset = 1'b0;

        // --------------------------------------------------------
        // Wait until processor reaches HALT
        // --------------------------------------------------------

        wait (halt == 1'b1);

        #10;

        // ========================================================
        // Display Final Processor State
        // ========================================================

        $display("========================================");
        $display("       4-BIT PROCESSOR TEST");
        $display("========================================");

        $display("PC             = %d", pc);
        $display("Instruction    = %h", instruction);
        $display("ALU Result     = %d", alu_result);
        $display("Memory Result  = %d", memory_result);
        $display("Register Result = %d", register_result);
        $display("Zero           = %b", zero);
        $display("Carry          = %b", carry);
        $display("HALT           = %b", halt);

        // ========================================================
        // Check Final Stored Result
        // ========================================================

        $display("----------------------------------------");

        $display("Memory[0]      = %d", DUT.DMEM.memory[0]);
        $display("Memory[1]      = %d", DUT.DMEM.memory[1]);
        $display("Memory[2]      = %d", DUT.DMEM.memory[2]);

        $display("----------------------------------------");

        if (DUT.DMEM.memory[2] == 4'd8) begin

            $display("TEST PASSED");
            $display("Expected result = 8");
            $display("Actual result   = %d", DUT.DMEM.memory[2]);

        end
        else begin

            $display("TEST FAILED");
            $display("Expected result = 8");
            $display("Actual result   = %d", DUT.DMEM.memory[2]);

        end

        $display("----------------------------------------");
        $display("========================================");

        #20;

        $finish;

    end

endmodule