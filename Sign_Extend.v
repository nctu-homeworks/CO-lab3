module Sign_Extend( data_i, data_o );

//I/O ports
input	[16-1:0] data_i;
output	[32-1:0] data_o;

//Internal Signals
wire	[32-1:0] data_o;

//Sign extended
assign data_o[16-1:0] = data_i;
assign data_i[16] = data_i[15];
assign data_i[17] = data_i[15];
assign data_i[18] = data_i[15];
assign data_i[19] = data_i[15];
assign data_i[20] = data_i[15];
assign data_i[21] = data_i[15];
assign data_i[22] = data_i[15];
assign data_i[23] = data_i[15];
assign data_i[24] = data_i[15];
assign data_i[25] = data_i[15];
assign data_i[26] = data_i[15];
assign data_i[27] = data_i[15];
assign data_i[28] = data_i[15];
assign data_i[29] = data_i[15];
assign data_i[30] = data_i[15];
assign data_i[31] = data_i[15];


endmodule      
