`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:55:36 02/25/2013 
// Design Name: 
// Module Name:    mux_3 
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
module mux_ex_3(
    input [31:0] register_id_ex,
    input [31:0] earlier_result_ex_mem,
    input [31:0] memory_mem_wb,
    input [1:0] sel,
	 output [31:0]value
    );
	 
 	 reg [31:0] aux = 0;
	 
	 always @(*)
	 begin
		case (sel)
		2'b00:
			aux = register_id_ex;
		2'b10:
			aux = earlier_result_ex_mem;		
		2'b01:
			aux = memory_mem_wb;
		2'b11:
			aux = 0;
		endcase
	 end

assign value = aux;

endmodule
