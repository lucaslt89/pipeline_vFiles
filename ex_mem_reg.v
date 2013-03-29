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
	 input [31:0] result,
	 input [31:0] registro_2, 
	 input clock,
	 output [31:0] salida_result,
	 output [31:0] salida_registro_2
	 );
	
	reg  [31:0] out_res;
	reg  [31:0] out_reg;
	
	always @(posedge clock)
	begin
		out_res = result;
	end
	
	
	always @(posedge clock)
	begin
		out_reg = registro_2;
	end
	
	assign salida_result = out_res;
	assign salida_registro_2 = out_reg;

	
endmodule
