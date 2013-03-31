`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:15:32 03/29/2013
// Design Name:   instruction_fetch
// Module Name:   D:/Facultad/Arquitectura de Computadoras/Pipeline/test_instruction_fetch.v
// Project Name:  TrabajoFinal
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: instruction_fetch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_instruction_fetch;

	// Inputs
	reg [10:0] pc_salto;
	reg clock;
	reg salto_sel;

	// Outputs
	wire [10:0] pc;
	wire [31:0] instruccion;

	// Instantiate the Unit Under Test (UUT)
	instruction_fetch uut (
		.pc_salto(pc_salto), 
		.clock(clock), 
		.salto_sel(salto_sel), 
		.pc(pc), 
		.instruccion(instruccion)
	);
	
	always #1 clock = ~clock;

	initial begin
		// Initialize Inputs
		pc_salto = 0;
		clock = 0;
		salto_sel = 0;

		// Wait 100 ns for global reset to finish
		#300;
      pc_salto = 11'b00000000010;
		salto_sel=1;
		// Add stimulus here
		#2
		salto_sel=0;

	end
      
endmodule

