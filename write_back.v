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
    input mem_to_reg,
    input [32:0] mem_data,
    input [32:0] ex_data,
    output [32:0] wb_out
    );

	reg [32:0] aux;
	 
	always @(*)
	begin
		case (mem_to_reg)
		0:
			aux = mem_data;
		1:
			aux = ex_data;		
		endcase
	end

	assign wb_out = aux;

endmodule
