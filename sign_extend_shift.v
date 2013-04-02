`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:53:36 03/31/2013 
// Design Name: 
// Module Name:    sign_extend_shift 
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
module sign_extend_shift(
    input [31:0] sign_extend,
    output reg [31:0] sign_extend_shifted
    );
	 
	 always @*
	 begin
		//Si vamos a trabajar con PC que cuente de a 4, cambiar el 1 por un 4.
		sign_extend_shifted = sign_extend * 1;
	 end


endmodule
