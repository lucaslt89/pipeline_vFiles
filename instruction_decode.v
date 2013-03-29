`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:36:47 03/29/2013 
// Design Name: 
// Module Name:    instruction_decode 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module instruction_decode(
    input [31:0] instruction,
    input [10:0] current_pc,
    input [31:0] write_back_data,
	 input reg_write,
    input clock,
    output [10:0] jump_dest_addr,
    output [31:0] data_a,
    output [31:0] data_b,
	 output [31:0] sign_extended
    );
	 
	 //registers wires
	 wire [31:0] reg_data_a;
	 wire [31:0] reg_data_b;
	 
	 //sign extension wires
	 wire [31:0] sign_extended_value;
	 
	 registers u_registers (
		 .read_addr_a(instruction[25:21]), 
		 .read_addr_b(instruction[20:16]),
		 .write_address(instruction[15:11]), 
		 .write_data(write_back_data), 
		 .reg_write(reg_write), 
		 .data_a(reg_data_a),
		 .data_b(reg_data_b)
    );
	 
	 sign_extend u_sign_extend(
		.immediate(instruction[15:0]),
		.sign_extended(sign_extended_value)
    );
	 
	 adder u_dest_addr_adder(
		 .old_pc(current_pc),
		 .offset(sign_extended_value),
		 .new_pc(jump_dest_addr)
    );
	 
	 id_ex u_id_ex_register(
		 .data_a_in(reg_data_a),
		 .data_b_in(reg_data_b),
		 .sign_extend_in(sign_extended_value),
		 .clock(clock),
		 .data_a_out(data_a),
		 .data_b_out(data_b),
		 .sign_extend_out(sign_extended)
    );

endmodule
