## Interactive Memory Game

### Introduction
This project is a controller for a training device to evaluate whether a test subject (person or animal) can correctly push a sequence of buttons, in this case "ABAABBABABA". If the subject correctly completes the sequence, a cookie will be dispensed. If the subject makes an error, an electric shock is delivered, and they must go back to the beginning. In this project, the cookie dispenser and the shocking device will be simulated by lighting LEDs

### Circuit Behavior
1. The system should start in the “ready to start” status, with no LEDs on. It should stay in ready status until one of the inputs is activated.
2. If the correct input is activated, the system should move to the next state and an additional yellow progress LED will light up. It should remain in this state until another input is activated.
3. If no input has been activated, the system should remain in the same state.
4. If an incorrect input is activated, the “shock” (red LED) should activate for one clock cycle, then go back to start. The same is implied for when two inputs are pushed at the same time.
5. If the sequence is completed, the system should deliver a cookie (green LED) for one cycle, then return to start. NOTE: Subject needs to release button before next clock cycle.
