`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:37:33 02/24/2013 
// Design Name: 
// Module Name:    pc 
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
module pc(
	 input [10:0] entrada,
	 input clock,
	 input PCWrite,
	 output [10:0] salida
	 );
	 
	reg [10:0] pc_aux = 11'b000000_00000;
	
	always @(posedge clock)
	begin
		if(PCWrite)
			pc_aux = entrada;
		else
			pc_aux = pc_aux;
	end
	
	assign salida = pc_aux;

endmodule
