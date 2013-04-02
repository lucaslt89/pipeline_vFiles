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
	 input [4:0] write_back_address,
	 input RegWrite,
    input clock,
    output [10:0] jump_dest_addr,
    output [31:0] data_a,
    output [31:0] data_b,
	 output [31:0] sign_extended,
	 output [4:0] reg_dest_r_type,
	 output [4:0] reg_dest_l_type
    );
	 
	 //registers wires
	 wire [31:0] reg_data_a;
	 wire [31:0] reg_data_b;
	 
	 //sign extension wires
	 wire [31:0] sign_extended_value;
	 wire [31:0] sign_extended_value_shifted;
	 
	 //jump
	 wire [10:0] jump_dest_addr_aux;
	 
	 registers u_registers (
		 .read_addr_a(instruction[25:21]), 
		 .read_addr_b(instruction[20:16]),
		 .write_address(write_back_address),
		 .write_data(write_back_data), 
		 .reg_write(RegWrite), 
		 .data_a(reg_data_a),
		 .data_b(reg_data_b)
    );
	 
	 sign_extend u_sign_extend(
		.immediate(instruction[15:0]),
		.sign_extended(sign_extended_value)
    );
	 
	 sign_extend_shift u_sign_extend_shift(
		.sign_extend(sign_extended_value),
		.sign_extend_shifted(sign_extended_value_shifted)
    );
	 
	 adder u_dest_addr_adder(
		 .old_pc(current_pc),
		 .offset(sign_extended_value_shifted),
		 .new_pc(jump_dest_addr_aux)
    );
	 
	 id_ex u_id_ex_register(
		 .data_a_in(reg_data_a),
		 .data_b_in(reg_data_b),
		 .sign_extend_in(sign_extended_value),
		 .jump_dest_in(jump_dest_addr_aux),
		 .reg_dest_r_type_in(instruction[15:11]),
		 .reg_dest_l_type_in(instruction[20:16]),
		 .clock(clock),
		 .data_a_out(data_a),
		 .data_b_out(data_b),
		 .sign_extend_out(sign_extended),
		 .jump_dest_out(jump_dest_addr),
		 .reg_dest_r_type_out(reg_dest_r_type),
		 .reg_dest_l_type_out(reg_dest_l_type)
    );

endmodule
