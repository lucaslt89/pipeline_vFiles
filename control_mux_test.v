`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:51:20 03/03/2013
// Design Name:   control_mux
// Module Name:   C:/Practicos Arquitectura/Pipeline/control_mux_test.v
// Project Name:  Pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: control_mux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module control_mux_test;

	// Inputs
	reg [8:0] control_bits;
	reg control_valid;

	// Outputs
	wire [8:0] control_bits_output;

	// Instantiate the Unit Under Test (UUT)
	control_mux uut (
		.control_bits(control_bits), 
		.control_valid(control_valid), 
		.control_bits_output(control_bits_output)
	);

	initial begin
		// Initialize Inputs
		control_bits = 0;
		control_valid = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

