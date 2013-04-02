`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:53:42 04/01/2013 
// Design Name: 
// Module Name:    mux_ex_reg_dest 
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
module mux_ex_reg_dest(
    input [4:0] reg_dest_r_type,
    input [4:0] reg_dest_l_type,
    input selector,
    output reg [4:0] reg_dest_selected
    );

	 always @*
	 begin
		 case (selector)
			0:
				reg_dest_selected = reg_dest_l_type;
			1:
				reg_dest_selected = reg_dest_r_type;
			endcase
	 end

endmodule
