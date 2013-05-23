`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:20:13 05/22/2013 
// Design Name: 
// Module Name:    trunk_ALU_result 
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
module trunk_unit(
    input [2:0] trunk_mode,
    input [31:0] original_value,
    output reg [31:0] trunked_value
    );
	 
	 initial
	 begin
		trunked_value = 0;
	 end
	 
	 always @*
	 begin
		case(trunk_mode)
			0: //Normal output for all instructions
			begin
				trunked_value = original_value;
			end
			
			1: //Byte signed extension
			begin
				if(original_value[7] == 0)
					trunked_value = original_value & 32'b00000000_00000000_00000000_11111111;
				else
					trunked_value = original_value | 32'b11111111_11111111_11111111_00000000;
			end
			
			2: //Half word signed extension
			begin
				if(original_value[15] == 0)
					trunked_value = original_value & 32'b00000000_00000000_11111111_11111111;
				else
					trunked_value = original_value | 32'b11111111_11111111_00000000_00000000;
			end
			
			3: //Byte unsigned extension
			begin
				trunked_value = original_value & 32'b00000000_00000000_00000000_11111111;
			end
			
			4: //Half word unsigned extension
			begin
				trunked_value = original_value & 32'b00000000_00000000_11111111_11111111;
			end
			
			default:
			begin
				trunked_value = original_value;
			end
		endcase
	 end

endmodule
