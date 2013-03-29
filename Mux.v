`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:18:37 02/24/2013 
// Design Name: 
// Module Name:    Mux 
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
module mux(
    input [10:0] incremento,
    input [10:0] salto,
    input sel,
    output [10:0] value
    );
	 
	 reg [10:0] aux;
	 
	 always @(*)
	 begin
		case (sel)
		0:
			aux = incremento;
		1:
			aux = salto;		
		endcase
	 end

assign value = aux;

endmodule
