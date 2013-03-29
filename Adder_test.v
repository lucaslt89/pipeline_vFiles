`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:40:53 03/03/2013
// Design Name:   adder
// Module Name:   C:/Practicos Arquitectura/Pipeline/adder_test.v
// Project Name:  Pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module adder_test;

	// Inputs
	reg [0:31] old_pc;
	reg [0:31] offset;

	// Outputs
	wire [0:31] new_pc;

	// Instantiate the Unit Under Test (UUT)
	adder uut (
		.old_pc(old_pc), 
		.offset(offset), 
		.new_pc(new_pc)
	);

	initial begin
		// Initialize Inputs
		old_pc = 0;
		offset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		old_pc = 5;
		offset = 10;
		
		#10
		
		old_pc = 20;
		offset = 4;
	end
      
endmodule

