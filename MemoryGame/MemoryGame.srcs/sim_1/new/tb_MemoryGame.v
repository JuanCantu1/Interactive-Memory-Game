module tb_TopModule;

  reg clk;
  reg reset;
  reg X1;
  reg X2;
  wire Z1, Z2, Z3, Z4, Z5, Z6, Z7, Z8, Z9, Z10, Z11, Z12;

  // Instantiate the TopModule
  TopModule uut (
    .clk(clk),
    .reset(reset),
    .X1(X1),
    .X2(X2),
    .Z1(Z1),
    .Z2(Z2),
    .Z3(Z3),
    .Z4(Z4),
    .Z5(Z5),
    .Z6(Z6),
    .Z7(Z7),
    .Z8(Z8),
    .Z9(Z9),
    .Z10(Z10),
    .Z11(Z11),
    .Z12(Z12)
  );

  // Generate clock signal
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // Clock period of 10 picoseconds
  end

  // Stimulate inputs
  initial begin
    // Initialize inputs
    reset = 1;
    X1 = 0;
    X2 = 0;
    
    // Release reset after a few clock cycles
    #10;
    reset = 0;
    
    // Apply test vectors
    #10 X1 = 1; X2 = 0;
    #10 X1 = 0; X2 = 1;
    #10 X1 = 1; X2 = 0;
    #10 X1 = 1; X2 = 0;
    #10 X1 = 0; X2 = 1;
    #10 X1 = 0; X2 = 1;
    #10 X1 = 1; X2 = 0;
    #10 X1 = 0; X2 = 1;
    #10 X1 = 1; X2 = 0;
    #10 X1 = 0; X2 = 1;
    #10 X1 = 1; X2 = 0;
    #10 X1 = 0; X2 = 0;
    #10 X1 = 0; X2 = 0;
    #10 X1 = 0; X2 = 0;
    
    // Finish simulation
    #100;
    $stop;
  end

  // Monitor outputs
  initial begin
    $monitor("Time: %0t | X1: %b X2: %b | Z1: %b Z2: %b Z3: %b Z4: %b Z5: %b Z6: %b Z7: %b Z8: %b Z9: %b Z10: %b Z11: %b Z12: %b", 
             $time, X1, X2, Z1, Z2, Z3, Z4, Z5, Z6, Z7, Z8, Z9, Z10, Z11, Z12);
  end

endmodule
