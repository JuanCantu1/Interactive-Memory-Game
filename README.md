# Interactive Memory Game (FPGA Implementation)

## Project Overview
This project implements a digital memory game that tests whether a subject can correctly enter a predefined sequence of button presses (`ABAABBABABA`). If successful, the system simulates a reward using a green LED; if incorrect, it simulates a penalty with a red LED and resets. The design began as a finite state machine and was later fully implemented in Verilog, then deployed on the Nexys A7-100T FPGA.


---

## Verilog HDL Implementation

The core logic of the game was written in Verilog. The implementation includes modular design, clock division, and full testbench verification.

### 📁 Modules Overview

- **`jkFlipFlop`**  
  A basic JK flip-flop module, triggered on the clock's rising edge.

- **`InputFlipFlop`**  
  A sequential logic unit using four JK flip-flops to track button sequences (`X1` and `X2`) and represent system state.

- **`OutputFlipFlop`**  
  Generates output indicators (`Z1` to `Z12`) based on the internal state. These outputs control the progress, shock, and reward LEDs.

- **`TopModule`**  
  Integrates the input and output modules and connects to external I/O.

- **`ClockDivider`**  
  Divides the system clock to a slower frequency for human-observable LED changes.

### 🧪 Testbench (`tb_MemoryGame.v`)

The testbench simulates the complete button sequence under different conditions and verifies all expected LED outputs. It also tests invalid inputs (e.g., simultaneous button presses) to confirm error handling.

#### 🖼️ Simulation Output

![MemoryGame tb_Simulation](https://github.com/user-attachments/assets/2295ef2d-f3a3-4ba6-8b9b-13acc80ebf2f)

---

## FPGA Deployment (Nexys A7-100T)

The Verilog design was synthesized and deployed on a Digilent Nexys A7-100T FPGA board using Xilinx Vivado.

### ⚙️ Hardware Setup Steps

1. **Constraints File (.xdc)**  
   Created to map Verilog I/Os (`X1`, `X2`, `Z1-Z12`) to the Nexys A7’s physical pins.

2. **Synthesis and Implementation**  
   Verilog files imported to Vivado → synthesized → implemented with successful timing and resource mapping.

3. **Bitstream Generation and Upload**  
   Generated `.bit` file was uploaded via USB to configure the FPGA.

4. **Physical Testing**  
   Button presses were simulated via switches or external input, and LED behavior was verified for all sequences.

---

## 🎥 Demo Videos

**🔧 Hardware Demo on Nexys A7-100T:**

<video src="https://github.com/user-attachments/assets/e427483d-0235-4269-9ce8-f86821ad96e8" controls width="600"></video>

**🧪 Simulation in Logisim:**

<video src="https://github.com/JuanCantu1/Interactive-Memory-Game/assets/109363196/d8982bad-0f26-4cc5-ba4b-d4c58c1c8c89" controls width="600"></video>


---

<details>
<summary>🧠 Click to view the original FSM design process</summary>

## Original FSM Design

### Description
Originally, this project was a conceptual state machine design, developed using standard digital logic techniques before moving to HDL implementation.

### Circuit Behavior Summary

1. System starts in idle state until a button is pressed.
2. Correct button → progress LED (yellow) lights up.
3. Incorrect button or simultaneous press → shock (red LED), reset.
4. Successful sequence → reward (green LED), reset.

### 📊 State Diagram

![State graph](https://github.com/JuanCantu1/Interactive-Memory-Game/assets/109363196/0e0af599-0c5c-4b63-a84f-24f79b2375ae)

### 🧮 State Table and Excitation Table

![State Tables](https://github.com/JuanCantu1/Interactive-Memory-Game/assets/109363196/1a611684-7ffb-475d-937e-adfbe77e478b)
![FF Excitation Table](https://github.com/JuanCantu1/Interactive-Memory-Game/assets/109363196/60bddd36-eb79-471a-a33b-9a432972e01c)

### 📐 Equations and Schematic

![Equations](https://github.com/JuanCantu1/Interactive-Memory-Game/assets/109363196/0b154f18-e0d6-466f-b8c7-9ea7ef5ba27e)
![Schematic](https://github.com/JuanCantu1/Interactive-Memory-Game/assets/109363196/fed5204e-ace2-4be9-a0f1-9e56b570837c)

</details>

---

## 🔚 Conclusion

This project demonstrated the full lifecycle of a digital system—from concept and theoretical design to Verilog implementation, simulation, and FPGA deployment. Building and testing this memory game provided hands-on experience in modular HDL design, timing control, testbench development, and hardware interfacing.

---
