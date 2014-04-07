module ALU( aluSrc1, aluSrc2, ALU_operation_i, result, zero, overflow );
 
  output wire[31:0] result;
  output wire zero;
  output wire overflow;

  input wire[31:0] aluSrc1;
  input wire[31:0] aluSrc2;
  input wire[4:0] ALU_operation_i;


  // Transform for the compactity to suit the new ALU.
  wire invertA;
  wire invertB;
  wire nullAdd;
  wire[1:0] operation;
  
  assign invertA = ALU_operation_i[4];
  assign invertB = ALU_operation_i[3];
  assign nullAdd = ALU_operation_i[2];
  assign operation = ALU_operation_i[1:0];
  
  // The following are the original code submitted in Lab1 written by 0116229梁智湧
	/* 32 1bit-ALUs */
	wire less_than, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19, c20, c21, c22, c23, c24, c25, c26, c27, c28, c29, c30, c31;
	ALU_1bit g0(result[0], c1, aluSrc1[0], aluSrc2[0], invertA, invertB, nullAdd, operation, invertB, less_than);
	ALU_1bit g1(result[1], c2, aluSrc1[1], aluSrc2[1], invertA, invertB, nullAdd, operation, c1, 1'b0);
	ALU_1bit g2(result[2], c3, aluSrc1[2], aluSrc2[2], invertA, invertB, nullAdd, operation, c2, 1'b0);
	ALU_1bit g3(result[3], c4, aluSrc1[3], aluSrc2[3], invertA, invertB, nullAdd, operation, c3, 1'b0);
	ALU_1bit g4(result[4], c5, aluSrc1[4], aluSrc2[4], invertA, invertB, nullAdd, operation, c4, 1'b0);
	ALU_1bit g5(result[5], c6, aluSrc1[5], aluSrc2[5], invertA, invertB, nullAdd, operation, c5, 1'b0);
	ALU_1bit g6(result[6], c7, aluSrc1[6], aluSrc2[6], invertA, invertB, nullAdd, operation, c6, 1'b0);
	ALU_1bit g7(result[7], c8, aluSrc1[7], aluSrc2[7], invertA, invertB, nullAdd, operation, c7, 1'b0);
	ALU_1bit g8(result[8], c9, aluSrc1[8], aluSrc2[8], invertA, invertB, nullAdd, operation, c8, 1'b0);
	ALU_1bit g9(result[9], c10, aluSrc1[9], aluSrc2[9], invertA, invertB, nullAdd, operation, c9, 1'b0);
	ALU_1bit g10(result[10], c11, aluSrc1[10], aluSrc2[10], invertA, invertB, nullAdd, operation, c10, 1'b0);
	ALU_1bit g11(result[11], c12, aluSrc1[11], aluSrc2[11], invertA, invertB, nullAdd, operation, c11, 1'b0);
	ALU_1bit g12(result[12], c13, aluSrc1[12], aluSrc2[12], invertA, invertB, nullAdd, operation, c12, 1'b0);
	ALU_1bit g13(result[13], c14, aluSrc1[13], aluSrc2[13], invertA, invertB, nullAdd, operation, c13, 1'b0);
	ALU_1bit g14(result[14], c15, aluSrc1[14], aluSrc2[14], invertA, invertB, nullAdd, operation, c14, 1'b0);
	ALU_1bit g15(result[15], c16, aluSrc1[15], aluSrc2[15], invertA, invertB, nullAdd, operation, c15, 1'b0);
	ALU_1bit g16(result[16], c17, aluSrc1[16], aluSrc2[16], invertA, invertB, nullAdd, operation, c16, 1'b0);
	ALU_1bit g17(result[17], c18, aluSrc1[17], aluSrc2[17], invertA, invertB, nullAdd, operation, c17, 1'b0);
	ALU_1bit g18(result[18], c19, aluSrc1[18], aluSrc2[18], invertA, invertB, nullAdd, operation, c18, 1'b0);
	ALU_1bit g19(result[19], c20, aluSrc1[19], aluSrc2[19], invertA, invertB, nullAdd, operation, c19, 1'b0);
	ALU_1bit g20(result[20], c21, aluSrc1[20], aluSrc2[20], invertA, invertB, nullAdd, operation, c20, 1'b0);
	ALU_1bit g21(result[21], c22, aluSrc1[21], aluSrc2[21], invertA, invertB, nullAdd, operation, c21, 1'b0);
	ALU_1bit g22(result[22], c23, aluSrc1[22], aluSrc2[22], invertA, invertB, nullAdd, operation, c22, 1'b0);
	ALU_1bit g23(result[23], c24, aluSrc1[23], aluSrc2[23], invertA, invertB, nullAdd, operation, c23, 1'b0);
	ALU_1bit g24(result[24], c25, aluSrc1[24], aluSrc2[24], invertA, invertB, nullAdd, operation, c24, 1'b0);
	ALU_1bit g25(result[25], c26, aluSrc1[25], aluSrc2[25], invertA, invertB, nullAdd, operation, c25, 1'b0);
	ALU_1bit g26(result[26], c27, aluSrc1[26], aluSrc2[26], invertA, invertB, nullAdd, operation, c26, 1'b0);
	ALU_1bit g27(result[27], c28, aluSrc1[27], aluSrc2[27], invertA, invertB, nullAdd, operation, c27, 1'b0);
	ALU_1bit g28(result[28], c29, aluSrc1[28], aluSrc2[28], invertA, invertB, nullAdd, operation, c28, 1'b0);
	ALU_1bit g29(result[29], c30, aluSrc1[29], aluSrc2[29], invertA, invertB, nullAdd, operation, c29, 1'b0);
	ALU_1bit g30(result[30], c31, aluSrc1[30], aluSrc2[30], invertA, invertB, nullAdd, operation, c30, 1'b0);
	ALU_last g31(result[31], overflow, less_than, aluSrc1[31], aluSrc2[31], invertA, invertB, nullAdd, operation, c31, 1'b0);

	/* Zero */
	assign zero = ~(|result);

	/* End of my CODE. */ 
	  
endmodule
