`timescale 1ns / 1ps
//
//  Add code inside the adder4 module to implement a four-bit adder, using
//   four instances of the one-bit full adder module "fulladd".
//
//  The github tests will test the output of your code.
//  If it passes, you will see a green check mark at the top of the repository.
//

module adder4(
	      input [3:0]      a,
	      input [3:0]      b,
	      output [4:0] result);
wire w1, w2, w3;
	
	fulladd fa0(a[0], b[0], 0, result[0], w1);
	fulladd fa1(a[1], b[1], w1, result[1], w2);
	fulladd fa2(a[2], b[2], w2, result[2], w3);
	fulladd fa3(a[3], b[3], w3, result[3], result[4]);
   
endmodule

module fulladd(
	       input  x,
	       input  y,
	       input  cin,
	       output sum,
	       output cout);

   assign sum = x ^ y ^ cin;
   assign cout = (x & y) | (x & cin) | (y & cin);
   
endmodule

