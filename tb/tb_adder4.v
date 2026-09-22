`timescale 1ns / 1ps

//
// modify the testbench values in the arrays for entries 4,5,6,and 7
//  so that you test more calculations.
//

module adder4_tb;

    // Testbench signals
   reg [3:0] a;
   reg [3:0] b;
   wire [4:0] result;
   integer    i;
   reg [4:0]  expected [7:0];
   reg [3:0]  testa [7:0];
   reg [3:0]  testb [7:0];
   reg	      test_fail;

    // Instantiate the DUT (Device Under Test)
    adder4 dut (
		.a (a),
		.b (b),
		.result (result)
    );

 initial begin
    // Initialize the expected array
    expected[0] = 5'd0;
    expected[1] = 5'd2;
    expected[2] = 5'd30;
    expected[3] = 5'd15;
	 expected[4] = 5'd5;
	 expected[5] = 5'd22;
	 expected[6] = 5'd30;
	 expected[7] = 5'd19;

    testa[0] = 4'd0;
    testa[1] = 4'd1;
    testa[2] = 4'd15;
    testa[3] = 4'd7;
	 testa[4] = 4'd2;
	 testa[5] = 4'd10;
	 testa[6] = 4'd21;
	 testa[7] = 4'd9;

    testb[0] = 4'd0;
    testb[1] = 4'd1;
    testb[2] = 4'd15;
    testb[3] = 4'd8;
	 testb[4] = 4'd3;
	 testb[5] = 4'd12;
	 testb[6] = 4'd9;
	 testb[7] = 4'd10;
 end

   
   initial begin
      test_fail = 0;
      
      // Display header
      $display("Time\t| a   | b   | result");
      $display("------\t|-----|-------");
      
      // Use a loop to test 
      for (i = 0; i < 8; i = i + 1) begin
	 a = testa[i];
	 b = testb[i];
	 #10; // wait 10 time units
	 if (result == expected[i]) begin
	   $display("%0dns\t| %d | %d | %d | Pass", $time, a, b, result);
	 end else begin
	    $display("%0dns\t| %d | %d | %d | Fail", $time, a, b, result);
	    test_fail = 1;
	 end
      end
      
      // End simulation
      $finish_and_return(test_fail);
   end


endmodule
