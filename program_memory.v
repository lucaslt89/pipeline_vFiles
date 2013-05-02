`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:38:51 11/14/2012 
// Design Name: 
// Module Name:    program_memory 
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
// En vez de hacer una memoria de 8bits y tener que avanzar el pc de a 4 hago una memoria de 32 y avanzo de a 1
//	entonces no necesito el sumador +4.
//////////////////////////////////////////////////////////////////////////////////
module inst_mem(
    input [10:0] addr,
	 input clock,
    output [31:0] inst
	 //input salida del hazard detection unit
    );
	
	integer i;
	reg [31:0] memoria [0:2047];
	reg [31:0] aux  = 0;
	
	initial
	begin
		memoria[0] = 32'b00000000_00000001_00011000_00100001; 	
		for (i = 1; i < 2048; i=i+1)
			memoria[i] = 32'b00000_00000_00000_00000_00000_00000_00;
	end
	
	always@(posedge clock)
	begin
		aux = memoria[addr];
	end
	
	assign inst = aux;
endmodule
