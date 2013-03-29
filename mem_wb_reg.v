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
	 input [31:0] mem_data,
	 input [10:0] address,
	 input clock,
	 output [31:0] salida_mem,
	 output [10:0] salida_addr
	 );
	
	reg  [31:0] out_mem;
	reg  [10:0] out_addr;
	
	always @(posedge clock)
	begin
		out_mem = mem_data;
	end
	
	
	always @(posedge clock)
	begin
		out_addr = address;
	end
	
	assign salida_mem = out_mem;
	assign salida_addr = out_addr;
	
	
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
