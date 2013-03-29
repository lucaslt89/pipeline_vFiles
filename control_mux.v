`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:11:47 03/03/2013 
// Design Name: 
// Module Name:    control_mux 
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
module control_mux(
	 input control_valid,
	 
	 input [1:0] alu_op,
	 input branch,
	 input mem_write,
	 input mem_read,
	 input reg_write,
	 input mem_to_reg,
	 input alu_src,
	 input reg_dest,
	 
	 output reg [1:0] alu_op_output,
	 output reg branch_output,
	 output reg mem_write_output,
	 output reg mem_read_output,
	 output reg reg_write_output,
	 output reg mem_to_reg_output,
	 output reg alu_src_output,
	 output reg reg_dest_output
    );
	
	/*
		Aca tenemos que ver cómo vamos a manejar las señales de control. Deberíamos dividir la entrada y la salida
		poniendole los nombres de estos bits para ubicarnos más facil. Las señales que necesitamos son:
		alu_op [1:0]	Determina cuál será la operación a realizar
		branch			Indica si es una operación de salto
		mem_write		Indica si hay que escribir en la memoria
		mem_read			Indica si hay que leer de la memoria
		reg_write		Indica si hay que escribir un registro
		mem_to_reg		Indica si hay que leer de la memoria y escribir en un registro
		alu_src			Controla la fuente de la ALU
		reg_dest			
	*/
	
	always @*
	begin
		if(control_valid)
		begin
			alu_op_output = alu_op;
			branch_output = branch;
			mem_write_output = mem_write;
			mem_read_output = mem_read;
			reg_write_output = reg_write;
			mem_to_reg_output = mem_to_reg;
			alu_src_output = alu_src;
			reg_dest_output = reg_dest;
		end
		else
		begin
			alu_op_output = 0;
			branch_output = 0;
			mem_write_output = 0;
			mem_read_output = 0;
			reg_write_output = 0;
			mem_to_reg_output = 0;
			alu_src_output = 0;
			reg_dest_output = 0;
		end
	end

endmodule
