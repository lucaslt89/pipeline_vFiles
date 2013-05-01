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
	reg [31:0] aux;
	
	initial
	begin
		/*
		memoria[0] = 32'b00000_00000_00000_00001_10000_00000_01; 	//load immediate
		memoria[1] = 32'b00000_00000_00000_00000_10000_00000_01;	 	//store acc
		memoria[2] = 32'b00000_00000_00000_00001_10000_00000_11; 	//load immediate
		memoria[3] = 32'b00000_00000_00000_00010_00000_00000_01; 	//add variable
		memoria[4] = 32'b00000_00000_00000_00000_00000_00000_00;		//halt
		*/
		memoria[0] = 32'b00110000_00110000_00110000_00110000;
		memoria[1] = 32'b00110001_00110001_00110001_00110001;
		memoria[2] = 32'b00110010_00110010_00110010_00110010;
		memoria[3] = 32'b00110011_00110011_00110011_00110011;
		memoria[4] = 32'b00110100_00110100_00110100_00110100;
		memoria[5] = 32'b00110101_00110101_00110101_00110101;
		memoria[6] = 32'b00110110_00110110_00110110_00110110;
		memoria[7] = 32'b00110111_00110111_00110111_00110111;
		memoria[8] = 32'b00111000_00111000_00111000_00111000;
		memoria[9] = 32'b00111001_00111001_00111001_00111001;
		memoria[10] = 32'b00111010_00111010_00111010_00111010;
		memoria[11] = 32'b00111011_00111011_00111011_00111011;
		memoria[12] = 32'b00111100_00111100_00111100_00111100;
		memoria[13] = 32'b00111101_00111101_00111101_00111101;
		memoria[14] = 32'b00111110_00111110_00111110_00111110;
		memoria[15] = 32'b00111111_00111111_00111111_00111111;
		for (i = 16; i < 2048; i=i+1)
			memoria[i] = 32'b00110000_00110001_00110010_00110011;
	end
	
	always@(negedge clock)
	begin
		aux = memoria[addr];
	end
	
	assign inst = aux;
endmodule
