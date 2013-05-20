`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:06:39 05/20/2013 
// Design Name: 
// Module Name:    stall_mux 
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
module stall_mux(
    input stall_mux
	 input RegDst_in,
	 input ALUSrc_in,
	 input MemToReg_in,
	 input RegWrite_in,
	 input MemRead_in,
	 input MemWrite_in,
	 input Branch_in,
	 input [1:0] ALUOp_in, 
	 output reg RegDst_out,
	 output reg ALUSrc_out,
	 output reg MemToReg_out,
	 output reg RegWrite_out,
	 output reg MemRead_out,
	 output reg MemWrite_out,
	 output reg Branch_out,
	 output reg [1:0] ALUOp_out
    );

always@*
begin
	if(stall_mux)
	begin
		RegDst_out = RegDst_in;
		ALUSrc_out = ALUSrc_in;
		MemToReg_out = MemToReg_in;
		RegWrite_out = RegWrite_in;
		MemRead_out = MemRead_in;
		MemWrite_out = MemWrite_in;
		Branch_out = Branch_in;
		ALUOp_out = ALUOp_in;
	end
	
	else
	begin
		RegDst_out = 0;
		ALUSrc_out = 0;
		MemToReg_out = 0;
		RegWrite_out = 0;
		MemRead_out = 0;
		MemWrite_out = 0;
		Branch_out = 0;
		ALUOp_out = 0;	
	end
end


endmodule
