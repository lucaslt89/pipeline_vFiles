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
    input [10:0] current_pc_in,
    input [31:0] write_back_data,
	 input [4:0] write_back_address,
	 input RegWrite,
	 input clock,
	 input stall_mux,

    output [10:0] branch_dest_addr,
    output [31:0] data_a,
    output [31:0] data_b,
	 output [31:0] sign_extended,
	 output [4:0] reg_dest_r_type,//rd
	 output [4:0] reg_dest_l_type,//rt
	 output [4:0] reg_dest_s_type,//rs
	 output [4:0] sa, //sa
	 output [10:0] current_pc_out,
	 //Control Signals Output
	 output RegDst_out,
	 output ALUSrc_out,
	 output MemToReg_out,
	 output RegWrite_out,
	 output MemRead_out,
	 output MemWrite_out,
	 output Branch_out,
	 output [1:0] ALUOp_out,
	 output [2:0] trunk_mode_out,
	 output [5:0] op_code_out,
	 output Bne_out,
	 output Jump_out,
	 output [1:0] Jdes_sel_out,

	 //Registers to UART
	 output [31:0] register_0_id_out,
	 output [31:0] register_1_id_out,
	 output [31:0] register_2_id_out,
	 output [31:0] register_3_id_out,
	 output [31:0] register_4_id_out,
	 output [31:0] register_5_id_out,
	 output [31:0] register_6_id_out,
	 output [31:0] register_7_id_out,
	 output [31:0] register_8_id_out,
	 output [31:0] register_9_id_out,
	 output [31:0] register_10_id_out,
	 output [31:0] register_11_id_out,
	 output [31:0] register_12_id_out,
	 output [31:0] register_13_id_out,
	 output [31:0] register_14_id_out,
	 output [31:0] register_15_id_out,
	 output [31:0] register_16_id_out,
	 output [31:0] register_17_id_out,
	 output [31:0] register_18_id_out,
	 output [31:0] register_19_id_out,
	 output [31:0] register_20_id_out,
	 output [31:0] register_21_id_out,
	 output [31:0] register_22_id_out,
	 output [31:0] register_23_id_out,
	 output [31:0] register_24_id_out,
    output [31:0] register_25_id_out,
	 output [31:0] register_26_id_out,
	 output [31:0] register_27_id_out,
	 output [31:0] register_28_id_out,
	 output [31:0] register_29_id_out,
	 output [31:0] register_30_id_out,
	 output [31:0] register_31_id_out
    );

	 //registers wires
	 wire [31:0] reg_data_a;
	 wire [31:0] reg_data_b;

	 //sign extension wires
	 wire [31:0] sign_extended_value;
	 wire [31:0] sign_extended_value_shifted;

	 //branch
	 wire [10:0] branch_dest_addr_aux;

	 //Control Signals Input
	 wire RegDst_in;
	 wire ALUSrc_in;
	 wire MemToReg_in;
	 wire RegWrite_in;
	 wire MemRead_in;
	 wire MemWrite_in;
	 wire Branch_in;
	 wire [1:0] ALUOp_in;
	 wire [2:0] trunk_mode_in;
	 wire Bne_in;
	 wire Jump_in;
	 wire [1:0]Jdes_sel;

	 control_mux u_control_mux (
		 .op_code(instruction[31:26]),
		 .formato(instruction[5:0]),
		 .stall_mux(stall_mux),
		 .RegDst_out(RegDst_in),
		 .ALUSrc_out(ALUSrc_in),
		 .MemToReg_out(MemToReg_in),
		 .RegWrite_out(RegWrite_in),
		 .MemRead_out(MemRead_in),
		 .MemWrite_out(MemWrite_in),
		 .Branch_out(Branch_in),
		 .ALUOp_out(ALUOp_in),
		 .trunk_mode_out(trunk_mode_in),
		 .Bne_out(Bne_in),
		 .Jump(Jump_in),
		 .Jdes_sel(Jdes_sel)
    );

	 registers u_registers (
		 .read_addr_a(instruction[25:21]),
		 .read_addr_b(instruction[20:16]),
		 .write_address(write_back_address),
		 .write_data(write_back_data),
		 .reg_write(RegWrite),
		 .clock(clock),
		 .data_a(reg_data_a),
		 .data_b(reg_data_b),
		 .register_0_id_out(register_0_id_out),
		 .register_1_id_out(register_1_id_out),
		 .register_2_id_out(register_2_id_out),
		 .register_3_id_out(register_3_id_out),
		 .register_4_id_out(register_4_id_out),
		 .register_5_id_out(register_5_id_out),
		 .register_6_id_out(register_6_id_out),
		 .register_7_id_out(register_7_id_out),
		 .register_8_id_out(register_8_id_out),
		 .register_9_id_out(register_9_id_out),
		 .register_10_id_out(register_10_id_out),
		 .register_11_id_out(register_11_id_out),
		 .register_12_id_out(register_12_id_out),
		 .register_13_id_out(register_13_id_out),
		 .register_14_id_out(register_14_id_out),
		 .register_15_id_out(register_15_id_out),
		 .register_16_id_out(register_16_id_out),
		 .register_17_id_out(register_17_id_out),
		 .register_18_id_out(register_18_id_out),
		 .register_19_id_out(register_19_id_out),
		 .register_20_id_out(register_20_id_out),
		 .register_21_id_out(register_21_id_out),
		 .register_22_id_out(register_22_id_out),
		 .register_23_id_out(register_23_id_out),
		 .register_24_id_out(register_24_id_out),
		 .register_25_id_out(register_25_id_out),
		 .register_26_id_out(register_26_id_out),
		 .register_27_id_out(register_27_id_out),
		 .register_28_id_out(register_28_id_out),
		 .register_29_id_out(register_29_id_out),
		 .register_30_id_out(register_30_id_out),
		 .register_31_id_out(register_31_id_out)
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
		 .old_pc(current_pc_in),
		 .offset(sign_extended_value_shifted),
		 .new_pc(branch_dest_addr_aux)
    );

	 id_ex u_id_ex_register(
		 .data_a_in(reg_data_a),
		 .data_b_in(reg_data_b),
		 .sign_extend_in(sign_extended_value),
		 .branch_dest_in(branch_dest_addr_aux),
		 .reg_dest_r_type_in(instruction[15:11]),//rd
		 .reg_dest_l_type_in(instruction[20:16]),//rt
		 .reg_dest_s_type_in(instruction[25:21]),//rs
		 .sa_in(instruction[10:6]),
		 .current_pc_in(current_pc_in),
		 .clock(clock),
		 .data_a_out(data_a),
		 .data_b_out(data_b),
		 .sign_extend_out(sign_extended),
		 .branch_dest_out(branch_dest_addr),
		 .reg_dest_r_type_out(reg_dest_r_type),//rd
		 .reg_dest_l_type_out(reg_dest_l_type),//rt
		 .reg_dest_s_type_out(reg_dest_s_type),//rs
		 .sa_out(sa),
		 .current_pc_out(current_pc_out),
		  //Control Signals Input
		 .RegDst_in(RegDst_in),
		 .ALUSrc_in(ALUSrc_in),
		 .MemToReg_in(MemToReg_in),
		 .RegWrite_in(RegWrite_in),
		 .MemRead_in(MemRead_in),
		 .MemWrite_in(MemWrite_in),
		 .Branch_in(Branch_in),
		 .ALUOp_in(ALUOp_in),
		 .trunk_mode_in(trunk_mode_in),
		 .op_code_in(instruction[31:26]),
		 .Bne_in(Bne_in),
		 .Jump_in(Jump_in),
		 .Jdes_sel_in(Jdes_sel),
		  //Control Signals Output
		 .RegDst_out(RegDst_out),
		 .ALUSrc_out(ALUSrc_out),
		 .MemToReg_out(MemToReg_out),
		 .RegWrite_out(RegWrite_out),
		 .MemRead_out(MemRead_out),
		 .MemWrite_out(MemWrite_out),
		 .Branch_out(Branch_out),
		 .ALUOp_out(ALUOp_out),
		 .trunk_mode_out(trunk_mode_out),
		 .op_code_out(op_code_out),
		 .Bne_out(Bne_out),
		 .Jump_out(Jump_out),
		 .Jdes_sel_out(Jdes_sel_out)
    );

endmodule
