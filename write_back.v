`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:06:11 02/25/2013 
// Design Name: 
// Module Name:    write_back 
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
module write_back(
    input MemToReg,
    input [31:0] mem_data,
    input [31:0] ex_data,
    output [31:0] wb_out
    );

	reg [31:0] aux = 0;
	 
	always @(*)
	begin
		case (MemToReg)
		0:
			aux = mem_data;
		1:
			aux = ex_data;		
		endcase
	end

	assign wb_out = aux;

endmodule
