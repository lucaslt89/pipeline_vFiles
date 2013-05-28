`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:20:09 04/17/2013
// Design Name:   alu
// Module Name:   D:/Facultad/Arquitectura de Computadoras/Pipeline/alu_test.v
// Project Name:  Pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_test;

	// Inputs
	reg [31:0] operando_1;
	reg [31:0] operando_2;
	reg [1:0] ALUOp;
	reg [5:0] operation;

	// Outputs
	wire [31:0] result;
	wire zero_signal;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.operando_1(operando_1), 
		.operando_2(operando_2), 
		.ALUOp(ALUOp), 
		.operation(operation), 
		.result(result), 
		.zero_signal(zero_signal)
	);

	initial begin
		// Initialize Inputs
		operando_1 = 0;
		operando_2 = 0;
		ALUOp = 0;
		operation = 0;
		
		// Wait 100 ns for global reset to finish
		#100;
      operando_1 = -2;
		operando_2 = 3;
		// Add stimulus here
		ALUOp = 2'b00;
		#30;
		ALUOp = 2'b01;
		#30;
		ALUOp = 2'b11;
		#30;
		ALUOp = 2'b10;
		//SLL
		operation = 6'b000000;						
		#30;
		//SRL
		operation = 6'b000010;
		#30;
		//SRA
		operation = 6'b000011;
		#30;	
		//SRLV
		operation = 6'b000110;
		#30;
		//SRAV
		operation = 6'b000111;
		#30;
		//ADD
		operation = 6'b100000;
		#30;
		//SLLV
		operation = 6'b000100;
		#30;	
		//SUB
		operation = 6'b100010;
		#30;
		//SLT
		operation = 6'b101010;
		#30;
		//JR //NO SE QUE MIERDA HACE LA ALU				
		operation = 6'b001000;
		#30;	
		//JALR //NO SE QUE MIERDA HACE LA ALU
		operation = 6'b001001;
		#30;	
		//ADDU
		operation = 6'b100001;
		#30;
		//SUBU
		operation = 6'b100011;
		#30;
		//AND
		operation = 6'b100100;
		#30;	
		//OR
		operation = 6'b100101;
		#30;
		//XOR
		operation = 6'b100110;
		#30;
		//SLTU
		operation = 6'b101011;
		#30;
		//NOR
		operation = 6'b100111;
		#30;
	end
      
endmodule

