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
	 output [31:0] salida_inst,
	 output [10:0] salida_pc
	 );
	
	reg  [31:0] out_inst;
	reg  [10:0] out_pc;
	
	always @(posedge clock)
	begin
		out_inst = instruccion;
	end
	
	
	always @(posedge clock)
	begin
		out_pc = pc;
	end
	
	assign salida_inst = out_inst;
	assign salida_pc = out_pc;
	
endmodule

    //input enable_if_id,
	 //input flush,

/*	always @(posedge clock)
	begin
		if(enable_if_id)
		begin
			if(flush)
				out = 32'b00000_00000_00000_00000_00000_00000_00; //nop
			else
				out_inst = instrucción;
		end	
	end
*/