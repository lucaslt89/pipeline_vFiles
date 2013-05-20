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
	 input [5:0] op_code,
	 input [5:0] formato,
	 input stall_mux,
	 output reg RegDst_out,
	 output reg ALUSrc_out,
	 output reg MemToReg_out,
	 output reg RegWrite_out,
	 output reg MemRead_out,
	 output reg MemWrite_out,
	 output reg Branch_out,
	 output reg [1:0] ALUOp_out
    );
	
	initial
	begin
	 RegDst_out = 0;
	 ALUSrc_out = 0;
	 MemToReg_out = 0;
	 RegWrite_out = 0;
	 MemRead_out = 0;
	 MemWrite_out = 0;
	 Branch_out = 0;
	 ALUOp_out = 0;
	end	
		
	always @*
	begin
		if(stall_mux)
		begin 
		 case(op_code)
			//Tipo R o Salto
			6'b000000: begin
				if(formato == 6'b001000) //Instrucción JR
				begin
					RegDst_out = 0;
					ALUOp_out = 2'b00;
					ALUSrc_out = 0;
					Branch_out = 1;
					MemRead_out = 0;
					MemWrite_out = 0;
					RegWrite_out = 0;
					MemToReg_out = 0;
				end
				
				else if(formato == 6'b001001) //Instrucción JALR
				begin
					RegDst_out = 0;
					ALUOp_out = 2'b00;
					ALUSrc_out = 0;
					Branch_out = 1;
					MemRead_out = 0;
					MemWrite_out = 0;
					RegWrite_out = 0;
					MemToReg_out = 0;
				end
				
				else if(formato == 6'b000000) //Instrucción NOP
				begin
					RegDst_out = 0;
					ALUOp_out = 2'b00;
					ALUSrc_out = 0;
					Branch_out = 0;
					MemRead_out = 0;
					MemWrite_out = 0;
					RegWrite_out = 0;
					MemToReg_out = 0;
				end
				
				else //Alguna instrucción matemática, tipo R.
				begin
					RegDst_out = 1;
					ALUOp_out = 2'b10;
					ALUSrc_out = 0;
					Branch_out = 0;
					MemRead_out = 0;
					MemWrite_out = 0;
					RegWrite_out = 1;
					MemToReg_out = 0;
				end
			end
			
			//Instrucción LB
			6'b100000: 
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b00;
				ALUSrc_out = 1;
				Branch_out = 0;
				MemRead_out = 1;
				MemWrite_out = 0;
				RegWrite_out = 1;
				MemToReg_out = 1;
			end
			
			//Instrucción LH
			6'b100001:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b00;
				ALUSrc_out = 1;
				Branch_out = 0;
				MemRead_out = 1;
				MemWrite_out = 0;
				RegWrite_out = 1;
				MemToReg_out = 1;
			end
			
			//Instrucción LW
			6'b100011:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b00;
				ALUSrc_out = 1;
				Branch_out = 0;
				MemRead_out = 1;
				MemWrite_out = 0;
				RegWrite_out = 1;
				MemToReg_out = 1;
			end
			
			//Instrucción SB
			6'b101000:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b00;
				ALUSrc_out = 1;
				Branch_out = 0;
				MemRead_out = 0;
				MemWrite_out = 1;
				RegWrite_out = 0;
				MemToReg_out = 0;
			end

			//Instrucción SH
			6'b101001:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b00;
				ALUSrc_out = 1;
				Branch_out = 0;
				MemRead_out = 0;
				MemWrite_out = 1;
				RegWrite_out = 0;
				MemToReg_out = 0;
			end		
			
			//Instrucción SW
			6'b101011:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b00;
				ALUSrc_out = 1;
				Branch_out = 0;
				MemRead_out = 0;
				MemWrite_out = 1;
				RegWrite_out = 0;
				MemToReg_out = 0;
			end
			
			//Instrucción ADDI
			6'b001000:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b11;
				ALUSrc_out = 1;
				Branch_out = 0;
				MemRead_out = 0;
				MemWrite_out = 0;
				RegWrite_out = 1;
				MemToReg_out = 0;
			end
			
			//Instrucción ANDI
			6'b001100:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b11;
				ALUSrc_out = 1;
				Branch_out = 0;
				MemRead_out = 0;
				MemWrite_out = 0;
				RegWrite_out = 1;
				MemToReg_out = 0;
			end
			
			//Instrucción ORI
			6'b001101:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b11;
				ALUSrc_out = 1;
				Branch_out = 0;
				MemRead_out = 0;
				MemWrite_out = 0;
				RegWrite_out = 1;
				MemToReg_out = 0;
			end
			
			//Instrucción XORI
			6'b001110:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b11;
				ALUSrc_out = 1;
				Branch_out = 0;
				MemRead_out = 0;
				MemWrite_out = 0;
				RegWrite_out = 1;
				MemToReg_out = 0;
			end
			
			//Instrucción SLTI
			6'b001010:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b11;
				ALUSrc_out = 1;
				Branch_out = 0;
				MemRead_out = 0;
				MemWrite_out = 0;
				RegWrite_out = 1;
				MemToReg_out = 0;
			end
			
			//Instrucción BEQ
			6'b000100:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b00;
				ALUSrc_out = 0;
				Branch_out = 1;
				MemRead_out = 0;
				MemWrite_out = 0;
				RegWrite_out = 0;
				MemToReg_out = 0;
			end
			
			//Instrucción BNEQ
			6'b000101:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b00;
				ALUSrc_out = 0;
				Branch_out = 1;
				MemRead_out = 0;
				MemWrite_out = 0;
				RegWrite_out = 0;
				MemToReg_out = 0;
			end
			
			//Instrucción J
			6'b000010:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b00;
				ALUSrc_out = 0;
				Branch_out = 1;
				MemRead_out = 0;
				MemWrite_out = 0;
				RegWrite_out = 0;
				MemToReg_out = 0;
			end
			
			//Cargo un NOP
			default:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b00;
				ALUSrc_out = 0;
				Branch_out = 0;
				MemRead_out = 0;
				MemWrite_out = 0;
				RegWrite_out = 0;
				MemToReg_out = 0;
			end
			
		 endcase
	end
	
	else
	begin
		RegDst_out = 0;
		ALUSrc_out = 0;
		MemToReg_out = 0;
		RegWrite_out = 0;
		MemRead_out = 0;
		MemWrite_out = 0;
		Branch_out = 0;
		ALUOp_out = 0;
   end
end

endmodule
