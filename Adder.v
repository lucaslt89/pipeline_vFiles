`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:40:15 03/03/2013 
// Design Name: 
// Module Name:    adder 
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
module adder(
    input [10:0] old_pc,
    input [31:0] offset,
    output reg [10:0] new_pc
    );

	always @*
	begin
		new_pc = old_pc + offset;
	end

endmodule