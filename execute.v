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
	 input sel,
    input [31:0] registro_1,
    input [31:0] registro_2,
	 input [31:0] sign_extend,
	 input op,
    output [31:0] result,
    output [31:0] registro_2_out
    );

wire [31:0] salida_mux;
wire [31:0] salida_alu;

ex_mem_reg u_ex_mem_reg (
    .result(salida_alu), 
    .registro_2(registro_2), 
    .clock(clock), 
    .salida_result(result), 
    .salida_registro_2(registro_2_out)
	 );


mux_ex u_mux_ex (
    .entrada_0(registro_2), 
    .entrada_1(sign_extend), 
    .sel(sel), 
    .salida(salida_mux)
    );

alu u_alu (
    .operando_1(registro_1), 
    .operando_2(salida_mux), 
    .op(op), 
    .result(salida_alu)
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

