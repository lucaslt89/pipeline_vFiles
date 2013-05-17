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
	reg [31:0] aux = 0;
	
	initial
	begin
		for (i = 0; i < 2048; i=i+1)
			memoria[i] = 32'b00000000_00000000_00000000_00000000;
		memoria[0] = 32'b000000_00001_00011_00010_00000_100010; 	//SUB r2,  r1, r3
		memoria[1] = 32'b000000_00010_00101_01100_00000_100100;  //AND r12, r2, r5
		memoria[2] = 32'b000000_00110_00010_01101_00000_100101;	//OR 	r13, r6, r2
		memoria[3] = 32'b000000_00010_00010_01110_00000_100000;	//ADD r14, r2, r2
		memoria[4] = 32'b101011_00010_01111_00000_00001_100100;	//SW r15, 100(r2)
	end
	
	always@(posedge clock)
	begin
		aux = memoria[addr];
	end
	
	assign inst = aux;
endmodule
