`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    00:02:52 02/25/2013
// Design Name:
// Module Name:    if_id
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
module if_id_reg(
    input [31:0] instruccion,
	 input [10:0] pc,
	 input clock,
	 input IF_ID_Write,
	 input IF_Flush,
	 output [31:0] salida_inst,
	 output [10:0] salida_pc
	 );

	reg  [31:0] out_inst = 0;
	reg  [10:0] out_pc = 0;

	always @(negedge clock)
	begin
		if(IF_ID_Write)
		begin
			out_inst = instruccion;
			out_pc = pc;
		end
		if(IF_Flush)
		begin
			out_inst = {32{1'b1}};
			out_pc = pc;
		end
	end

	assign salida_inst = out_inst;
	assign salida_pc = out_pc;

endmodule
