# Design and Simulation of 4-bit Processor

A custom 4-bit microprocessor designed in Verilog HDL and simulated using Xilinx Vivado.

---

## 📁 Repository Structure

```text
4-bit-Processor/
│
├── README.md
├── .gitignore
│
├── src/
│   ├── alu.v
│   ├── register_file.v
│   ├── control_unit.v
│   ├── program_counter.v
│   ├── instruction_memory.v
│   ├── data_memory.v
│   └── processor.v
│
├── testbenches/
│   ├── alu_tb.v
│   ├── register_file_tb.v
│   ├── control_unit_tb.v
│   ├── program_counter_tb.v
│   ├── instruction_memory_tb.v
│   ├── data_memory_tb.v
│   └── processor_tb.v
│
└── waveforms/
    ├── alu_waveform.png
    ├── register_file_waveform.png
    ├── control_unit_waveform.png
    ├── program_counter_waveform.png
    ├── instruction_memory_waveform.png
    ├── data_memory_waveform.png
    ├── processor_waveform.png
    └── test_result.png
```

---

## 📊 Simulation Waveforms

All simulation waveform screenshots are saved in the [`waveforms/`](./waveforms/) directory:

| Module | Waveform Preview | Description |
| :--- | :--- | :--- |
| **ALU** | `waveforms/alu_waveform.png` | Verifies arithmetic and logical operations |
| **Register File** | `waveforms/register_file_waveform.png` | Verifies register read/write timing |
| **Control Unit** | `waveforms/control_unit_waveform.png` | Verifies opcode decoding and control signal generation |
| **Program Counter** | `waveforms/program_counter_waveform.png` | Verifies PC increment, enable, and reset behavior |
| **Instruction Memory** | `waveforms/instruction_memory_waveform.png` | Verifies instruction fetch addressing |
| **Data Memory** | `waveforms/data_memory_waveform.png` | Verifies memory load/store operations |
| **Integrated Processor** | `waveforms/processor_waveform.png` | Complete end-to-end execution of the 4-bit processor |
| **Test Output / Result** | `waveforms/test_result.png` | Console simulation result confirming test passed |

### Waveform Visualizations

#### 1. Integrated Processor
![Processor Waveform](waveforms/processor_waveform.png)

#### 2. Simulation Test Result (Console Output)
![Test Result](waveforms/test_result.png)

#### 3. Arithmetic Logic Unit (ALU)
![ALU Waveform](waveforms/alu_waveform.png)

#### 4. Register File
![Register File Waveform](waveforms/register_file_waveform.png)

#### 5. Program Counter
![Program Counter Waveform](waveforms/program_counter_waveform.png)

#### 6. Instruction Memory
![Instruction Memory Waveform](waveforms/instruction_memory_waveform.png)

#### 7. Data Memory
![Data Memory Waveform](waveforms/data_memory_waveform.png)

#### 8. Control Unit
![Control Unit Waveform](waveforms/control_unit_waveform.png)

---

## 🛠️ How to Open and Run in Vivado

1. Open **Xilinx Vivado**.
2. Click **Open Project** and select `Design and Simulation of 4-bit Processor.xpr`.
3. In the Flow Navigator, click **Run Simulation** $\rightarrow$ **Run Behavioral Simulation**.
4. To export waveforms, go to **File** $\rightarrow$ **Export** $\rightarrow$ **Export Simulation Waveform Image...** or capture via Windows Snipping Tool (`Win + Shift + S`) and save directly into the `waveforms/` directory.
