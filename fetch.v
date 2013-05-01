`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:25:29 02/25/2013 
// Design Name: 
// Module Name:    fetch 
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
module instruction_fetch(
    input [10:0] pc_salto, 	//dirección del salto
    input clock,
	 input PCSrc, 			//selector del mux
    output [10:0] pc, 
    output [31:0] instruccion,
	 output [10:0] current_pc_debug
    );

wire [10:0] pc_incrementado;	//sumador al pc y sumador al registro if/id
wire [10:0] pc_siguiente;		//mux al pc
wire [10:0] pc_actual;			//pc al sumador y pc a la memoria de inst
wire [31:0] salida_mem;			//memoria de instrucciones al registro if/id

	assign current_pc_debug = pc_siguiente;

mux u_mux_fetch (
    .entrada_0(pc_incrementado), 
    .entrada_1(pc_salto), 
    .sel(PCSrc), 
    .salida(pc_siguiente)
    );

pc u_pc (
    .entrada(pc_siguiente), 
	 .clock(clock),
    .salida(pc_actual)
    );

sumador u_sumador (
    .pc_actual(pc_actual), 
    .pc_incrementado(pc_incrementado)
    );
	 
inst_mem u_inst_mem (
    .addr(pc_actual), 
    .clock(clock), 
    .inst(salida_mem)
    );
	 
if_id_reg u_if_id_reg (
    .instruccion(salida_mem), 
    .pc(pc_incrementado), 
    .clock(clock), 
    .salida_inst(instruccion), 
    .salida_pc(pc)
    );


	 
endmodule