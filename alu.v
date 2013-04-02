`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:32:10 03/29/2013 
// Design Name: 
// Module Name:    alu 
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
module alu(
    input [31:0] operando_1,
    input [31:0] operando_2,
	 input op,
    output reg [31:0] result,
	 output reg zero_signal
    );
	
	always @*
	begin
		case(op)
			0:
			result <= operando_1 + operando_2;
			1:
			result <= operando_1 - operando_2;
		endcase
		
		if(result == 0) begin
			zero_signal = 1;
		end
		else begin
			zero_signal = 0;
		end
	end



endmodule
