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
	 output reg [1:0] ALUOp_out,
	 output reg [2:0] trunk_mode_out,
	 output reg Bne_out,
	 output reg Jump,
	 output reg [1:0] Jdes_sel
    );
	 //Trunk mode:
	 // 0 = Normal result
	 // 1 = Byte with signed extension
	 // 2 = Half word with signed extension
	 // 3 = Byte with unsigned extension
	 // 4 = Half word with unsigned extension

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
	 trunk_mode_out = 0;
	 Bne_out = 0;
	 Jump = 0;
	 Jdes_sel = 0;
	end

	always @*
	begin
		if(stall_mux)
		begin
		 case(op_code)
			//Tipo R o Salto
			6'b000000:
			begin
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
					trunk_mode_out = 0;
					Bne_out = 0;
					Jump = 1;
					Jdes_sel = 2'b10;
				end

				else if(formato == 6'b001001) //Instrucci�n JALR
				begin
					RegDst_out = 1;
					ALUOp_out = 2'b10;
					ALUSrc_out = 0;
					Branch_out = 1;
					MemRead_out = 0;
					MemWrite_out = 0;
					RegWrite_out = 1;
					MemToReg_out = 0;
					trunk_mode_out = 0;
					Bne_out = 0;
					Jump = 1;
					Jdes_sel = 2'b10;
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
					trunk_mode_out = 0;
					Bne_out = 0;
					Jump = 0;
					Jdes_sel = 2'b00;
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
				trunk_mode_out = 1;
				Bne_out = 0;
				Jump = 0;
				Jdes_sel = 2'b00;
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
				trunk_mode_out = 2;
				Bne_out = 0;
				Jump = 0;
				Jdes_sel = 2'b00;
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
				trunk_mode_out = 0;
				Bne_out = 0;
                Jump = 0;
                Jdes_sel = 0;
			end

			//Instrucci�n LWU
			6'b100111:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b00;
				ALUSrc_out = 1;
				Branch_out = 0;
				MemRead_out = 1;
				MemWrite_out = 0;
				RegWrite_out = 1;
				MemToReg_out = 1;
				trunk_mode_out = 0;
				Bne_out = 0;
                Jump = 0;
                Jdes_sel = 0;
			end

			//Instrucci�n LBU
			6'b100100:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b00;
				ALUSrc_out = 1;
				Branch_out = 0;
				MemRead_out = 1;
				MemWrite_out = 0;
				RegWrite_out = 1;
				MemToReg_out = 1;
				trunk_mode_out = 3;
				Bne_out = 0;
                Jump = 0;
                Jdes_sel = 0;
			end

			//Instrucci�n LHU
			6'b100101:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b00;
				ALUSrc_out = 1;
				Branch_out = 0;
				MemRead_out = 1;
				MemWrite_out = 0;
				RegWrite_out = 1;
				MemToReg_out = 1;
				trunk_mode_out = 4;
				Bne_out = 0;
				Jump = 0;
				Jdes_sel = 2'b00;
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
				trunk_mode_out = 3;
				Bne_out = 0;
				Jump = 0;
				Jdes_sel = 2'b00;
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
				trunk_mode_out = 4;
				Bne_out = 0;
				Jump = 0;
				Jdes_sel = 2'b00;
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
				trunk_mode_out = 0;
				Bne_out = 0;
				Jump = 0;
				Jdes_sel = 2'b00;
			end

			//Instrucci�n ADDI
			6'b001000:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b10;
				ALUSrc_out = 1;
				Branch_out = 0;
				MemRead_out = 0;
				MemWrite_out = 0;
				RegWrite_out = 1;
				MemToReg_out = 0;
				trunk_mode_out = 0;
				Bne_out = 0;
                Jump = 0;
                Jdes_sel = 0;
			end

			//Instrucci�n ADDIU
			6'b001001:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b10;
				ALUSrc_out = 1;
				Branch_out = 0;
				MemRead_out = 0;
				MemWrite_out = 0;
				RegWrite_out = 1;
				MemToReg_out = 0;
				trunk_mode_out = 0;
				Bne_out = 0;
				Jump = 0;
				Jdes_sel = 2'b00;
			end

			//Instrucci�n ANDI
			6'b001100:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b10;
				ALUSrc_out = 1;
				Branch_out = 0;
				MemRead_out = 0;
				MemWrite_out = 0;
				RegWrite_out = 1;
				MemToReg_out = 0;
				trunk_mode_out = 0;
				Bne_out = 0;
				Jump = 0;
				Jdes_sel = 2'b00;
			end

			//Instrucci�n ORI
			6'b001101:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b10;
				ALUSrc_out = 1;
				Branch_out = 0;
				MemRead_out = 0;
				MemWrite_out = 0;
				RegWrite_out = 1;
				MemToReg_out = 0;
				trunk_mode_out = 0;
				Bne_out = 0;
				Jump = 0;
				Jdes_sel = 2'b00;
			end

			//Instrucci�n XORI
			6'b001110:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b10;
				ALUSrc_out = 1;
				Branch_out = 0;
				MemRead_out = 0;
				MemWrite_out = 0;
				RegWrite_out = 1;
				MemToReg_out = 0;
				trunk_mode_out = 0;
				Bne_out = 0;
                Jump = 0;
                Jdes_sel = 0;
			end

			//Instrucci�n LUI
			6'b001111:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b10;
				ALUSrc_out = 1;
				Branch_out = 0;
				MemRead_out = 0;
				MemWrite_out = 0;
				RegWrite_out = 1;
				MemToReg_out = 0;
				trunk_mode_out = 0;
				Bne_out = 0;
				Jump = 0;
				Jdes_sel = 2'b00;
			end

			//Instrucci�n SLTI
			6'b001010:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b10;
				ALUSrc_out = 1;
				Branch_out = 0;
				MemRead_out = 0;
				MemWrite_out = 0;
				RegWrite_out = 1;
				MemToReg_out = 0;
				trunk_mode_out = 0;
				Bne_out = 0;
                Jump = 0;
                Jdes_sel = 0;
			end

			//Instrucci�n SLTIU
			6'b001011:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b10;
				ALUSrc_out = 1;
				Branch_out = 0;
				MemRead_out = 0;
				MemWrite_out = 0;
				RegWrite_out = 1;
				MemToReg_out = 0;
				trunk_mode_out = 0;
				Bne_out = 0;
				Jump = 0;
				Jdes_sel = 2'b00;
			end

			//Instrucci�n BEQ
			6'b000100:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b01;
				ALUSrc_out = 0;
				Branch_out = 1;
				MemRead_out = 0;
				MemWrite_out = 0;
				RegWrite_out = 0;
				MemToReg_out = 0;
				trunk_mode_out = 0;
				Bne_out = 0;
				Jump = 0;
				Jdes_sel = 2'b00;
			end

			//Instrucci�n BNEQ
			6'b000101:
			begin
				RegDst_out = 0;
				ALUOp_out = 2'b01;
				ALUSrc_out = 0;
				Branch_out = 1;
				MemRead_out = 0;
				MemWrite_out = 0;
				RegWrite_out = 0;
				MemToReg_out = 0;
				trunk_mode_out = 0;
				Bne_out = 1;
				Jump = 0;
				Jdes_sel = 2'b00;
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
				trunk_mode_out = 0;
				Bne_out = 0;
				Jump = 1;
				Jdes_sel = 2'b01;
			end

			//Instrucci�n JAL
			6'b000011:
			begin
				RegDst_out = 1;
				ALUOp_out = 2'b11;
				ALUSrc_out = 0;
				Branch_out = 1;
				MemRead_out = 0;
				MemWrite_out = 0;
				RegWrite_out = 1;
				MemToReg_out = 0;
				Bne_out = 0;
				Jump = 1;
				Jdes_sel = 2'b01;
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
				trunk_mode_out = 0;
				Bne_out = 0;
				Jump = 0;
				Jdes_sel = 2'b00;
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
		trunk_mode_out = 0;
		Bne_out = 0;
		Jump = 0;
		Jdes_sel = 2'b00;
   end
end

endmodule
