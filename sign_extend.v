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
	initial
	begin
		sign_extended = 0;
	end

	always @*
	begin
		if(immediate[15] == 1'b0)
			sign_extended = immediate & 32'b00000000_00000000_11111111_11111111;
		else
			sign_extended = immediate | 32'b11111111_11111111_00000000_00000000;
	end

endmodule
