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
	 input Branch,
	 input zero_signal,
    input [31:0] alu_result, 
	 input [31:0] in_data,
	 input [4:0] reg_dest,
	 //Control Signals Input
	 input MemToReg_in,
	 input RegWrite_in,
	 
    output [31:0] read_data_out,
    output [31:0] alu_result_out,
	 output [4:0] reg_dest_out,
	 output PCSrc,
	 //Control Signals Output
	 output MemToReg_out,
	 output RegWrite_out
    );
	 
wire [31:0] mem_out;
	 
data_mem u_data_mem (
    .clock(clock), 
    .address(alu_result[10:0]), 
    .in_data(in_data), 
    .MemWrite(MemWrite), 
	 .MemRead(MemRead),
    .out_data(mem_out)
    );

mem_wb_reg u_mem_wb_reg (
    .mem_data_in(mem_out), 
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
	 
	 assign PCSrc = Branch & zero_signal;
	 
endmodule

 /*   input mem_write,
    input mem_read,
    input wb_entrada,
    output wb_salida,
    input [10:0] address,
	 input clock,
	 input [31:0] in_data,
    input ex_mem_register_rd, //no se que sentido tienen, se puede pasar directo al wb?
    output mem_wb_register_rd,
    output [31:0] mem_data,
    output [31:0] ex_data //igual q el otro, es un cc al final...
    );
	 
	 wire [31:0 ]mem_out; 
	 assign mem_wb_register_rd = ex_mem_register_rd;
	 assign ex_data = in_data;
	 
data_mem u_data_mem (
    .clock(clock), 
    .address(address), 
    .out_data(mem_out),
	 .in_data(in_data),
    .write(mem_write), 
    .read(mem_read)
    );
	 
mem_wb_reg u_mem_wb_reg(
    .entrada(mem_out), 
    .clock(clock), 
    .wb_entrada(wb_entrada), 
    .wb_salida(wb_salida), 
    .salida(mem_data)
    );
*/