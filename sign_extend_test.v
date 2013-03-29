`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:38:46 03/03/2013
// Design Name:   sign_extend
// Module Name:   C:/Practicos Arquitectura/Pipeline/sign_extend_test.v
// Project Name:  Pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sign_extend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sign_extend_test;

	// Inputs
	reg [0:15] immediate;

	// Outputs
	wire [0:31] sign_extended;

	// Instantiate the Unit Under Test (UUT)
	sign_extend uut (
		.immediate(immediate), 
		.sign_extended(sign_extended)
	);

	initial begin
		// Initialize Inputs
		immediate = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		immediate = 16'b00000000_11111111;
		#10
		immediate = 16'b10000000_11111111;

	end
      
endmodule

