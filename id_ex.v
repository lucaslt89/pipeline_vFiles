`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:19:46 03/29/2013 
// Design Name: 
// Module Name:    id_ex 
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
module id_ex(
    input [31:0] data_a_in,
    input [31:0] data_b_in,
	 input [31:0] sign_extend_in,
    input clock,
    output reg [31:0] data_a_out,
    output reg [31:0] data_b_out,
	 output reg [31:0] sign_extend_out
    );

	always @(posedge clock)
	begin
		data_a_out = data_a_in;
		data_b_out = data_b_in;
		sign_extend_out = sign_extend_in;
	end

endmodule
