`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:19:46 03/29/2013 
// Design Name: 
// Module Name:    id_ex 
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
module id_ex(
    input [31:0] data_a_in,
    input [31:0] data_b_in,
	 input [31:0] sign_extend_in,
	 input [10:0] jump_dest_in,
	 input [4:0] reg_dest_r_type_in,
	 input [4:0] reg_dest_l_type_in,
	 input clock,
	 //Control Signals Input
	 input RegDst_in,
	 input ALUSrc_in,
	 input MemToReg_in,
	 input RegWrite_in,
	 input MemRead_in,
	 input MemWrite_in,
	 input Branch_in,
	 input [1:0] ALUOp_in,
	 
    output reg [31:0] data_a_out,
    output reg [31:0] data_b_out,
	 output reg [31:0] sign_extend_out,
	 output reg [10:0] jump_dest_out,
	 output reg [4:0] reg_dest_r_type_out,
	 output reg [4:0] reg_dest_l_type_out,
	 //Control Signals Output
	 output reg RegDst_out,
	 output reg ALUSrc_out,
	 output reg MemToReg_out,
	 output reg RegWrite_out,
	 output reg MemRead_out,
	 output reg MemWrite_out,
	 output reg Branch_out,
	 output reg [1:0] ALUOp_out
    );

	always @(posedge clock)
	begin
		data_a_out = data_a_in;
		data_b_out = data_b_in;
		sign_extend_out = sign_extend_in;
		jump_dest_out = jump_dest_in;
		reg_dest_r_type_out = reg_dest_r_type_in;
		reg_dest_l_type_out = reg_dest_l_type_in;
		RegDst_out = RegDst_in;
		ALUSrc_out = ALUSrc_in;
		MemToReg_out = MemToReg_in;
		RegWrite_out = RegWrite_in;
		MemRead_out = MemRead_in;
		MemWrite_out = MemWrite_in;
		Branch_out = Branch_in;
		ALUOp_out = ALUOp_in;
	end

endmodule
