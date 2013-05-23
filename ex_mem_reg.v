`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:00:50 02/25/2013 
// Design Name: 
// Module Name:    ex_mem_reg 
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
module ex_mem_reg(
	 input [31:0] result_in,
	 input [31:0] registro_2_in,
	 input [10:0] jump_dest_addr_in,
	 input zero_signal_in,
	 input [4:0] reg_dest_in,
	 input clock,
	 //Control Signals Input
	 input MemToReg_in,
	 input RegWrite_in,
	 input MemRead_in,
	 input MemWrite_in,
	 input Branch_in,
	 input [2:0] trunk_mode_in,
	 
	 output [31:0] result_out,
	 output [31:0] registro_2_out,
	 output [10:0] jump_dest_addr_out,
	 output zero_signal_out,
	 output [4:0] reg_dest_out,
	 //Control Signals Output
	 output reg MemToReg_out,
	 output reg RegWrite_out,
	 output reg MemRead_out,
	 output reg MemWrite_out,
	 output reg Branch_out,
	 output reg [2:0] trunk_mode_out
	 );
	
	initial
	begin
	 MemToReg_out = 0;
	 RegWrite_out = 0;
	 MemRead_out = 0;
	 MemWrite_out = 0;
	 Branch_out = 0;
	 trunk_mode_out = 0;
	end
	
	reg  [31:0] out_res = 0;
	reg  [31:0] out_reg = 0;
	reg  [10:0] out_dest_addr = 0;
	reg         out_zero_signal = 0;
	reg  [4:0]  out_reg_dest = 0;

	
	always @(negedge clock)
	begin
		out_res = result_in;
		out_reg = registro_2_in;
		out_dest_addr = jump_dest_addr_in;
		out_zero_signal = zero_signal_in;
		out_reg_dest = reg_dest_in;
		MemToReg_out = MemToReg_in;
		RegWrite_out = RegWrite_in;
		MemRead_out = MemRead_in;
		MemWrite_out = MemWrite_in;
		Branch_out = Branch_in;
		trunk_mode_out = trunk_mode_in;
	end
	
	assign result_out = out_res;
	assign registro_2_out = out_reg;
	assign jump_dest_addr_out = out_dest_addr;
	assign zero_signal_out = out_zero_signal;
	assign reg_dest_out = out_reg_dest;

endmodule
