`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:31:20 03/03/2013 
// Design Name: 
// Module Name:    sign_extend 
// Project Name: 
// Target Dev ices: 
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
module sign_extend(
    input [15:0] immediate,
    output reg [31:0] sign_extended
    );

	always @*
	begin
		if(immediate[15] == 1'b0)
			sign_extended = immediate & 32'b00000000_00000000_11111111_11111111;
		else
			sign_extended = immediate | 32'b11111111_11111111_00000000_00000000;
		
		//Si vamos a trabajar con desplazamientos de 1 en el PC, tengo que volar esta linea.
		sign_extended = sign_extended * 1;
	end

endmodule
