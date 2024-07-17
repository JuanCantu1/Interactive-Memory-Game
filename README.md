## Interactive Memory Game

### Introduction
This project is a controller for a training device to evaluate whether a test subject (person or animal) can correctly push a sequence of buttons, in this case "ABAABBABABA". If the subject correctly completes the sequence, a cookie will be dispensed. If the subject makes an error, an electric shock is delivered, and they must go back to the beginning. In this project, the cookie dispenser and the shocking device will be simulated by lighting LEDs.

### Circuit Behavior
1. The system should start in the “ready to start” status, with no LEDs on. It should stay in ready status until one of the inputs is activated.
2. If the correct input is activated, the system should move to the next state and an additional yellow progress LED will light up. It should remain in this state until another input is activated.
3. If no input has been activated, the system should remain in the same state.
4. If an incorrect input is activated, the “shock” (red LED) should activate for one clock cycle, then go back to start. The same is implied for when two inputs are pushed at the same time.
5. If the sequence is completed, the system should deliver a cookie (green LED) for one cycle, then return to start. NOTE: Subject needs to release button before next clock cycle.

# PART 1: UNDERSTAND THE REQUIREMENTS

![Specifications ](https://github.com/JuanCantu1/Interactive-Memory-Game/assets/109363196/cd277294-6076-44bd-b9d5-a9c94b363fe5)

# PART 2: STATE GRAPH

![State graph](https://github.com/JuanCantu1/Interactive-Memory-Game/assets/109363196/0e0af599-0c5c-4b63-a84f-24f79b2375ae)

# PART 3: STATE TABLES

![State Tables](https://github.com/JuanCantu1/Interactive-Memory-Game/assets/109363196/1a611684-7ffb-475d-937e-adfbe77e478b)

# PART 4: FF EXCITATION TABLE

![FF Excitation Table](https://github.com/JuanCantu1/Interactive-Memory-Game/assets/109363196/60bddd36-eb79-471a-a33b-9a432972e01c)

# PART 5: EQUATIONS

![Equations](https://github.com/JuanCantu1/Interactive-Memory-Game/assets/109363196/0b154f18-e0d6-466f-b8c7-9ea7ef5ba27e)

# PART 6: CIRCUIT SCHEMATIC

![Schematic](https://github.com/JuanCantu1/Interactive-Memory-Game/assets/109363196/fed5204e-ace2-4be9-a0f1-9e56b570837c)

# PART 7: BUILD AND TEST

![Circuit](https://github.com/JuanCantu1/Interactive-Memory-Game/assets/109363196/60597f4f-ca64-41d1-bb51-df8587ca0676)

# Conclusions
In conclusion, the objective of designing and testing a digital state machine for a memory tester/trainer was successfully achieved in this project. By following the procedure for designing a state machine, we were able to develop a functional system that could evaluate a test subject's ability to correctly push a sequence of buttons. The system demonstrated the ability to move through different states, light up LEDs to indicate progress, detect incorrect inputs, deliver an electric shock for incorrect inputs (red LED), and dispense a cookie upon successful completion of the sequence (green LED). Overall, the project provided a valuable opportunity to apply theoretical knowledge of digital state
machine design to a practical project. The experience gained in designing and implementing a
complex system from scratch will prove useful in future endeavors.

# Video of Simulation Below

https://github.com/JuanCantu1/Interactive-Memory-Game/assets/109363196/d8982bad-0f26-4cc5-ba4b-d4c58c1c8c89

--- 
---

# Continuation: Verilog HDL Implementation (In Progress)
I am now revisiting this project and doing a Verilog HDL implementation. The implementation aims to replicate the functionality using digital logic and FPGA technology on the DE1-SoC board.

# PART 8 
The Verilog implementation includes two Verilog files:

1. TopModule.v
This file contains the main design of the circuit. It includes the following modules:

jkFlipFlop: This module implements a JK flip-flop, a type of bistable multivibrator. It has inputs j and k for the JK inputs, clk for the clock signal, and outputs q0 and q1. The flip-flop changes state based on the values of j and k at the rising edge of the clock.

InputFlipFlop: This module uses four JK flip-flops to create a sequence generator based on the inputs X1 and X2. It generates four outputs Q1, Q2, Q3, and Q4 which are the states of the flip-flops. The logic for the JK inputs of each flip-flop is defined within this module.

OutputFlipFlop: This module takes the outputs from the InputFlipFlop (Q1, Q2, Q3, Q4) and generates twelve outputs (Z1 to Z12) based on the given logic. These outputs represent the different states and combinations derived from the input flip-flops.

TopModule: This is the top-level module that instantiates the InputFlipFlop and OutputFlipFlop modules. It connects the inputs and outputs appropriately and serves as the main interface for the overall circuit.

2. tb_TopModule.v
This file contains the testbench for the TopModule. It is used to simulate and verify the behavior of the circuit. The testbench applies a sequence of test vectors to ensure the design works as expected. Specifically, it:

Instantiates the TopModule.
Provides clock and input signals (X1 and X2) to the TopModule.
Monitors the outputs (Z1 to Z12) and checks for the correct behavior based on the input sequences.
The testbench includes a sequence of input changes to thoroughly test the circuit:

X1=1, X2=0
X1=0, X2=1
X1=1, X2=0
X1=1, X2=0
X1=0, X2=1
X1=0, X2=1
X1=1, X2=0
X1=0, X2=1
X1=1, X2=0
X1=0, X2=1
X1=1, X2=0
X1=0, X2=0
X1=0, X2=0
X1=0, X2=0

This sequence ensures that various combinations and transitions are tested, verifying the correct functionality of the circuit.
  
# PART 9
- Steps for integrating and configuring the Verilog design on the DE1-SoC FPGA board.
  
# PART 10
- Procedures for testing the Verilog implementation on the DE1-SoC board, ensuring correct functionality and performance.

# Demonstation
Link of demo will go here

# Conclusion
