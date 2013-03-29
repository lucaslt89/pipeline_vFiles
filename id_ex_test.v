`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:47:18 03/29/2013
// Design Name:   id_ex
// Module Name:   D:/Practicos Arquitectura/Pipeline/id_ex_test.v
// Project Name:  TrabajoFinal
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: id_ex
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module id_ex_test;

	// Inputs
	reg [31:0] data_a_in;
	reg [31:0] data_b_in;
	reg [31:0] sign_extend_in;
	reg clock;

	// Outputs
	wire [31:0] data_a_out;
	wire [31:0] data_b_out;
	wire [31:0] sign_extend_out;

	// Instantiate the Unit Under Test (UUT)
	id_ex uut (
		.data_a_in(data_a_in), 
		.data_b_in(data_b_in), 
		.sign_extend_in(sign_extend_in), 
		.clock(clock), 
		.data_a_out(data_a_out), 
		.data_b_out(data_b_out), 
		.sign_extend_out(sign_extend_out)
	);

	always #1 clock = ~clock;

	initial begin
		// Initialize Inputs
		data_a_in = 0;
		data_b_in = 0;
		sign_extend_in = 0;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		data_a_in = 5;
		data_b_in = 10;
		sign_extend_in = 15;
		#2;
        
		// Add stimulus here

	end
      
endmodule

