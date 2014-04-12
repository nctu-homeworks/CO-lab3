module Decoder( instr_op_i, RegWrite_o,	ALUOp_o, ALUSrc_o, RegDst_o );
     
//I/O ports
input	[6-1:0] instr_op_i;

output			RegWrite_o;
output	[3-1:0] ALUOp_o;
output			ALUSrc_o;
output			RegDst_o;
 
//Internal Signals
wire	[3-1:0] ALUOp_o;
wire			ALUSrc_o;
wire			RegWrite_o;
wire			RegDst_o;

//Main function

assign RegDst_o = (instr_op_i==6'b000000) ? 1 :
				  (instr_op_i==6'b001000) ? 0 : 0;
				  
assign RegWrite_o = (instr_op_i==6'b000000) ? 1 :
				  (instr_op_i==6'b001000) ? 1 : 1;
				  		  
assign ALUOp_o = (instr_op_i==6'b000000) ? 3'b010 :
				  (instr_op_i==6'b001000) ? 3'b100 : 3'b101;				

assign ALUSrc_o = (instr_op_i==6'b000000) ? 0 :
				  (instr_op_i==6'b001000) ? 1 : 1;				  



endmodule
   