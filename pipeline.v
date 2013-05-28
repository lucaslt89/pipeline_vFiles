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
		output [7:0] leds
    );

	 wire pipeline_clock;

	 //************* IF *************
	 //Entradas
	 wire PCSrc_IF_in;
	 wire [10:0] pc_salto_IF_in;
	 wire PCWrite;
	 wire IF_ID_Write;
	 wire IF_Flush;

	 //Salidas
	 wire [10:0] pc_IF_out;
	 wire [31:0] instruccion_IF_out;
	 wire [7:0] current_pc_debug;

	 //Instanciaci�n
	 instruction_fetch u_instruction_fetch (
		 .pc_salto(pc_salto_IF_in),
		 .clock(pipeline_clock),
		 .PCSrc(PCSrc_IF_in),
		 .PCWrite(PCWrite),
		 .IF_ID_Write(IF_ID_Write),
		 .IF_Flush(IF_Flush),
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
	 wire stall_mux;
	 // +Salidas de la etapa IF.

	 //Salidas
	 wire [31:0] data_a_ID_out;
	 wire [31:0] data_b_ID_out;
	 wire [31:0] sign_extended_ID_out;
	 wire [4:0] reg_dest_r_type_ID_out;
	 wire [4:0] reg_dest_l_type_ID_out;
	 wire [4:0] reg_dest_s_type_ID_out;
	 wire [4:0] sa_ID_out;
	 wire [10:0] branch_dest_addr;
	 wire [10:0] current_pc_ID_out;

	 //Control Signals Output
	 wire RegDst_ID_out;
	 wire ALUSrc_ID_out;
	 wire MemToReg_ID_out;
	 wire RegWrite_ID_out;
	 wire MemRead_ID_out;
	 wire MemWrite_ID_out;
	 wire branch_ID_out;
	 wire [1:0] ALUOp_ID_out;
	 wire [2:0] trunk_mode_ID_out;
	 wire [5:0] op_code_ID_out;
	 wire Bne_ID_out;
	 wire Jump_ID_out;
	 wire [1:0]sel_dire_salto;

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

	 //Instanciaci�n
	 instruction_decode u_instruction_decode (
		 .instruction(instruccion_IF_out),
		 .current_pc_in(pc_IF_out),
		 .write_back_data(write_back_data_ID_in),
		 .write_back_address(write_back_address_ID_in),
		 .RegWrite(RegWrite_ID_in),
		 .clock(pipeline_clock),
		 .stall_mux(stall_mux),
		 .branch_dest_addr(branch_dest_addr),
		 .data_a(data_a_ID_out),
		 .data_b(data_b_ID_out),
		 .sign_extended(sign_extended_ID_out),
		 .reg_dest_r_type(reg_dest_r_type_ID_out),
		 .reg_dest_l_type(reg_dest_l_type_ID_out),
		 .reg_dest_s_type(reg_dest_s_type_ID_out),
		 .sa(sa_ID_out),
		 .current_pc_out(current_pc_ID_out),
		 .RegDst_out(RegDst_ID_out),
		 .ALUSrc_out(ALUSrc_ID_out),
		 .MemToReg_out(MemToReg_ID_out),
		 .RegWrite_out(RegWrite_ID_out),
		 .MemRead_out(MemRead_ID_out),
		 .MemWrite_out(MemWrite_ID_out),
		 .Branch_out(Branch_ID_out),
		 .ALUOp_out(ALUOp_ID_out),
		 .trunk_mode_out(trunk_mode_ID_out),
		 .op_code_out(op_code_ID_out),
		 .Bne_out(Bne_ID_out),
		 .Jump_out(Jump_ID_out),
		 .Jdes_sel_out(sel_dire_salto),
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
	 //Entradas
	 // +Las salidas de la etapa ID.
	 wire [1:0] ForwardA;
	 wire [1:0] ForwardB;

	 //Salidas
	 wire [31:0] result_EX_out;
	 wire [31:0] registro_2_EX_out;
	 wire [4:0] reg_dest_EX_out;

	 //Control Signals Output
	 wire MemToReg_EX_out;
	 wire RegWrite_EX_out;
	 wire MemRead_EX_out;
	 wire MemWrite_EX_out;
 	 wire [2:0] trunk_mode_EX_out;

	 //Instanciaci�n
	 execute u_execute (
		 .clock(pipeline_clock),
		 .ALUSrc(ALUSrc_ID_out),
		 .RegDst(RegDst_ID_out),
		 .ALUOp(ALUOp_ID_out),
		 .op_code(op_code_ID_out),
		 .registro_1(data_a_ID_out),
		 .registro_2(data_b_ID_out),
		 .sign_extend(sign_extended_ID_out),
		 .reg_dest_r_type(reg_dest_r_type_ID_out),
		 .reg_dest_l_type(reg_dest_l_type_ID_out),
		 .sa(sa_ID_out),
		 .branch_dest_addr(branch_dest_addr),
		 .current_pc(current_pc_ID_out),
		 .ForwardA(ForwardA),
		 .ForwardB(ForwardB),
		 .memory_mem_wb(write_back_data_ID_in),
		 .MemToReg_in(MemToReg_ID_out),
		 .RegWrite_in(RegWrite_ID_out),
		 .MemRead_in(MemRead_ID_out),
		 .MemWrite_in(MemWrite_ID_out),
		 .Branch_in(Branch_ID_out),
		 .trunk_mode_in(trunk_mode_ID_out),
		 .Bne_in(Bne_ID_out),
		 .Jump_in(Jump_ID_out),
		 .sel_dire_salto(sel_dire_salto),
		 .result_out(result_EX_out),
		 .registro_2_out(registro_2_EX_out),
		 .reg_dest_out(reg_dest_EX_out),
		 .PCSrc(PCSrc_IF_in),
		 .PC_salto(pc_salto_IF_in),
		 .MemToReg_out(MemToReg_EX_out),
		 .RegWrite_out(RegWrite_EX_out),
		 .MemRead_out(MemRead_EX_out),
		 .MemWrite_out(MemWrite_EX_out),
		 .trunk_mode_out(trunk_mode_EX_out)
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

	 //Instanciaci�n
	 memory_access u_memory_access (
		 .clock(pipeline_clock),
		 .MemWrite(MemWrite_EX_out),
		 .MemRead(MemRead_EX_out),
		 .trunk_mode(trunk_mode_EX_out),
		 .alu_result(result_EX_out),
		 .in_data(registro_2_EX_out),
		 .reg_dest(reg_dest_EX_out),
		 .MemToReg_in(MemToReg_EX_out),
		 .RegWrite_in(RegWrite_EX_out),
		 .read_data_out(read_data_MEM_out),
		 .alu_result_out(alu_result_MEM_out),
		 .reg_dest_out(write_back_address_ID_in),
		 .MemToReg_out(MemToReg_MEM_out),
		 .RegWrite_out(RegWrite_ID_in)
    );
	 //*******************************

	 //************* WB *************
	 //Entradas
	 //Salidas de la etapa MEM

	 //Instanciaci�n
	 write_back u_write_back (
		 .MemToReg(MemToReg_MEM_out),
		 .mem_data(read_data_MEM_out),
		 .ex_data(alu_result_MEM_out),
		 .wb_out(write_back_data_ID_in)
    );
	 //******************************

	 //****** FORWARDING UNIT *******
	 //Entradas
	 //Salidas de la Forwarding Unit

	 //Instanciaci�n
	 forwarding_unit u_forwarding_unit (
    .EX_MEM_RegisterRd(reg_dest_EX_out),
    .MEM_WB_RegisterRd(write_back_address_ID_in),
    .EX_MEM_RegWrite(RegWrite_EX_out),
    .MEM_WB_RegWrite(RegWrite_ID_in),
    .ID_EX_RegisterRs(reg_dest_s_type_ID_out),
    .ID_EX_RegisterRt(reg_dest_l_type_ID_out),
    .ForwardA(ForwardA),
    .ForwardB(ForwardB)
    );
	 //******************************

	 //*** HAZARD DETECTION UNIT ****
	 //Entradas
	 //Salidas de la Forwarding Unit

	 //Instanciaci�n
	 hazard_detection_unit u_hazard_detection_unit (
    .ID_EX_MemRead(MemRead_ID_out),
	 .ID_EX_RegisterRt(reg_dest_l_type_ID_out),
	 .IF_ID_RegisterRt(instruccion_IF_out[20:16]),
	 .IF_ID_RegisterRs(instruccion_IF_out[25:21]),
    .PCSrc(PCSrc_IF_in),
	 .PCWrite(PCWrite),
    .IF_ID_Write(IF_ID_Write),
    .stall_mux(stall_mux),
	 .IF_Flush(IF_Flush)
    );
	 //******************************


	 //********** Debug Unit ********
	 //Entradas
	 //Entradas de las etapas previas

	 //Declaraci�n de se�ales
	 wire fifo_empty;

	 uart debug_unit (
		.clk(clock),
		.rx(rx),
		.rx_empty(fifo_empty),
		.tx(tx),
		.clock_status(pipeline_clock),
		.rx_data_out_debug(leds),

		//Debug signals for IF.
		.current_pc(current_pc_debug),
		.pc_if_out(pc_IF_out[7:0]),
		.instruccion_if_out(instruccion_IF_out),

		//Debugging signals for ID
		.sa_id_out(sa_ID_out),
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
		.jump_dest_id_out(pc_salto_IF_in[7:0]),
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
		.Bne_id_out(Bne_ID_out),
		.Jump_id_out(Jump_ID_out),
		.sel_dire_salto(sel_dire_salto),
		.op_code_id_out(op_code_ID_out),
		.trunk_mode_id_out(trunk_mode_ID_out),
	
		//Debugging signals for IE
		.result_ie_out(result_EX_out),
		.registro_2_ie_out(registro_2_EX_out),
		.jump_dest_addr_ie_out(pc_salto_IF_in[7:0]), //Lo cambi� por la que es ahora
//		.zero_signal_ie_out(zero_signal_EX_out), 	//No existe m�s
		.reg_dest_ie_out(reg_dest_EX_out),
		.MemToReg_ie_out(MemToReg_EX_out),
		.RegWrite_ie_out(RegWrite_EX_out),
		.MemRead_ie_out(MemRead_EX_out),
		.MemWrite_ie_out(MemWrite_EX_out),
		.trunk_mode_ie_out(trunk_mode_EX_out),
//		.Branch_ie_out(Branch_EX_out),				//No existe m�s

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
