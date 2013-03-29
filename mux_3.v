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
    input [32:0] register,
    input [32:0] memory,
    input [32:0] execute_out,
    input [2:0] sel,
	 output value
    );
	 
 	 reg [10:0] aux;
	 
	 always @(*)
	 begin
		case (sel)
		00:
			aux = execute_out;
		01:
			aux = memory;		
		10:
			aux = register;
		endcase
	 end

assign value = aux;

endmodule
