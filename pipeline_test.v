`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:45:59 05/17/2013
// Design Name:   pipeline
// Module Name:   D:/Facultad/Arquitectura de Computadoras/Pipeline/pipeline_test.v
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
// Additional Comments: Para correr el test se debe cambiar el clock del pipeline por pipeline_clock, y comentar la declaracion del wire
//								Comentar .status_clock(pipeline_clock) de la debug unit
//
////////////////////////////////////////////////////////////////////////////////

module pipeline_test;

	// Inputs
	reg pipeline_clock;
	reg rx;

	// Outputs
	wire tx;
	wire [3:0] an;
	wire [7:0] sseg;
	wire [7:0] leds;

	// Instantiate the Unit Under Test (UUT)
	pipeline uut (
		.pipeline_clock(pipeline_clock), 
		.rx(rx), 
		.tx(tx), 
		.an(an), 
		.sseg(sseg), 
		.leds(leds)
	);
	
	always #5 pipeline_clock = ~pipeline_clock;
	
	initial begin
		// Initialize Inputs
		pipeline_clock = 0;
		rx = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

