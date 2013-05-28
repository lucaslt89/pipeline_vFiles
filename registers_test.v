`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:41:09 03/03/2013
// Design Name:   registers
// Module Name:   C:/Practicos Arquitectura/Pipeline/registers_test.v
// Project Name:  Pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: registers
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module registers_test;

	// Inputs
	reg [4:0] read_addr_a;
	reg [4:0] read_addr_b;
	reg [4:0] write_address;
	reg [31:0] write_data;
	reg reg_write;

	// Outputs
	wire [31:0] data_a;
	wire [31:0] data_b;

	// Instantiate the Unit Under Test (UUT)
	registers uut (
		.read_addr_a(read_addr_a), 
		.read_addr_b(read_addr_b), 
		.write_address(write_address), 
		.write_data(write_data), 
		.reg_write(reg_write), 
		.data_a(data_a), 
		.data_b(data_b)
	);

	initial begin
		// Initialize Inputs
		read_addr_a = 0;
		read_addr_b = 0;
		write_address = 0;
		write_data = 0;
		reg_write = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		reg_write = 1;
		#1
		write_address = 1;
		write_data = 1;
		#1
		write_address = 2;
		write_data = 2;
		#1
		write_address = 3;
		write_data = 3;
		#1
		write_address = 4;
		write_data = 4;
		#1
		write_address = 5;
		write_data = 5;
		#1
		write_address = 6;
		write_data = 6;
		#1
		write_address = 7;
		write_data = 7;
		#1
		write_address = 8;
		write_data = 8;
		#1
		write_address = 9;
		write_data = 9;
		#1
		write_address = 10;
		write_data = 10;
		#1
		write_address = 11;
		write_data = 11;
		#1
		write_address = 12;
		write_data = 12;
		#1
		write_address = 13;
		write_data = 13;
		#1
		write_address = 14;
		write_data = 14;
		#1
		write_address = 15;
		write_data = 15;
		#1
		write_address = 16;
		write_data = 16;
		#1
		write_address = 17;
		write_data = 17;
		#1
		write_address = 18;
		write_data = 18;
		#1
		write_address = 19;
		write_data = 19;
		#1
		write_address = 20;
		write_data = 20;
		#1
		write_address = 21;
		write_data = 21;
		#1
		write_address = 22;
		write_data = 22;
		#1
		write_address = 23;
		write_data = 23;
		#1
		write_address = 24;
		write_data = 24;
		#1
		write_address = 25;
		write_data = 25;
		#1
		write_address = 26;
		write_data = 26;
		#1
		write_address = 27;
		write_data = 27;
		#1
		write_address = 28;
		write_data = 28;
		#1
		write_address = 29;
		write_data = 29;
		#1
		write_address = 30;
		write_data = 30;
      #1
		write_address = 31;
		write_data = 31;
		
		#10
		reg_write = 0;
		read_addr_a = 14;
		read_addr_b = 17;
		#10
		read_addr_a = 20;
		read_addr_b = 31;
		#10
		read_addr_a = 0;
		read_addr_b = 15;
		// Add stimulus here

	end
      
endmodule

