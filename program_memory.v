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
		
		//Dependencias de registros, forwarding unit
		memoria[0] = 32'b000000_00001_00011_00010_00000_100010; 	//SUB r2,  r1, r3
		memoria[1] = 32'b000000_00010_00101_01100_00000_100100;  //AND r12, r2, r5
		memoria[2] = 32'b000000_00110_00010_01101_00000_100101;	//OR 	r13, r6, r2
		memoria[3] = 32'b000000_00010_00010_01110_00000_100000;	//ADD r14, r2, r2
		memoria[4] = 32'b101011_00001_01111_00000_00000_010100;	//SW r15, 20(r1)
		//Dependencias de memoria, hazard detection unit
		memoria[5] = 32'b100011_00001_00010_00000_00000_010100; 	//LW r2,  20(r1)
		memoria[6] = 32'b000000_00010_00101_00100_00000_100100;  //AND r4, r2, r5
		memoria[7] = 32'b000000_00010_00110_01000_00000_100101;	//OR 	r8, r2, r6
		memoria[8] = 32'b000000_00100_00010_01001_00000_100000;	//ADD r9, r4, r2
		memoria[9] = 32'b000000_00110_00111_00001_00000_101010;	//SLT r1, r6, r7
	end
	
	always@(posedge clock)
	begin
		aux = memoria[addr];
	end
	
	assign inst = aux;
endmodule
