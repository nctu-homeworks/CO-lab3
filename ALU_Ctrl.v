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


assign ALU_operation_o = ({ALUOp_i,funct_i}==9'b010_100000 || ALUOp_i == 3'b100) ? 5'b00010 : //add addi
						 ({ALUOp_i,funct_i}==9'b010_100010) ? 5'b01010 : //sub
						 ({ALUOp_i,funct_i}==9'b010_100100) ? 5'b00000 : //and
						 ({ALUOp_i,funct_i}==9'b010_100101) ? 5'b00001 : //or
						 ({ALUOp_i,funct_i}==9'b010_101111) ? 5'b10110 : //not
						 ({ALUOp_i,funct_i}==9'b010_101010) ? 5'b01011 : //slt
						 ({ALUOp_i,funct_i}==9'b010_000000) ? 5'b00001 : //sll
						 ({ALUOp_i,funct_i}==9'b010_000010) ? 5'b00000 : //srl
						 ({ALUOp_i,funct_i}==9'b010_000100) ? 5'b00011 : 5'b00010; //sllv srlv

						 

assign FURslt_o = ({ALUOp_i,funct_i}==9'b010_100000) ? 0 : //add
		 		  ({ALUOp_i,funct_i}==9'b010_100010) ? 0 : //sub
				  ({ALUOp_i,funct_i}==9'b010_100100) ? 0 : //and
				  ({ALUOp_i,funct_i}==9'b010_100101) ? 0 : //or
				  ({ALUOp_i,funct_i}==9'b010_101111) ? 0 : //not
				  ({ALUOp_i,funct_i}==9'b010_101010) ? 0 : //slt
				  ({ALUOp_i,funct_i}==9'b010_000000) ? 1 : //sll
				  ({ALUOp_i,funct_i}==9'b010_000010) ? 1 : //srl
				  ({ALUOp_i,funct_i}==9'b010_000100) ? 1 : //sllv
				  ({ALUOp_i,funct_i}==9'b010_000110) ? 1 : //srlv
				  (ALUOp_i==3'b100) ? 0 : 2; //addi lui					 
						 
				

endmodule     
