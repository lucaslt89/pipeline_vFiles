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
	 input [1:0]ALUOp,
	 input [5:0]operation,
    output reg [31:0] result,
	 output reg zero_signal
    );
	 
	initial
	begin
		result = 0;
		zero_signal = 0;
	end
	
	reg [5:0]op = 0;

	
	always@*
	begin
		case(ALUOp)
			2'b00:
				op=6'b100000;
			2'b01:
				op=6'b100010;
			2'b10:
				op=operation;
			default:
				op=6'b111111;
		endcase
	end
	
	
	always @*
	begin
		case (op)
			//SLL
			6'b000000:
				result <= operando_1 * 2**operando_2;
						
			//SRL
			6'b000010:
				result <= operando_1 / 2**operando_2;
					
    		//SRA
			6'b000011:
				result <= $signed(operando_1) / 2**operando_2;
		
			//SRLV
			6'b000110:
					result <= operando_1 / 2**operando_2;

			//SRAV
			6'b000111:
				result <= $signed(operando_1) * 2**operando_2;


			//ADD
			6'b100000:
				result <= operando_1 + operando_2;
						
			//SLLV
			6'b000100:
				result <= operando_1 * 2** operando_2;
						
			//SUB
			6'b100010:
				result <= operando_1 - operando_2;
					
			//SLT
			6'b101010:
				result <= ($signed(operando_1) < $signed(operando_2)) ? 1 : 0;
					
			//ADDU
			6'b100001:
				result <= operando_1 + operando_2;
				
			//SUBU
			6'b100011:
				result <= operando_1 - operando_2;
				
			//AND
			6'b100100:
				result <= operando_1 & operando_2;
						
			//OR
			6'b100101:
				result <= operando_1 | operando_2;
				
			//XOR
			6'b100110:
				result <= operando_1 ^ operando_2;
				
			//SLTU
			6'b101011:
				result <= (operando_1 < operando_2) ? 1 : 0;
				   
			//NOR
			6'b100111:
				result <= ~(operando_1 | operando_2);
				
/*			//JR //NO SE QUE MIERDA HACE LA ALU				
			6'b001000:
				result <= operando_1 - operando_2;
						
			//JALR //NO SE QUE MIERDA HACE LA ALU
			6'b001001:
				result <= operando_1 - operando_2;
*/
				
			default:
				result <= {32{1'b1}};
		endcase
	end

	always @*
	begin
		if(result == 0) 
			zero_signal = 1;
		else 
			zero_signal = 0;
	end


endmodule
