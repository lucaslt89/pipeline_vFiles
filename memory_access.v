`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:04:37 02/25/2013 
// Design Name: 
// Module Name:    memory_access 
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
module memory_access(
	 input clock,
	 input MemWrite,
	 input MemRead,
	 input [2:0] trunk_mode,
    input [31:0] alu_result, 
	 input [31:0] in_data,
	 input [4:0] reg_dest,
	 //Control Signals Input
	 input MemToReg_in,
	 input RegWrite_in,
	 
    output [31:0] read_data_out,
    output [31:0] alu_result_out,
	 output [4:0] reg_dest_out,
	 //Control Signals Output
	 output MemToReg_out,
	 output RegWrite_out
    );
	 
wire [31:0] mem_out;
wire [31:0] trunked_in_data;
wire [31:0] trunked_mem_readed_data;

//in_data and out_data should be wires outgoing from trunk_unit instances

trunk_unit u_trunk_unit_read_data (
	  .trunk_mode(trunk_mode),
     .original_value(in_data),
     .trunked_value(trunked_in_data)
	 );

trunk_unit u_trunk_unit_mem_data (
	  .trunk_mode(trunk_mode),
     .original_value(mem_out),
     .trunked_value(trunked_mem_readed_data)
	 );
	 
data_mem u_data_mem (
    .clock(clock), 
    .address(alu_result[10:0]), 
    .in_data(trunked_in_data),
    .MemWrite(MemWrite), 
	 .MemRead(MemRead),
    .out_data(mem_out)
    );

mem_wb_reg u_mem_wb_reg (
    .mem_data_in(trunked_mem_readed_data),
    .alu_result_in(alu_result), 
    .reg_dest_in(reg_dest), 
    .clock(clock), 
    .mem_data_out(read_data_out), 
    .alu_result_out(alu_result_out), 
    .reg_dest_out(reg_dest_out),
	 
    .MemToReg_in(MemToReg_in), 
    .RegWrite_in(RegWrite_in), 

    .MemToReg_out(MemToReg_out), 
    .RegWrite_out(RegWrite_out)
    );
	 
endmodule
