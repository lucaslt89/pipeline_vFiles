`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:43:08 03/29/2013
// Design Name:   instruction_fetch
// Module Name:   D:/Facultad/Arquitectura de Computadoras/Pipeline/test_fetch.v
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

module test_fetch;

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
        
		// Add stimulus here

	end
      
endmodule

