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
	 input [10:0] branch_dest_in,
	 input [4:0] reg_dest_r_type_in,//rd
	 input [4:0] reg_dest_l_type_in,//rt
	 input [4:0] reg_dest_s_type_in,//rs
	 input [4:0] sa_in, //sa
	 input [10:0] current_pc_in,
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
	 input [2:0] trunk_mode_in,
	 input [5:0] op_code_in,
	 input Bne_in,
	 input Jump_in,
	 input [1:0] Jdes_sel_in,

    output reg [31:0] data_a_out,
    output reg [31:0] data_b_out,
	 output reg [31:0] sign_extend_out,
	 output reg [10:0] branch_dest_out,
	 output reg [4:0] reg_dest_r_type_out,//rd
	 output reg [4:0] reg_dest_l_type_out,//rt
	 output reg [4:0] reg_dest_s_type_out,//rs
	 output reg [4:0] sa_out, //sa
	 output reg [10:0] current_pc_out,

	 //Control Signals Output
	 output reg RegDst_out,
	 output reg ALUSrc_out,
	 output reg MemToReg_out,
	 output reg RegWrite_out,
	 output reg MemRead_out,
	 output reg MemWrite_out,
	 output reg Branch_out,
	 output reg [1:0] ALUOp_out,
	 output reg [2:0] trunk_mode_out,
	 output reg [5:0] op_code_out,
	 output reg Bne_out,
	 output reg Jump_out,
	 output reg [1:0] Jdes_sel_out

    );

	initial
	begin
	 data_a_out = 0;
    data_b_out = 0;
	 sign_extend_out = 0;
	 branch_dest_out = 0;
	 reg_dest_r_type_out = 0;
	 reg_dest_l_type_out = 0;
	 reg_dest_s_type_out = 0;
	 sa_out = 0;
	 current_pc_out = 0;
	 RegDst_out = 0;
	 ALUSrc_out = 0;
	 MemToReg_out = 0;
	 RegWrite_out = 0;
	 MemRead_out = 0;
	 MemWrite_out = 0;
	 Branch_out = 0;
	 ALUOp_out = 0;
	 trunk_mode_out = 0;
	 op_code_out = 0;
	 Bne_out = 0;
	 Jump_out = 0;
	 Jdes_sel_out = 0;
	end


	always @(negedge clock)
	begin
		data_a_out = data_a_in;
		data_b_out = data_b_in;
		sign_extend_out = sign_extend_in;
		branch_dest_out = branch_dest_in;
		reg_dest_r_type_out = reg_dest_r_type_in;
		reg_dest_l_type_out = reg_dest_l_type_in;
		reg_dest_s_type_out = reg_dest_s_type_in;
		sa_out = sa_in;
		current_pc_out = current_pc_in;
		RegDst_out = RegDst_in;
		ALUSrc_out = ALUSrc_in;
		MemToReg_out = MemToReg_in;
		RegWrite_out = RegWrite_in;
		MemRead_out = MemRead_in;
		MemWrite_out = MemWrite_in;
		Branch_out = Branch_in;
		ALUOp_out = ALUOp_in;
		trunk_mode_out = trunk_mode_in;
		op_code_out = op_code_in;
		Bne_out = Bne_in;
		Jump_out = Jump_in;
		Jdes_sel_out = Jdes_sel_in;
	end

endmodule
