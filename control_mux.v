`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:11:47 03/03/2013 
// Design Name: 
// Module Name:    control_mux 
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
module control_mux(
	 input [5:0] instruction_bits_in,
	 output reg RegDst_out,
	 output reg ALUSrc_out,
	 output reg MemToReg_out,
	 output reg RegWrite_out,
	 output reg MemRead_out,
	 output reg MemWrite_out,
	 output reg Branch_out,
	 output reg [1:0] ALUOp_out
    );
		
	always @*
	begin
		case(instruction_bits_in)
		//Tipo R
		6'b000000: begin
							RegDst_out = 1;
							ALUSrc_out = 0;
							MemToReg_out = 0;
							RegWrite_out = 1;
							MemRead_out = 0;
							MemWrite_out = 0;
							Branch_out = 0;
							ALUOp_out = 2'b10;
					  end
					  
		//Tipo lw
		6'b100011: begin
							RegDst_out = 0;
							ALUSrc_out = 1;
							MemToReg_out = 1;
							RegWrite_out = 1;
							MemRead_out = 1;
							MemWrite_out = 0;
							Branch_out = 0;
							ALUOp_out = 2'b00;
					  end
					  
		//Tipo sw
		6'b101011: begin
							RegDst_out = 1;
							ALUSrc_out = 1;
							MemToReg_out = 0;
							RegWrite_out = 0;
							MemRead_out = 0;
							MemWrite_out = 1;
							Branch_out = 0;
							ALUOp_out = 2'b00;
					  end
					  
		//Tipo beq
		6'b000100: begin
							RegDst_out = 0;
							ALUSrc_out = 0;
							MemToReg_out = 0;
							RegWrite_out = 0;
							MemRead_out = 0;
							MemWrite_out = 0;
							Branch_out = 1;
							ALUOp_out = 2'b01;
					  end
					  
		//Preguntar que pasa en todos los demás casos.
		default  : begin
							RegDst_out = 0;
							ALUSrc_out = 0;
							MemToReg_out = 0;
							RegWrite_out = 0;
							MemRead_out = 0;
							MemWrite_out = 0;
							Branch_out = 0;
							ALUOp_out = 2'b00;
                 end
		endcase
	end

endmodule
