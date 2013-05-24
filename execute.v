`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:36:41 02/25/2013 
// Design Name: 
// Module Name:    execute 
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
module execute(
    input clock,
	 input ALUSrc,
	 input RegDst,
	 input [1:0] ALUOp,
	 input [5:0] op_code,
    input [31:0] registro_1,
    input [31:0] registro_2,
	 input [31:0] sign_extend,
	 input [4:0] reg_dest_r_type,
	 input [4:0] reg_dest_l_type,
	 input [4:0] sa,
	 input [10:0] branch_dest_addr,
	 input [10:0] current_pc,
	 //Forwarding Unit Input & mux_3
	 input[1:0]ForwardA,
	 input[1:0]ForwardB,
	 input[31:0]memory_mem_wb,
	 //Control Signals Input
	 input MemToReg_in,
	 input RegWrite_in,
	 input MemRead_in,
	 input MemWrite_in,
	 input Branch_in,
	 input [2:0] trunk_mode_in,
	 input Bne_in,
	 input Jump_in,
	 input [1:0] sel_dire_salto,
	 
    output [31:0] result_out,
    output [31:0] registro_2_out,
	 output [4:0] reg_dest_out,
	 output PCSrc,
	 output [10:0] PC_salto,
	 //Control Signals Output
	 output MemToReg_out,
	 output RegWrite_out,
	 output MemRead_out,
	 output MemWrite_out,
	 output [2:0] trunk_mode_out
    );
	 
wire [31:0] mux_a_out, mux_b_out, salida_mux_alu;
wire [31:0] salida_alu;
wire zero_signal; //Señal de zero proveniente de la ALU
wire [4:0] reg_dest_wire;  //Registro destino seleccionado, que no es el mismo para instrucciones tipo r que l.
wire [31:0] result_out_aux;

reg [5:0] operation;

	always @*
	begin
		if(ALUSrc == 1 && ALUOp == 2'b10)
			operation = op_code;
		else
			operation = sign_extend[5:0];
	end

assign result_out = result_out_aux;

ex_mem_reg u_ex_mem_reg (
    .result_in(salida_alu), 
    .registro_2_in(registro_2), 
    .reg_dest_in(reg_dest_wire), 
    .clock(clock),
    .result_out(result_out_aux),
    .registro_2_out(registro_2_out),  
    .reg_dest_out(reg_dest_out),
	 
    .MemToReg_in(MemToReg_in), 
    .RegWrite_in(RegWrite_in), 
    .MemRead_in(MemRead_in), 
    .MemWrite_in(MemWrite_in), 
	 .trunk_mode_in(trunk_mode_in),
	 
    .MemToReg_out(MemToReg_out), 
    .RegWrite_out(RegWrite_out), 
    .MemRead_out(MemRead_out), 
    .MemWrite_out(MemWrite_out),
	 .trunk_mode_out(trunk_mode_out)
    );

mux_ex_3 u_mux_ex_3_A (
    .register_id_ex(registro_1), 
    .earlier_result_ex_mem(result_out_aux), 
    .memory_mem_wb(memory_mem_wb), 
    .sel(ForwardA), 
    .value(mux_a_out)
    );

mux_ex_3 u_mux_ex_3_B (
    .register_id_ex(registro_2), 
    .earlier_result_ex_mem(result_out_aux), 
    .memory_mem_wb(memory_mem_wb), 
    .sel(ForwardB), 
    .value(mux_b_out)
    );
	 
mux_ex u_mux_ex (
    .entrada_0(mux_b_out), 
    .entrada_1(sign_extend), 
    .sel(ALUSrc), 
    .salida(salida_mux_alu)
    );
	 
alu u_alu (
    .operando_1(mux_a_out), 
    .operando_2(salida_mux_alu), 
	 .sa(sa),
    .ALUOp(ALUOp), 
	 .operation(operation),
	 .current_pc(current_pc),
    .result(salida_alu),
	 .zero_signal(zero_signal)
    );

mux_ex_reg_dest u_mux_ex_reg_dest (
    .reg_dest_r_type(reg_dest_r_type),
    .reg_dest_l_type(reg_dest_l_type),
	 .Jdes_sel(sel_dire_salto),
    .selector(RegDst),
    .reg_dest_selected(reg_dest_wire)
    );
	
	mux_pc_salto instance_name (
    .Branch_dest_addr(branch_dest_addr), 
    .J_JAL_dest_addr(sign_extend[10:0]), 
    .JR_JALR_dest_addr(mux_a_out[10:0]), 
    .sel_dire_salto(sel_dire_salto), 
    .pc_salto(PC_salto)
    );
	 
	 assign PCSrc = (Branch_in & zero_signal) | (Bne_in & !zero_signal) | Jump_in;

endmodule
