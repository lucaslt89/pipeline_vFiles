`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:57:07 03/29/2013
// Design Name:   instruction_decode
// Module Name:   D:/Practicos Arquitectura/Pipeline/insruction_decode_test.v
// Project Name:  TrabajoFinal
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: instruction_decode
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module insruction_decode_test;

	// Inputs
	reg [31:0] instruction;
	reg [10:0] current_pc;
	reg [31:0] write_back_data;
	reg reg_write;
	reg clock;

	// Outputs
	wire [10:0] jump_dest_addr;
	wire [31:0] data_a;
	wire [31:0] data_b;
	wire [31:0] sign_extended;

	// Instantiate the Unit Under Test (UUT)
	instruction_decode uut (
		.instruction(instruction), 
		.current_pc(current_pc), 
		.write_back_data(write_back_data), 
		.reg_write(reg_write), 
		.clock(clock), 
		.jump_dest_addr(jump_dest_addr), 
		.data_a(data_a), 
		.data_b(data_b), 
		.sign_extended(sign_extended)
	);

	always #1 clock = ~clock;

	initial begin
		// Initialize Inputs
		instruction = 0;
		current_pc = 0;
		write_back_data = 0;
		reg_write = 0;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		//Escribo el valor 5 en el registro 0 y 10 en el registro 1.
		reg_write = 1;
		write_back_data = 5;
		instruction = 32'b000000_00000_00000_00000_00000_000000;
		
		#2;
		
		write_back_data = 10;
		instruction = 32'b000000_00000_00000_00001_00000_000000;
		
		#2;
		
		//data_a = reg[0] and data_b = reg[1]
		reg_write = 0;
		instruction = 32'b000000_00000_00001_00000_00000_000000;
		
		#2;
		
		//Pruebo el cálculo de la destination address.
		current_pc = 5;
		instruction = 32'b000000_00000_00000_00000_00000_000001;
        
		// Add stimulus here

	end
      
endmodule

