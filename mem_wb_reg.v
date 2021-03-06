`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:11:34 02/25/2013 
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
module mem_wb_reg(
	 input [31:0] mem_data_in,
	 input [31:0] alu_result_in,
	 input [4:0] reg_dest_in,
	 input clock,
	 //Control Signals Input
	 input MemToReg_in,
	 input RegWrite_in,
	 
	 output reg [31:0] mem_data_out,
	 output reg [31:0] alu_result_out,
	 output reg [4:0] reg_dest_out,
	 //Control Signals Output
	 output reg MemToReg_out,
	 output reg RegWrite_out
	 );
	
	initial
	begin
	 mem_data_out = 0;
	 alu_result_out = 0;
	 reg_dest_out = 0;
	 MemToReg_out = 0;
	 RegWrite_out = 0;
	end
	
	always @(negedge clock)
	begin
		mem_data_out = mem_data_in;
		alu_result_out = alu_result_in;
		reg_dest_out = reg_dest_in;
		MemToReg_out = MemToReg_in;
		RegWrite_out = RegWrite_in;
	end
	
endmodule
