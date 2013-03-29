`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:51:48 02/24/2013 
// Design Name: 
// Module Name:    sumador 
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
//	El sumador suma de a 1 porque la memoria es de 32b en vez de de 8, si la cambiamos
//	tiene que sumar de a 4
//////////////////////////////////////////////////////////////////////////////////
module sumador(
    input [10:0] pc_actual,
    output [10:0] pc_incrementado
    );
	 
	 reg [10:0] pc_aux;
	 
	 always@(*)
	 begin
		 pc_aux = pc_actual + 1;
	 end
	 
	 assign pc_incrementado = pc_aux;

endmodule
