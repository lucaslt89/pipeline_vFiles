`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:20:06 04/01/2013
// Design Name:   execute
// Module Name:   D:/Practicos Arquitectura/Pipeline/execute_test.v
// Project Name:  Pipeline
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

module execute_test;

	// Inputs
	reg clock;
	reg ALUSrc;
	reg RegDst;
	reg ALUOp;
	reg [31:0] registro_1;
	reg [31:0] registro_2;
	reg [31:0] sign_extend;
	reg [10:0] jump_dest_addr;
	reg [4:0] reg_dest_r_type;
	reg [4:0] reg_dest_l_type;

	// Outputs
	wire [31:0] result_out;
	wire [31:0] registro_2_out;
	wire [4:0] reg_dest_out;
	wire [10:0] jump_dest_addr_out;
	wire zero_signal_out;

	// Instantiate the Unit Under Test (UUT)
	execute uut (
		.clock(clock), 
		.ALUSrc(ALUSrc), 
		.RegDst(RegDst), 
		.ALUOp(ALUOp), 
		.registro_1(registro_1), 
		.registro_2(registro_2), 
		.sign_extend(sign_extend), 
		.jump_dest_addr(jump_dest_addr), 
		.reg_dest_r_type(reg_dest_r_type), 
		.reg_dest_l_type(reg_dest_l_type), 
		.result_out(result_out), 
		.registro_2_out(registro_2_out), 
		.reg_dest_out(reg_dest_out), 
		.jump_dest_addr_out(jump_dest_addr_out), 
		.zero_signal_out(zero_signal_out)
	);
	
	always #1 clock = ~clock;

	initial begin
		// Initialize Inputs
		clock = 0;
		ALUSrc = 0;
		RegDst = 0;
		ALUOp = 0;
		registro_1 = 0;
		registro_2 = 0;
		sign_extend = 0;
		jump_dest_addr = 0;
		reg_dest_r_type = 0;
		reg_dest_l_type = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
      registro_1 = 32'b10;
		registro_2 = 32'b10;
		sign_extend = 32'b100;
		#2;
		ALUOp=1;
		#2;
		ALUSrc=1;
		#2;
		ALUOp=0;
		#2;
		// Add stimulus here

	end
      
endmodule

