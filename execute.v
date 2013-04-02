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
	 input ALUOp,
    input [31:0] registro_1,
    input [31:0] registro_2,
	 input [31:0] sign_extend,
	 input [10:0] jump_dest_addr,
	 input [4:0] reg_dest_r_type,
	 input [4:0] reg_dest_l_type,
    output [31:0] result_out,
    output [31:0] registro_2_out,
	 output [4:0] reg_dest_out,
	 output [10:0] jump_dest_addr_out,
	 output zero_signal_out
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
    .reg_dest_out(reg_dest_out)
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
    .op(ALUOp), 
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

/*
    input clock,
    input wb_entrada,//2bits
    input m_entrada,//3bits
    input [31:0] registro_1,
    input [31:0] registro_2,
    input rs_fwu,//5
    input rt_fwu,
    input rt_mux,
    input rd_mux,
    input mem_wb_register_rd,
    input wb,
	 input alu_src,
	 input alu_op,	 
	 output branch,
    output wb_salida,
    output [31:0] salida,
    output ex_mem_register_rd
    );

ex_mem_reg u_ex_mem_reg (
    .wb(wb), 
    .m(m), 
    .resultado(resultado), 
    .dato_1(dato_1), 
    .dato_2(dato_2), 
    .salida(salida)
    );


mux_ex u_mux_ex (
    .entrada_0(entrada_0), 
    .entrada_1(entrada_1), 
    .sel(sel), 
    .salida(salida)
    );

mux_ex_3 u_mux_ex_0 (
    .register(register), 
    .memory(memory), 
    .execute_out(execute_out), 
    .salida(salida), 
    .sel(sel)
    );
	 
	 
mux_ex_3 u_mux_ex_1 (
    .register(register), 
    .memory(memory), 
    .execute_out(execute_out), 
    .salida(salida), 
    .sel(sel)
    );

fowarding_unit u_fw_unit (
    .clock(clock), 
    .rs(rs), 
    .rt(rt), 
    .wb_ex(wb_ex), 
    .wb_mem(wb_mem), 
    .ex_out(ex_out), 
    .mem_out(mem_out)
    );*/

