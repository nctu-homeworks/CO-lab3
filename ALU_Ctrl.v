module ALU_Ctrl( funct_i, ALUOp_i, ALU_operation_o, FURslt_o );

//I/O ports 
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [5-1:0] ALU_operation_o;  
output     [2-1:0] FURslt_o;
     
//Internal Signals
wire		[5-1:0] ALU_operation_o;
wire		[2-1:0] FURslt_o;

//Main function
casex({ALUOp_i,funct_i}}
9'b100_xxxxxx:	assign ALU_operation_o = 5'b0_0_0_10; // ADDI
9'b010_1000x0:	assign ALU_operation_o = {1'b0,funct_i[1],3'b010}; // ADD SUB
9'b010_10010x:	assign ALU_operation_o = {3'b0,funct_i[1:0]}; // AND OR
9'b010_101111:	assign ALU_operation_o = 5'b1_0_1_10; // NOT
9'b010_101010:	assign ALU_operation_o = 5'b0_1_0_11; // SLT
9'b010_000xx0:	assign ALU_operation_o = funct_i[5:1]; // shift
endcase

casex({ALUOp_i,funct_i})
9'b010_0xxxxx: 	assign FURslt_o = 1;
9'b101_xxxxxx: 	assign FURslt_o = 2;
default: 		assign FURslt_o = 0;
endcase

endmodule     
