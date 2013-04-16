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
	 input [1:0] ALUOp, // TODO: Cambiar esto por [1:0] ALUOp
    input [31:0] registro_1,
    input [31:0] registro_2,
	 input [31:0] sign_extend,
	 input [10:0] jump_dest_addr,
	 input [4:0] reg_dest_r_type,
	 input [4:0] reg_dest_l_type,
	 //Control Signals Input
	 input MemToReg_in,
	 input RegWrite_in,
	 input MemRead_in,
	 input MemWrite_in,
	 input Branch_in,
	 
    output [31:0] result_out,
    output [31:0] registro_2_out,
	 output [4:0] reg_dest_out,
	 output [10:0] jump_dest_addr_out,
	 output zero_signal_out,
	 //Control Signals Output
	 output MemToReg_out,
	 output RegWrite_out,
	 output MemRead_out,
	 output MemWrite_out,
	 output Branch_out
    );

wire [31:0] salida_mux_alu;
wire [31:0] salida_alu;
wire zero_signal_from_alu; //Señal de zero proveniente de la ALU
wire [4:0] reg_dest_wire;  //Registro destino seleccionado, que no es el mismo para instrucciones tipo r que l.

ex_mem_reg u_ex_mem_reg (
    .result_in(salida_alu), 
    .registro_2_in(registro_2), 
    .jump_dest_addr_in(jump_dest_addr), 
    .zero_signal_in(zero_signal_from_alu), 
    .reg_dest_in(reg_dest_wire), 
    .clock(clock),
    .result_out(result_out),
    .registro_2_out(registro_2_out), 
    .jump_dest_addr_out(jump_dest_addr_out), 
    .zero_signal_out(zero_signal_out), 
    .reg_dest_out(reg_dest_out),
	 
    .MemToReg_in(MemToReg_in), 
    .RegWrite_in(RegWrite_in), 
    .MemRead_in(MemRead_in), 
    .MemWrite_in(MemWrite_in), 
    .Branch_in(Branch_in), 
    
    .MemToReg_out(MemToReg_out), 
    .RegWrite_out(RegWrite_out), 
    .MemRead_out(MemRead_out), 
    .MemWrite_out(MemWrite_out), 
    .Branch_out(Branch_out)
    );

mux_ex u_mux_ex (
    .entrada_0(registro_2), 
    .entrada_1(sign_extend), 
    .sel(ALUSrc), 
    .value(salida_mux_alu)
    );

alu u_alu (
    .operando_1(registro_1), 
    .operando_2(salida_mux_alu), 
    .op(ALUOp), //Agregar los 6 bits del Sign Extend para hacer la ALU control 
    .result(salida_alu),
	 .zero_signal(zero_signal_from_alu)
    );

mux_ex_reg_dest u_mux_ex_reg_dest (
    .reg_dest_r_type(reg_dest_r_type),
    .reg_dest_l_type(reg_dest_l_type),
    .selector(RegDst),
    .reg_dest_selected(reg_dest_wire)
    );

endmodule
