`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:17:14 05/23/2013 
// Design Name: 
// Module Name:    mux_pc_salto 
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
module mux_pc_salto(
    input [10:0] Branch_dest_addr,
    input [10:0] J_JAL_dest_addr,
    input [10:0] JR_JALR_dest_addr,
    input [1:0] sel_dire_salto,
    output [10:0] pc_salto
    );
	
	reg [10:0] aux = 0;
	 
	always @(*)
	begin
		case (sel_dire_salto)
		2'b00:
			aux = Branch_dest_addr;
		2'b01:
			aux = J_JAL_dest_addr;		
		2'b10:
			aux = JR_JALR_dest_addr;
		2'b11:
			aux = Branch_dest_addr;
		endcase
	end

assign pc_salto = aux;

endmodule
