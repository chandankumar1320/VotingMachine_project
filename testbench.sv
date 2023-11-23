// testbench
module test;
  
  reg clock;
  reg reset;
  reg mode;
  reg button1;
  reg button2;
  reg button3;
  reg button4;
  
  wire [7:0] led;
  
  votingMachine uut(
    .clock(clock),
    .reset(reset),
    .mode(mode),
    .button1(button1),
    .button2(button2),
    .button3(button3),
    .button4(button4),
    .led(led)
  );
  
  initial begin
    clock = 0;
    #500 forever #5 clock = ~clock; // Adjust the simulation time
  end
  
  initial begin
    reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    #100;  // Adjust the simulation time
    
    // Test scenario 1: Single vote for candidate 1
    #100 reset = 0; mode = 0; button1 = 1; button2 = 0; button3 = 0; button4 = 0;
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    // Test scenario 2: Multiple votes for each candidate
    #100 reset = 0; mode = 0; button1 = 1; button2 = 0; button3 = 0; button4 = 0;
    #100 reset = 0; mode = 0; button1 = 1; button2 = 0; button3 = 0; button4 = 0;
    #100 reset = 0; mode = 0; button1 = 1; button2 = 0; button3 = 0; button4 = 0;
    
    #100 reset = 0; mode = 0; button1 = 0; button2 = 1; button3 = 0; button4 = 0;
    #100 reset = 0; mode = 0; button1 = 0; button2 = 1; button3 = 0; button4 = 0;
    
    #100 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 1; button4 = 0;
    #100 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 1; button4 = 0;
    #100 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 1; button4 = 0;

    #100 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 1;
    #100 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 1;

    // Test scenario 3: Switch to result mode and check LED display for candidate 1
    #100 reset = 0; mode = 1; button1 = 1; button2 = 0; button3 = 0; button4 = 0;
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    $monitor($time, "mode = %b, button1 = %b, button2 = %b, button3 = %b, button4 = %b, led = %d", mode, button1, button2, button3, button4, led);
  end
endmodule
