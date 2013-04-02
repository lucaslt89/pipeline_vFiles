`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:45:04 04/02/2013 
// Design Name: 
// Module Name:    pipeline 
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
module pipeline(
		input clock
		//Otras entradas deberían ser todas las señales de control.
    );
	 
	 //************* IF *************
	 //Entradas
	 wire PCSrc_IF_in;
	 wire [10:0] pc_salto_IF_in;
	 
	 //Salidas
	 wire [10:0] pc_IF_out;
	 wire [31:0] instruccion_IF_out;

	 //Instanciación
	 instruction_fetch u_instruction_fetch (
		 .pc_salto(pc_salto_IF_in), 
		 .clock(clock), 
		 .PCSrc(PCSrc_IF_in), 
		 .pc(pc_IF_out), 
		 .instruccion(instruccion_IF_out)
    );
	 //******************************
	 
	 //************* ID *************
	 //Entradas
	 wire RegWrite_ID_in;
	 wire [31:0] write_back_data_ID_in;
	 wire [4:0] write_back_address_ID_in;
	 
	 //Salidas
	 wire [10:0] jump_dest_addr_ID_out;
	 wire [31:0] data_a_ID_out;
	 wire [31:0] data_b_ID_out;
	 wire [31:0] sign_extended_ID_out;
	 wire [4:0] reg_dest_r_type_ID_out;
	 wire [4:0] reg_dest_l_type_ID_out;
	 
	 //Instanciación
	 instruction_decode u_instruction_decode (
		 .instruction(instruccion_IF_out), 
		 .current_pc(pc_IF_out), 
		 .write_back_data(write_back_data_ID_in), 
		 .write_back_address(write_back_address_ID_in), 
		 .RegWrite(RegWrite_ID_in),
		 .clock(clock), 
		 .jump_dest_addr(jump_dest_addr_ID_out), 
		 .data_a(data_a_ID_out), 
		 .data_b(data_b_ID_out), 
		 .sign_extended(sign_extended_ID_out), 
		 .reg_dest_r_type(reg_dest_r_type_ID_out), 
		 .reg_dest_l_type(reg_dest_l_type_ID_out)
    );
	 //******************************
	 
	 //************* EX *************
	 //Entradas
	 wire ALUSrc_EX_in;
	 wire ALUOp_EX_in;
	 wire RegDst_EX_in;
	 
	 //Salidas
	 wire [31:0] result_EX_out;
	 wire [31:0] registro_2_EX_out;
	 wire [4:0] reg_dest_EX_out;
	 wire zero_signal_EX_out;
	 
	 //Instanciación
	 execute u_execute (
		 .clock(clock), 
		 .ALUSrc(ALUSrc_EX_in), 
		 .RegDst(RegDst_EX_in), 
		 .ALUOp(ALUOp_EX_in), 
		 .registro_1(data_a_ID_out), 
		 .registro_2(data_b_ID_out), 
		 .sign_extend(sign_extended_ID_out), 
		 .jump_dest_addr(jump_dest_addr_ID_out), 
		 .reg_dest_r_type(reg_dest_r_type_ID_out), 
		 .reg_dest_l_type(reg_dest_l_type_ID_out), 
		 .result_out(result_EX_out), 
		 .registro_2_out(registro_2_EX_out), 
		 .reg_dest_out(reg_dest_EX_out), 
		 .jump_dest_addr_out(pc_salto_IF_in), 
		 .zero_signal_out(zero_signal_EX_out)
    );
	 //******************************
	 
	 //************* MEM *************
	 //Entradas
	 wire MemWrite_MEM_in;
	 wire Branch_MEM_in;
	 
	 //Salidas
	 wire [31:0] read_data_MEM_out;
	 wire [31:0] alu_result_MEM_out;
	 	 
	 //Instanciación
	 memory_access u_memory_access (
		 .clock(clock), 
		 .MemWrite(MemWrite_MEM_in), 
		 .Branch(Branch_MEM_in), 
		 .zero_signal(zero_signal_EX_out), 
		 .alu_result(result_EX_out), 
		 .in_data(registro_2_EX_out), 
		 .reg_dest(reg_dest_EX_out), 
		 .read_data_out(read_data_MEM_out), 
		 .alu_result_out(alu_result_MEM_out), 
		 .reg_dest_out(write_back_address_ID_in), 
		 .PCSrc(PCSrc_IF_in)
    );
	 //*******************************
	 
	 //************* WB *************
	 //Entradas
	 wire MemToReg_WB_in;
	 
	 //Salidas
	 
	 //Instanciación
	 write_back u_write_back (
		 .MemToReg(MemToReg_WB_in), 
		 .mem_data(read_data_MEM_out), 
		 .ex_data(alu_result_MEM_out), 
		 .wb_out(write_back_data_ID_in)
    );
	 //******************************

endmodule
