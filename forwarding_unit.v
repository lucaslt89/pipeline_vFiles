`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:34:32 05/16/2013 
// Design Name: 
// Module Name:    forwarding_unit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module forwarding_unit(
    input [4:0] EX_MEM_RegisterRd,//reg_dest_EX_out en el pipeline
    input [4:0] MEM_WB_RegisterRd,//write_back_address_ID_in en el pipeline
	 //input MemToReg_EX, //MemToReg salida del execute
	 input EX_MEM_RegWrite,//RegWrite salida del execute
	 //input MemToReg_MEM,//MemToReg salida del memory access
	 input MEM_WB_RegWrite,//RegWrite salida del memory access
    input [4:0] ID_EX_RegisterRs,//reg_dest_s_type_in u_id_ex_register
    input [4:0] ID_EX_RegisterRt,//reg_dest_l_type_in u_id_ex_register
    output [1:0] ForwardA,//al mux_3_A de execute
    output [1:0] ForwardB//al mux_3_B de execute
    );

reg [1:0] auxA, auxB;

always@*
begin
	//EX hazard
	if(EX_MEM_RegWrite
	& (EX_MEM_RegisterRd != 0)
	& (EX_MEM_RegisterRd == ID_EX_RegisterRs))
		auxA = 2'b10;
	
	//MEM hazard
	else if(MEM_WB_RegWrite
	& (MEM_WB_RegisterRd != 0)
	& (EX_MEM_RegisterRd != ID_EX_RegisterRs)
	& (MEM_WB_RegisterRd == ID_EX_RegisterRs))
		auxA = 2'b01;
		
	else
		auxA = 2'b00;
	
	//EX hazard
	if(EX_MEM_RegWrite
	& (EX_MEM_RegisterRd != 0)
	& (EX_MEM_RegisterRd == ID_EX_RegisterRt))
		auxB = 2'b10;
	
	//MEM hazard	
	else if(MEM_WB_RegWrite
	& (MEM_WB_RegisterRd != 0)
	& (EX_MEM_RegisterRd != ID_EX_RegisterRt)
	& (MEM_WB_RegisterRd == ID_EX_RegisterRt))
		auxB = 2'b01;

	else
		auxB = 2'b00;

end

assign ForwardA = auxA;
assign ForwardB = auxB;
 
endmodule
