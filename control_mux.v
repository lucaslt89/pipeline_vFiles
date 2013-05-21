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
				if(formato == 6'b001000) //Instrucci�n JR
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
				
				else if(formato == 6'b001001) //Instrucci�n JALR
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
				
				else if(formato == 6'b000000) //Instrucci�n NOP
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
				
				else //Alguna instrucci�n matem�tica, tipo R.
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
			
			//Instrucci�n LB
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
			
			//Instrucci�n LH
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
			
			//Instrucci�n LW
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
			
			//Instrucci�n SB
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

			//Instrucci�n SH
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
			
			//Instrucci�n SW
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
			
			//Instrucci�n ADDI
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
			
			//Instrucci�n ANDI
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
			
			//Instrucci�n ORI
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
			
			//Instrucci�n XORI
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
			
			//Instrucci�n SLTI
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
			
			//Instrucci�n BEQ
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
			
			//Instrucci�n BNEQ
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
			
			//Instrucci�n J
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
