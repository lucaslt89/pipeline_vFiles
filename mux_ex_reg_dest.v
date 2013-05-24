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
	 input [1:0] Jdes_sel,
    input selector,
    output reg [4:0] reg_dest_selected
    );
	 
	 initial
	 begin
		reg_dest_selected = 0;
	 end

	 always @*
	 begin
		 case (selector)
			0:
				reg_dest_selected = reg_dest_l_type;
			1:
			begin
				if(Jdes_sel == 2'b01)
					reg_dest_selected = 5'b11111;
				else
					reg_dest_selected = reg_dest_r_type;
			end
			endcase
	 end

endmodule
