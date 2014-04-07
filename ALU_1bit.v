module ALU_1bit( result, carryOut, a, b, invertA, invertB, nullAdd, operation, carryIn, less );
  
  output wire result;
  output wire carryOut;
  
  input wire a;
  input wire b;
  input wire invertA;
  input wire invertB;
  input wire nullAdd;
  input wire[1:0] operation;
  input wire carryIn;
  input wire less;
  
  /* Begin of my CODE. */

	/* a/~a and b/~b to use */
	wire valid_a, valid_b;
	xor g1(valid_a, a, invertA);
	xor g2(valid_b, b, invertB);

	/* And & or */
	wire and_result, or_result;
	and g3(and_result, valid_a, valid_b);
	or g4(or_result, valid_a, valid_b);

	/* Add/subtract */
	wire adder_input2, add_result;
	and g5(adder_input2, valid_b, ~nullAdd);
	Full_adder g6(add_result, carryOut, carryIn, valid_a, adder_input2);

	/* Operator MUX */
	assign result = (operation[1] & operation[0] & less) |
									(~operation[1] & ~operation[0] & and_result) |
									(~operation[1] & operation[0] & or_result) |
									(operation[1] & ~operation[0] & add_result);

	/* End of my CODE. */ 
  
endmodule
