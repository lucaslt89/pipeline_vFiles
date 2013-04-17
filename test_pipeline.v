`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:09:40 04/17/2013
// Design Name:   pipeline
// Module Name:   D:/Facultad/Arquitectura de Computadoras/Pipeline/test_pipeline.v
// Project Name:  Pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pipeline
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_pipeline;

	// Inputs
	reg clock;

	// Instantiate the Unit Under Test (UUT)
	pipeline uut (
		.clock(clock)
	);

	initial begin
		// Initialize Inputs
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

