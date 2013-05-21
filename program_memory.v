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
			
		memoria[0] = 32'b000000_00001_00011_00010_00000_100010; 	//SUB r2,  r1, r3   -> r2 = -5
		memoria[1] = 32'b000000_00010_00101_01100_00000_100100;  //AND r12, r2, r5   -> r12 = -5
		memoria[2] = 32'b000000_00110_00010_01101_00000_100101;	//OR 	r13, r6, r2   -> r13 = -1
		memoria[3] = 32'b000000_00010_00010_01110_00000_100000;	//ADD r14, r2, r2   -> r14 = -10
		memoria[4] = 32'b101011_00010_01111_00000_00001_100100;	//SW r15, 100(r2)   -> r15 have 5
		memoria[5] = 32'b000000_00001_00011_00010_00000_100110;  //XOR r2, r1, r3    -> r2 = 5
		memoria[6] = 32'b000000_00011_00010_00001_00000_100111;  //NOR r1, r2, r3    -> r1 = -16
		memoria[7] = 32'b100011_01100_01000_00000_00001_100100;  //LW r8, 100(r12)   -> r8 = 5
		memoria[8] = 32'b000000_00000_00010_00100_00011_000000;  //SLL r4, r2, 3     -> r4 = 40
		memoria[9] = 32'b000000_00000_00110_00111_00001_000010;  //SRL r7, r6, 1     -> r7 = 6
		memoria[10]= 32'b000000_00000_00101_01000_00001_000011;  //SRA r8, r5, 1     -> r8 = -3
		memoria[11]= 32'b000000_01111_01110_01001_00000_000110;  //SRLV r9, r14, r15 -> r9 = 134217727
		memoria[12]= 32'b000000_01111_01110_01010_00000_000111;  //SRAV r10, r14, r15-> r10 = -1
		memoria[13]= 32'b000000_01111_00010_00111_00000_000100;  //SLLV r7, r2, r15  -> r7 = 160
		memoria[14]= 32'b000000_00010_00111_01000_00000_100000;  //ADDU r8, r7, r2   -> r8 = 165
		
		//Not passed yet.
		memoria[15]= 32'b000000_01000_00111_01001_00000_100011;  //SUBU r9, r8, r7   -> r9 = 5
		memoria[16]= 32'b000000_00010_00011_00100_00000_101010;  //SLT r4, r2, r3    -> r4 = 1
		memoria[17]= 32'b000000_00011_00010_00100_00000_101010;  //SLT r4, r3, r2    -> r4 = 0
		
 	end
	
	always@(posedge clock)
	begin
		aux = memoria[addr];
	end
	
	assign inst = aux;
endmodule
