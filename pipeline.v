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
		input clock,
		input rx,
		output tx,
		
		//UART status indicators
		output [3:0] an,
		output [7:0] sseg,
		output pipeline_clock
    );
	 
	 //************* IF *************
	 //Entradas
	 wire PCSrc_IF_in;
	 wire [10:0] pc_salto_IF_in;
	 
	 //Salidas
	 wire [10:0] pc_IF_out;
	 wire [31:0] instruccion_IF_out;
	 wire [10:0] current_pc_debug;

	 //Instanciación
	 instruction_fetch u_instruction_fetch (
		 .pc_salto(pc_salto_IF_in), 
		 .clock(pipeline_clock),
		 .PCSrc(PCSrc_IF_in), 
		 .pc(pc_IF_out), 
		 .instruccion(instruccion_IF_out),
		 .current_pc_debug(current_pc_debug)
    );
	 //******************************
	 
	 //************* ID *************
	 //Entradas
	 wire RegWrite_ID_in;
	 wire [31:0] write_back_data_ID_in;
	 wire [4:0] write_back_address_ID_in;
	 // +Salidas de la etapa IF.
	 
	 //Salidas
	 wire [10:0] jump_dest_addr_ID_out;
	 wire [31:0] data_a_ID_out;
	 wire [31:0] data_b_ID_out;
	 wire [31:0] sign_extended_ID_out;
	 wire [4:0] reg_dest_r_type_ID_out;
	 wire [4:0] reg_dest_l_type_ID_out;
	 
	 //Control Signals Output
	 wire RegDst_ID_out;
	 wire ALUSrc_ID_out;
	 wire MemToReg_ID_out;
	 wire RegWrite_ID_out;
	 wire MemRead_ID_out;
	 wire MemWrite_ID_out;
	 wire Branch_ID_out;
	 wire [1:0] ALUOp_ID_out;
	 
	 //Registros para la UART
	 wire [31:0] register_0_id_out;
	 wire [31:0] register_1_id_out;
	 wire [31:0] register_2_id_out;
	 wire [31:0] register_3_id_out;
	 wire [31:0] register_4_id_out;
	 wire [31:0] register_5_id_out;
	 wire [31:0] register_6_id_out;
	 wire [31:0] register_7_id_out;
	 wire [31:0] register_8_id_out;
	 wire [31:0] register_9_id_out;
	 wire [31:0] register_10_id_out;
	 wire [31:0] register_11_id_out;
	 wire [31:0] register_12_id_out;
	 wire [31:0] register_13_id_out;
	 wire [31:0] register_14_id_out;
	 wire [31:0] register_15_id_out;
	 wire [31:0] register_16_id_out;
	 wire [31:0] register_17_id_out;
	 wire [31:0] register_18_id_out;
	 wire [31:0] register_19_id_out;
	 wire [31:0] register_20_id_out;
	 wire [31:0] register_21_id_out;
	 wire [31:0] register_22_id_out;
	 wire [31:0] register_23_id_out;
	 wire [31:0] register_24_id_out;
    wire [31:0] register_25_id_out;
	 wire [31:0] register_26_id_out;
	 wire [31:0] register_27_id_out;
	 wire [31:0] register_28_id_out;
	 wire [31:0] register_29_id_out;
	 wire [31:0] register_30_id_out;
	 wire [31:0] register_31_id_out;
	 
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
		 .reg_dest_l_type(reg_dest_l_type_ID_out),
		 .RegDst_out(RegDst_ID_out), 
		 .ALUSrc_out(ALUSrc_ID_out), 
		 .MemToReg_out(MemToReg_ID_out), 
		 .RegWrite_out(RegWrite_ID_out), 
		 .MemRead_out(MemRead_ID_out), 
		 .MemWrite_out(MemWrite_ID_out), 
		 .Branch_out(Branch_ID_out), 
		 .ALUOp_out(ALUOp_ID_out),
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
	 //******************************
	 
	 //************* EX *************
	 // TODO: Voy por el registro de esta etapa
	 //Entradas
	 // +Las salidas de la etapa ID.
	 
	 //Salidas
	 wire [31:0] result_EX_out;
	 wire [31:0] registro_2_EX_out;
	 wire [4:0] reg_dest_EX_out;
	 wire zero_signal_EX_out;
	 
	 //Control Signals Output
	 wire MemToReg_EX_out;
	 wire RegWrite_EX_out;
	 wire MemRead_EX_out;
	 wire MemWrite_EX_out;
	 wire Branch_EX_out;
	 
	 //Instanciación
	 execute u_execute (
		 .clock(clock), 
		 .ALUSrc(ALUSrc_ID_out), 
		 .RegDst(RegDst_ID_out), 
		 .ALUOp(ALUOp_ID_out), 
		 .registro_1(data_a_ID_out), 
		 .registro_2(data_b_ID_out), 
		 .sign_extend(sign_extended_ID_out), 
		 .jump_dest_addr(jump_dest_addr_ID_out), 
		 .reg_dest_r_type(reg_dest_r_type_ID_out), 
		 .reg_dest_l_type(reg_dest_l_type_ID_out), 
		 .MemToReg_in(MemToReg_ID_out), 
		 .RegWrite_in(RegWrite_ID_out), 
		 .MemRead_in(MemRead_ID_out), 
		 .MemWrite_in(MemWrite_ID_out), 
		 .Branch_in(Branch_ID_out),
		 .result_out(result_EX_out), 
		 .registro_2_out(registro_2_EX_out), 
		 .reg_dest_out(reg_dest_EX_out), 
		 .jump_dest_addr_out(pc_salto_IF_in), 
		 .zero_signal_out(zero_signal_EX_out),
		 .MemToReg_out(MemToReg_EX_out), 
		 .RegWrite_out(RegWrite_EX_out), 
		 .MemRead_out(MemRead_EX_out), 
		 .MemWrite_out(MemWrite_EX_out), 
		 .Branch_out(Branch_EX_out)
    );
	 //******************************
	 
	 //************* MEM *************
	 //Entradas
	 //Salidas de la etapa EX.
	 
	 //Salidas
	 wire [31:0] read_data_MEM_out;
	 wire [31:0] alu_result_MEM_out;
	 
	 //Control Signals Output
	 wire MemToReg_MEM_out;
	  
	 //Instanciación
	 memory_access u_memory_access (
		 .clock(clock), 
		 .MemWrite(MemWrite_EX_out),
		 .MemRead(MemRead_EX_out), 		 
		 .Branch(Branch_EX_out), 
		 .zero_signal(zero_signal_EX_out), 
		 .alu_result(result_EX_out), 
		 .in_data(registro_2_EX_out), 
		 .reg_dest(reg_dest_EX_out),
		 .MemToReg_in(MemToReg_EX_out), 
		 .RegWrite_in(RegWrite_EX_out),		 
		 .read_data_out(read_data_MEM_out), 
		 .alu_result_out(alu_result_MEM_out), 
		 .reg_dest_out(write_back_address_ID_in), 
		 .PCSrc(PCSrc_IF_in),
		 .MemToReg_out(MemToReg_MEM_out), 
		 .RegWrite_out(RegWrite_ID_in)
    );
	 //*******************************
	 
	 //************* WB *************
	 //Entradas
	 //Salidas de la etapa MEM
	 
	 //Instanciación
	 write_back u_write_back (
		 .MemToReg(MemToReg_MEM_out), 
		 .mem_data(read_data_MEM_out), 
		 .ex_data(alu_result_MEM_out), 
		 .wb_out(write_back_data_ID_in)
    );
	 //******************************
	 
	 //********** Debug Unit ********
	 //Entradas
	 //Entradas de las etapas previas
	 
	 //Declaración de señales
	 wire fifo_empty;
	 
	 uart debug_unit (
		.clk(clock),
		.reset(reset), 
		.rx(rx), 
		.rx_empty(fifo_empty), 
		.tx(tx), 
		.clock_status(pipeline_clock),
		
		//Debug signals for IF.
		.current_pc(current_pc_debug),
		.pc_if_out(pc_IF_out),
		.instruccion_if_out(instruccion_IF_out),
	 
		//Debugging signals for ID
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
		.register_31_id_out(register_31_id_out), 
		.data_a_id_out(data_a_ID_out), 
		.data_b_id_out(data_b_ID_out), 
		.sign_extend_id_out(sign_extended_ID_out), 
		.jump_dest_id_out(jump_dest_addr_ID_out), 
		.reg_dest_r_type_id_out(reg_dest_r_type_ID_out), 
		.reg_dest_l_type_id_out(reg_dest_l_type_ID_out), 
		.RegDst_id_out(RegDst_ID_out), 
		.ALUSrc_id_out(ALUSrc_ID_out), 
		.MemToReg_id_out(MemToReg_ID_out), 
		.RegWrite_id_out(RegWrite_ID_out), 
		.MemRead_id_out(MemRead_ID_out), 
		.MemWrite_id_out(MemWrite_ID_out), 
		.Branch_id_out(Branch_ID_out), 
		.ALUOp_id_out(ALUOp_ID_out),
	 
		//Debugging signals for IE
		.result_ie_out(result_EX_out), 
		.registro_2_ie_out(registro_2_EX_out), 
		.jump_dest_addr_ie_out(pc_salto_IF_in), 
		.zero_signal_ie_out(zero_signal_EX_out), 
		.reg_dest_ie_out(reg_dest_EX_out), 
		.MemToReg_ie_out(MemToReg_EX_out), 
		.RegWrite_ie_out(RegWrite_EX_out), 
		.MemRead_ie_out(MemRead_EX_out), 
		.MemWrite_ie_out(MemWrite_EX_out), 
		.Branch_ie_out(Branch_EX_out),
	 
		//Debugging signals for MEM
		.mem_data_mem_out(read_data_MEM_out), 
		.alu_result_mem_out(alu_result_MEM_out), 
		.reg_dest_mem_out(write_back_address_ID_in), 
		.MemToReg_mem_out(MemToReg_MEM_out), 
		.RegWrite_mem_out(RegWrite_ID_in)
    );
	 
	 assign an = 4'b1110;
	 assign sseg = {4'b1111, ~fifo_empty, 3'b111};
	 //******************************

endmodule
