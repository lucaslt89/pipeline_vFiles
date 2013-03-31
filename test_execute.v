`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:47:57 03/29/2013
// Design Name:   execute
// Module Name:   D:/Facultad/Arquitectura de Computadoras/Pipeline/test_execute.v
// Project Name:  TrabajoFinal
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: execute
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_execute;

	// Inputs
	reg clock;
	reg sel;
	reg [31:0] registro_1;
	reg [31:0] registro_2;
	reg [31:0] sign_extend;
	reg op;

	// Outputs
	wire [31:0] result;
	wire [31:0] registro_2_out;

	// Instantiate the Unit Under Test (UUT)
	execute uut (
		.clock(clock), 
		.sel(sel), 
		.registro_1(registro_1), 
		.registro_2(registro_2), 
		.sign_extend(sign_extend), 
		.op(op), 
		.result(result), 
		.registro_2_out(registro_2_out)
	);
	
	always #1 clock = ~clock;
	
	initial begin
		// Initialize Inputs
		clock = 0;
		sel = 0;
		registro_1 = 0;
		registro_2 = 0;
		sign_extend = 0;
		op = 0;

		// Wait 100 ns for global reset to finish
		#100;
       
		registro_1 = 32'b10;
		registro_2 = 32'b10;
		sign_extend = 32'b100;
		#2;
		op=1;
		#2;
		sel=1;
		#2;
		op=0;
		#2;
		// Add stimulus here

	end
      
endmodule

