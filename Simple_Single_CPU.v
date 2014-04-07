module Simple_Single_CPU( clk_i, rst_n );

//I/O port
input         clk_i;
input         rst_n;

//Internal Signles


//modules
Program_Counter PC(
        .clk_i(clk_i),      
	    .rst_n(rst_n),     
	    .pc_in_i() ,   
	    .pc_out_o() 
	    );
	
Adder Adder1(
        .src1_i(),     
	    .src2_i(),
	    .sum_o()    
	    );
	
Instr_Memory IM(
        .pc_addr_i(),  
	    .instr_o()    
	    );

Mux2to1 #(.size(5)) Mux_Write_Reg(
        .data0_i(),
        .data1_i(),
        .select_i(),
        .data_o()
        );	
		
Reg_File RF(
        .clk_i(clk_i),      
	    .rst_n(rst_n) ,     
        .RSaddr_i() ,  
        .RTaddr_i() ,  
        .RDaddr_i() ,  
        .RDdata_i()  , 
        .RegWrite_i(),
        .RSdata_o() ,  
        .RTdata_o()   
        );
	
Decoder Decoder(
        .instr_op_i(), 
	    .RegWrite_o(), 
	    .ALUOp_o(),   
	    .ALUSrc_o(),   
	    .RegDst_o()   
		);

ALU_Ctrl AC(
        .funct_i(),   
        .ALUOp_i(),   
        .ALU_operation_o(),
		.FURslt_o()
        );
	
Sign_Extend SE(
        .data_i(),
        .data_o()
        );

Zero_Filled ZF(
        .data_i(),
        .data_o()
        );
		
Mux2to1 #(.size(32)) ALU_src2Src(
        .data0_i(),
        .data1_i(),
        .select_i(),
        .data_o()
        );	
		
ALU ALU(
		.aluSrc1(),
	    .aluSrc2(),
	    .ALU_operation_i(),
		.result(),
		.zero(),
		.overflow()
	    );
		
Shifter shifter( 
		.result(), 
		.leftRight(),
		.shamt(),
		.sftSrc() 
		);
		
Mux3to1 #(.size(32)) RDdata_Source(
        .data0_i(),
        .data1_i(),
		.data2_i(),
        .select_i(),
        .data_o()
        );			

endmodule



