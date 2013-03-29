`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:04:37 02/25/2013 
// Design Name: 
// Module Name:    memory_access 
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
module memory_access(
    input mem_write,
    input mem_read,
    input wb_entrada,
    output wb_salida,
    input [10:0] address,
	 input clock,
	 input [31:0] in_data,
    input ex_mem_register_rd, //no se que sentido tienen, se puede pasar directo al wb?
    output mem_wb_register_rd,
    output [31:0] mem_data,
    output [31:0] ex_data //igual q el otro, es un cc al final...
    );
	 
	 wire [31:0 ]mem_out; 
	 assign mem_wb_register_rd = ex_mem_register_rd;
	 assign ex_data = in_data;
	 
data_mem u_data_mem (
    .clock(clock), 
    .address(address), 
    .out_data(mem_out),
	 .in_data(in_data),
    .write(mem_write), 
    .read(mem_read)
    );
	 
mem_wb_reg u_mem_wb_reg(
    .entrada(mem_out), 
    .clock(clock), 
    .wb_entrada(wb_entrada), 
    .wb_salida(wb_salida), 
    .salida(mem_data)
    );
	 
endmodule
