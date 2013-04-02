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
	 output reg [31:0] mem_data_out,
	 output reg [31:0] alu_result_out,
	 output reg [4:0] reg_dest_out
	 );
	
	always @(posedge clock)
	begin
		mem_data_out = mem_data_in;
		alu_result_out = alu_result_in;
		reg_dest_out = reg_dest_in;
	end
	
endmodule

/*
    input [32:0] entrada,
    input clock,
    input wb_entrada,
    output wb_salida,
    output [32:0] salida
    );
	
	reg  [32:0] out;
	reg wb;
	
	always @(posedge clock)
	begin
		out = entrada;
		wb = wb_entrada;
	end
	
	assign salida = out;
	assign wb_salida = wb;
*/
