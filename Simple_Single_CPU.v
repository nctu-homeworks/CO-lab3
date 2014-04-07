module Simple_Single_CPU( clk_i, rst_n );

//I/O port
input         clk_i;
input         rst_n;

//Internal Signals
wire [32-1:0] instruction, writeData, readData1, readData2, ALU_result, Shifter_result;
wire RegDst, RegWrite, ALUSrc;
wire [3-1:0] ALUOP;

//modules
wire [32-1:0] program_now, program_after;

Program_Counter PC(
        .clk_i(clk_i),      
	    .rst_n(rst_n),     
	    .pc_in_i(program_after) ,   
	    .pc_out_o(program_now) 
	    );
	
Adder Adder1(
        .src1_i(program_now),     
	    .src2_i(32'd4),
	    .sum_o(program_after)    
	    );
	
Instr_Memory IM(
        .pc_addr_i(program_now),  
	    .instr_o(instruction)    
	    );

wire [5-1:0] writeReg_addr;
		
Mux2to1 #(.size(5)) Mux_Write_Reg(
        .data0_i(instruction[20:16]),
        .data1_i(instruction[15:11]),
        .select_i(RegDst),
        .data_o(writeReg_addr)
        );	
		
Reg_File RF(
        .clk_i(clk_i),      
	    .rst_n(rst_n) ,     
        .RSaddr_i(instruction[25:21]) ,  
        .RTaddr_i(instruction[20:16]) ,  
        .RDaddr_i(writeReg_addr) ,  
        .RDdata_i(writeData)  , 
        .RegWrite_i(RegWrite),
        .RSdata_o(readData1) ,  
        .RTdata_o(readData2)   
        );
	
Decoder Decoder(
        .instr_op_i(instruction[31:26]), 
	    .RegWrite_o(RegWrite), 
	    .ALUOp_o(ALUOP),   
	    .ALUSrc_o(ALUSrc),   
	    .RegDst_o(RegDst)   
		);

wire [5-1:0] ALU_operation;
wire [2-1:0] FURslt;
		
ALU_Ctrl AC(
        .funct_i(instruction[5:0]),   
        .ALUOp_i(ALUOP),   
        .ALU_operation_o(ALU_operation),
		.FURslt_o(FURslt)
        );

wire [32-1:0] instance_signExtend;
		
Sign_Extend SE(
        .data_i(instruction[15:0]),
        .data_o(instance_signExtend)
        );

wire [32-1:0] instance_zeroFilled;

Zero_Filled ZF(
        .data_i(instruction[15:0]),
        .data_o(instance_zeroFilled)
        );
		
wire [32-1:0] ALUinp2;
		
Mux2to1 #(.size(32)) ALU_src2Src(
        .data0_i(readData2),
        .data1_i(instance_signExtend),
        .select_i(ALUSrc),
        .data_o(ALUinp2)
        );	
		
ALU ALU(
		.aluSrc1(readData1),
	    .aluSrc2(ALUinp2),
	    .ALU_operation_i(ALU_operation),
		.result(ALU_result),
		.zero(),
		.overflow()
	    );
		
Shifter shifter( 
		.result(Shifter_result), 
		.leftRight(ALU_operation[0]),
		.shamt(instruction[10:6]),
		.sftSrc(ALUinp2) 
		);
		
Mux3to1 #(.size(32)) RDdata_Source(
        .data0_i(ALU_result),
        .data1_i(Shifter_result),
		.data2_i(instance_zeroFilled),
        .select_i(FURslt),
        .data_o(writeData)
        );			

endmodule



