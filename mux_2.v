`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:56:39 02/25/2013 
// Design Name: 
// Module Name:    mux_2 
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
module mux_ex(
    input [31:0] entrada_0,
    input [31:0] entrada_1,
    input sel,
    output [31:0] salida
    );
	 
 	 reg [31:0] aux;
	 
	 always @(*)
	 begin
		case (sel)
		0:
			aux = entrada_0;
		1:
			aux = entrada_1;		
		endcase
	 end

assign salida = aux;


endmodule
