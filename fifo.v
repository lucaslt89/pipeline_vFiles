module fifo
  #(
    parameter B=8,
              W=4
  )
  (
	 input wire clk,rd,wr,
	 input wire [B-1:0] w_data,
	 output wire full, empty,
	 output wire [B-1:0] r_data,
	  
	  //Debugging signals for IF
	 input [10:0] current_pc,
	 input [10:0] pc_if_out,
	 input [31:0] instruccion_if_out,
	  
	  //Debugging signals for ID
	 input [31:0] register_0_id_out,
	 input [31:0] register_1_id_out,
	 input [31:0] register_2_id_out,
	 input [31:0] register_3_id_out,
	 input [31:0] register_4_id_out,
	 input [31:0] register_5_id_out,
	 input [31:0] register_6_id_out,
	 input [31:0] register_7_id_out,
	 input [31:0] register_8_id_out,
	 input [31:0] register_9_id_out,
	 input [31:0] register_10_id_out,
	 input [31:0] register_11_id_out,
	 input [31:0] register_12_id_out,
	 input [31:0] register_13_id_out,
	 input [31:0] register_14_id_out,
	 input [31:0] register_15_id_out,
	 input [31:0] register_16_id_out,
	 input [31:0] register_17_id_out,
	 input [31:0] register_18_id_out,
	 input [31:0] register_19_id_out,
	 input [31:0] register_20_id_out,
	 input [31:0] register_21_id_out,
	 input [31:0] register_22_id_out,
	 input [31:0] register_23_id_out,
	 input [31:0] register_24_id_out,
	 input [31:0] register_25_id_out,
	 input [31:0] register_26_id_out,
	 input [31:0] register_27_id_out,
	 input [31:0] register_28_id_out,
	 input [31:0] register_29_id_out,
	 input [31:0] register_30_id_out,
	 input [31:0] register_31_id_out,
	 input [31:0] data_a_id_out,
    input [31:0] data_b_id_out,
	 input [31:0] sign_extend_id_out,
	 input [10:0] jump_dest_id_out,
	 input [4:0] reg_dest_r_type_id_out,
	 input [4:0] reg_dest_l_type_id_out,
	 //Control Signals Output
	 input RegDst_id_out,
	 input ALUSrc_id_out,
	 input MemToReg_id_out,
	 input RegWrite_id_out,
	 input MemRead_id_out,
	 input MemWrite_id_out,
	 input Branch_id_out,
	 input [1:0] ALUOp_id_out,
	 
	  //Debugging signals for IE
	 input [31:0] result_ie_out,
	 input [31:0] registro_2_ie_out,
	 input [10:0] jump_dest_addr_ie_out,
	 input zero_signal_ie_out,
	 input [4:0] reg_dest_ie_out,
	 //Control Signals Output
	 input MemToReg_ie_out,
	 input RegWrite_ie_out,
	 input MemRead_ie_out,
	 input MemWrite_ie_out,
	 input Branch_ie_out,
	 
	  //Debugging signals for MEM
	 input [31:0] mem_data_mem_out,
	 input [31:0] alu_result_mem_out,
	 input [4:0] reg_dest_mem_out,
	 //Control Signals Output
	 input MemToReg_mem_out,
	 input RegWrite_mem_out
  );

  reg [B-1:0] array_reg [2**W-1:0];
  reg [W-1:0] w_ptr_reg, w_ptr_next, w_ptr_succ;
  reg [W-1:0] r_ptr_reg, r_ptr_next, r_ptr_succ;
  reg full_reg, empty_reg, full_next, empty_next;
  wire wr_en;

  //Banco de registros y memoria
  always @(posedge clk)
	  if(wr_en && r_ptr_next != 3) begin
			//****************** Instruction Fetch ********************
			array_reg[0] = current_pc[7:0]; 	//Valor del PC que se ejecutará en la próxima instruccion
			array_reg[1] = pc_if_out[7:0];	//Valor del PC que se utilizará para calcular la dirección de destino
			array_reg[2] = instruccion_if_out[31:24]; //Instrucción que se ejecutará (bits 31:24)
			array_reg[3] = instruccion_if_out[23:16]; //Instrucción que se ejecutará (bits 23:16)
			array_reg[4] = instruccion_if_out[15:8];  //Instrucción que se ejecutará (bits 15:8)
			array_reg[5] = instruccion_if_out[7:0];   //Instrucción que se ejecutará (bits 7:0)
			
			//******************* Instruction Decode ********************
			array_reg[6] = register_0_id_out[31:24]; 	//Registro 0 (bits 31:24)
			array_reg[7] = register_0_id_out[23:16]; 	//Registro 0 (bits 23:16)
			array_reg[8] = register_0_id_out[15:8]; 	//Registro 0 (bits 15:8)
			array_reg[9] = register_0_id_out[7:0]; 	//Registro 0 (bits 7:0)
			
			array_reg[10] = register_1_id_out[31:24]; //Registro 1 (bits 31:24)
			array_reg[11] = register_1_id_out[23:16]; //Registro 1 (bits 23:16)
			array_reg[12] = register_1_id_out[15:8]; 	//Registro 1 (bits 15:8)
			array_reg[13] = register_1_id_out[7:0]; 	//Registro 1 (bits 7:0)
			
			array_reg[14] = register_2_id_out[31:24]; //Registro 2 (bits 31:24)
			array_reg[15] = register_2_id_out[23:16]; //Registro 2 (bits 23:16)
			array_reg[16] = register_2_id_out[15:8]; 	//Registro 2 (bits 15:8)
			array_reg[17] = register_2_id_out[7:0]; 	//Registro 2 (bits 7:0)
			
			array_reg[18] = register_3_id_out[31:24]; //Registro 3 (bits 31:24)
			array_reg[19] = register_3_id_out[23:16]; //Registro 3 (bits 23:16)
			array_reg[20] = register_3_id_out[15:8]; 	//Registro 3 (bits 15:8)
			array_reg[21] = register_3_id_out[7:0]; 	//Registro 3 (bits 7:0)
			
			array_reg[22] = register_4_id_out[31:24]; //Registro 4 (bits 31:24)
			array_reg[23] = register_4_id_out[23:16]; //Registro 4 (bits 23:16)
			array_reg[24] = register_4_id_out[15:8]; 	//Registro 4 (bits 15:8)
			array_reg[25] = register_4_id_out[7:0]; 	//Registro 4 (bits 7:0)
			
			array_reg[26] = register_5_id_out[31:24]; //Registro 5 (bits 31:24)
			array_reg[27] = register_5_id_out[23:16]; //Registro 5 (bits 23:16)
			array_reg[28] = register_5_id_out[15:8]; 	//Registro 5 (bits 15:8)
			array_reg[29] = register_5_id_out[7:0]; 	//Registro 5 (bits 7:0)
			
			array_reg[30] = register_6_id_out[31:24]; //Registro 6 (bits 31:24)
			array_reg[31] = register_6_id_out[23:16]; //Registro 6 (bits 23:16)
			array_reg[32] = register_6_id_out[15:8]; 	//Registro 6 (bits 15:8)
			array_reg[33] = register_6_id_out[7:0]; 	//Registro 6 (bits 7:0)
			
			array_reg[34] = register_7_id_out[31:24]; //Registro 7 (bits 31:24)
			array_reg[35] = register_7_id_out[23:16]; //Registro 7 (bits 23:16)
			array_reg[36] = register_7_id_out[15:8]; 	//Registro 7 (bits 15:8)
			array_reg[37] = register_7_id_out[7:0]; 	//Registro 7 (bits 7:0)
			
			array_reg[38] = register_8_id_out[31:24]; //Registro 8 (bits 31:24)
			array_reg[39] = register_8_id_out[23:16]; //Registro 8 (bits 23:16)
			array_reg[40] = register_8_id_out[15:8]; 	//Registro 8 (bits 15:8)
			array_reg[41] = register_8_id_out[7:0]; 	//Registro 8 (bits 7:0)
			
			array_reg[42] = register_9_id_out[31:24]; //Registro 9 (bits 31:24)
			array_reg[43] = register_9_id_out[23:16]; //Registro 9 (bits 23:16)
			array_reg[44] = register_9_id_out[15:8]; 	//Registro 9 (bits 15:8)
			array_reg[45] = register_9_id_out[7:0]; 	//Registro 9 (bits 7:0)
			
			array_reg[46] = register_10_id_out[31:24];//Registro 10 (bits 31:24)
			array_reg[47] = register_10_id_out[23:16];//Registro 10 (bits 23:16)
			array_reg[48] = register_10_id_out[15:8]; //Registro 10 (bits 15:8)
			array_reg[49] = register_10_id_out[7:0]; 	//Registro 10 (bits 7:0)
			
			array_reg[50] = register_11_id_out[31:24];//Registro 11 (bits 31:24)
			array_reg[51] = register_11_id_out[23:16];//Registro 11 (bits 23:16)
			array_reg[52] = register_11_id_out[15:8]; //Registro 11 (bits 15:8)
			array_reg[53] = register_11_id_out[7:0]; 	//Registro 11 (bits 7:0)
			
			array_reg[54] = register_12_id_out[31:24];//Registro 12 (bits 31:24)
			array_reg[55] = register_12_id_out[23:16];//Registro 12 (bits 23:16)
			array_reg[56] = register_12_id_out[15:8]; //Registro 12 (bits 15:8)
			array_reg[57] = register_12_id_out[7:0]; 	//Registro 12 (bits 7:0)
			
			array_reg[58] = register_13_id_out[31:24];//Registro 13 (bits 31:24)
			array_reg[59] = register_13_id_out[23:16];//Registro 13 (bits 23:16)
			array_reg[60] = register_13_id_out[15:8]; //Registro 13 (bits 15:8)
			array_reg[61] = register_13_id_out[7:0]; 	//Registro 13 (bits 7:0)

			array_reg[62] = register_14_id_out[31:24];//Registro 14 (bits 31:24)
			array_reg[63] = register_14_id_out[23:16];//Registro 14 (bits 23:16)
			array_reg[64] = register_14_id_out[15:8]; //Registro 14 (bits 15:8)
			array_reg[65] = register_14_id_out[7:0]; 	//Registro 14 (bits 7:0)
			
			array_reg[66] = register_15_id_out[31:24];//Registro 15 (bits 31:24)
			array_reg[67] = register_15_id_out[23:16];//Registro 15 (bits 23:16)
			array_reg[68] = register_15_id_out[15:8]; //Registro 15 (bits 15:8)
			array_reg[69] = register_15_id_out[7:0]; 	//Registro 15 (bits 7:0)
			
			array_reg[70] = register_16_id_out[31:24];//Registro 16 (bits 31:24)
			array_reg[71] = register_16_id_out[23:16];//Registro 16 (bits 23:16)
			array_reg[72] = register_16_id_out[15:8]; //Registro 16 (bits 15:8)
			array_reg[73] = register_16_id_out[7:0]; 	//Registro 16 (bits 7:0)
			
			array_reg[74] = register_17_id_out[31:24];//Registro 17 (bits 31:24)
			array_reg[75] = register_17_id_out[23:16];//Registro 17 (bits 23:16)
			array_reg[76] = register_17_id_out[15:8]; //Registro 17 (bits 15:8)
			array_reg[77] = register_17_id_out[7:0]; 	//Registro 17 (bits 7:0)
			
			array_reg[78] = register_18_id_out[31:24];//Registro 18 (bits 31:24)
			array_reg[79] = register_18_id_out[23:16];//Registro 18 (bits 23:16)
			array_reg[80] = register_18_id_out[15:8]; //Registro 18 (bits 15:8)
			array_reg[81] = register_18_id_out[7:0]; 	//Registro 18 (bits 7:0)
			
			array_reg[82] = register_19_id_out[31:24];//Registro 19 (bits 31:24)
			array_reg[83] = register_19_id_out[23:16];//Registro 19 (bits 23:16)
			array_reg[84] = register_19_id_out[15:8]; //Registro 19 (bits 15:8)
			array_reg[85] = register_19_id_out[7:0]; 	//Registro 19 (bits 7:0)
			
			array_reg[86] = register_20_id_out[31:24];//Registro 20 (bits 31:24)
			array_reg[87] = register_20_id_out[23:16];//Registro 20 (bits 23:16)
			array_reg[88] = register_20_id_out[15:8]; //Registro 20 (bits 15:8)
			array_reg[89] = register_20_id_out[7:0]; 	//Registro 20 (bits 7:0)
			
			array_reg[90] = register_21_id_out[31:24];//Registro 21 (bits 31:24)
			array_reg[91] = register_21_id_out[23:16];//Registro 21 (bits 23:16)
			array_reg[92] = register_21_id_out[15:8]; //Registro 21 (bits 15:8)
			array_reg[93] = register_21_id_out[7:0]; 	//Registro 21 (bits 7:0)
			
			array_reg[94] = register_22_id_out[31:24];//Registro 22 (bits 31:24)
			array_reg[95] = register_22_id_out[23:16];//Registro 22 (bits 23:16)
			array_reg[96] = register_22_id_out[15:8]; //Registro 22 (bits 15:8)
			array_reg[97] = register_22_id_out[7:0]; 	//Registro 22 (bits 7:0)

			array_reg[98] 	= register_23_id_out[31:24];//Registro 23 (bits 31:24)
			array_reg[99] = register_23_id_out[23:16];//Registro 23 (bits 23:16)
			array_reg[100] = register_23_id_out[15:8]; //Registro 23 (bits 15:8)
			array_reg[101] = register_23_id_out[7:0];  //Registro 23 (bits 7:0)
			
			array_reg[102] = register_24_id_out[31:24];//Registro 24 (bits 31:24)
			array_reg[103] = register_24_id_out[23:16];//Registro 24 (bits 23:16)
			array_reg[104] = register_24_id_out[15:8]; //Registro 24 (bits 15:8)
			array_reg[105] = register_24_id_out[7:0];  //Registro 24 (bits 7:0)
		
			array_reg[106] = register_25_id_out[31:24];//Registro 25 (bits 31:24)
			array_reg[107] = register_25_id_out[23:16];//Registro 25 (bits 23:16)
			array_reg[108] = register_25_id_out[15:8]; //Registro 25 (bits 15:8)
			array_reg[109] = register_25_id_out[7:0];  //Registro 25 (bits 7:0)
			
			array_reg[110] = register_26_id_out[31:24];//Registro 26 (bits 31:24)
			array_reg[111] = register_26_id_out[23:16];//Registro 26 (bits 23:16)
			array_reg[112] = register_26_id_out[15:8]; //Registro 26 (bits 15:8)
			array_reg[113] = register_26_id_out[7:0];  //Registro 26 (bits 7:0)
			
			array_reg[114] = register_27_id_out[31:24];//Registro 27 (bits 31:24)
			array_reg[115] = register_27_id_out[23:16];//Registro 27 (bits 23:16)
			array_reg[116] = register_27_id_out[15:8]; //Registro 27 (bits 15:8)
			array_reg[117] = register_27_id_out[7:0];  //Registro 27 (bits 7:0)

			array_reg[118] = register_28_id_out[31:24];//Registro 28 (bits 31:24)
			array_reg[119] = register_28_id_out[23:16];//Registro 28 (bits 23:16)
			array_reg[120] = register_28_id_out[15:8]; //Registro 28 (bits 15:8)
			array_reg[121] = register_28_id_out[7:0];  //Registro 28 (bits 7:0)
			
			array_reg[122] = register_29_id_out[31:24];//Registro 29 (bits 31:24)
			array_reg[123] = register_29_id_out[23:16];//Registro 29 (bits 23:16)
			array_reg[124] = register_29_id_out[15:8]; //Registro 29 (bits 15:8)
			array_reg[125] = register_29_id_out[7:0];  //Registro 29 (bits 7:0)
			
			array_reg[126] = register_30_id_out[31:24];//Registro 30 (bits 31:24)
			array_reg[127] = register_30_id_out[23:16];//Registro 30 (bits 23:16)
			array_reg[128] = register_30_id_out[15:8]; //Registro 30 (bits 15:8)
			array_reg[129] = register_30_id_out[7:0];  //Registro 30 (bits 7:0)
			
			array_reg[130] = register_31_id_out[31:24];//Registro 31 (bits 31:24)
			array_reg[131] = register_31_id_out[23:16];//Registro 31 (bits 23:16)
			array_reg[132] = register_31_id_out[15:8]; //Registro 31 (bits 15:8)
			array_reg[133] = register_31_id_out[7:0];  //Registro 31 (bits 7:0)
			
			array_reg[134] = data_a_id_out[31:24];//Dato del registro A (bits 31:24)
			array_reg[135] = data_a_id_out[23:16];//Dato del registro A (bits 23:16)
			array_reg[136] = data_a_id_out[15:8]; //Dato del registro A (bits 15:8)
			array_reg[137] = data_a_id_out[7:0];  //Dato del registro A (bits 7:0)
			
			array_reg[138] = data_b_id_out[31:24];//Dato del registro B (bits 31:24)
			array_reg[139] = data_b_id_out[23:16];//Dato del registro B (bits 23:16)
			array_reg[140] = data_b_id_out[15:8]; //Dato del registro B (bits 15:8)
			array_reg[141] = data_b_id_out[7:0];  //Dato del registro B (bits 7:0)
		
			array_reg[142] = sign_extend_id_out[31:24];//Salida del campo inmediato, con extensión de signo (bits 31:24)
			array_reg[143] = sign_extend_id_out[23:16];//Salida del campo inmediato, con extensión de signo (bits 23:16)
			array_reg[144] = sign_extend_id_out[15:8]; //Salida del campo inmediato, con extensión de signo (bits 15:8)
			array_reg[145] = sign_extend_id_out[7:0];  //Salida del campo inmediato, con extensión de signo (bits 7:0)
			
			array_reg[146] = jump_dest_id_out[7:0]; 	 //Dirección de destino si se realizase el salto
			array_reg[147] = 8'b00011111 & reg_dest_r_type_id_out; //Registro destino para las instrucciones tipo R
			array_reg[148] = 8'b00011111 & reg_dest_l_type_id_out; //Registro destino para las instrucciones tipo L
			
			array_reg[149] = 8'b00000001 & RegDst_id_out;   //Bit de control RegDst que sale de la etapa ID
			array_reg[150] = 8'b00000001 & ALUSrc_id_out;   //Bit de control AluSrc que sale de la etapa ID
			array_reg[151] = 8'b00000001 & MemToReg_id_out; //Bit de control MemToReg que sale de la etapa ID
			array_reg[152] = 8'b00000001 & RegWrite_id_out; //Bit de control RegWrite que sale de la etapa ID
			array_reg[153] = 8'b00000001 & MemRead_id_out;  //Bit de control MemRead que sale de la etapa ID
			array_reg[154] = 8'b00000001 & MemWrite_id_out; //Bit de control MemWrite que sale de la etapa ID
			array_reg[155] = 8'b00000001 & Branch_id_out;   //Bit de control Branch que sale de la etapa ID
			array_reg[156] = 8'b00000011 & ALUOp_id_out;    //Bit de control ALUOp que sale de la etapa ID
			
			//**************** Excecute *********************
			array_reg[157] = result_ie_out[31:24];//Resultado de la ALU (bits 31:24)
			array_reg[158] = result_ie_out[23:16];//Resultado de la ALU (bits 23:16)
			array_reg[159] = result_ie_out[15:8]; //Resultado de la ALU (bits 15:8)
			array_reg[160] = result_ie_out[7:0];  //Resultado de la ALU (bits 7:0)
			
			array_reg[161] = registro_2_ie_out[31:24];//Registro 2 saliendo del registro EX/MEM (bits 31:24)
			array_reg[162] = registro_2_ie_out[23:16];//Registro 2 saliendo del registro EX/MEM (bits 23:16)
			array_reg[163] = registro_2_ie_out[15:8]; //Registro 2 saliendo del registro EX/MEM (bits 15:8)
			array_reg[164] = registro_2_ie_out[7:0];  //Registro 2 saliendo del registro EX/MEM (bits 7:0)
			
			array_reg[165] = jump_dest_addr_ie_out[7:0];      //Dirección de destino saliendo del registro EX/MEM (bits 7:0)
			array_reg[166] = 8'b00000001 & zero_signal_ie_out;//Bandera que indica si el resultado de la ALU es 0.
			array_reg[167] = 8'b00011111 & reg_dest_ie_out;   //Registro destino saliendo del registro EX/MEM
			
			array_reg[168] = 8'b00000001 & MemToReg_ie_out; //Bit de control MemToReg que sale de la etapa IE
			array_reg[169] = 8'b00000001 & RegWrite_ie_out; //Bit de control RegWrite que sale de la etapa IE
			array_reg[170] = 8'b00000001 & MemRead_ie_out;  //Bit de control MemRead que sale de la etapa IE
			array_reg[171] = 8'b00000001 & MemWrite_ie_out; //Bit de control MemWrite que sale de la etapa IE
			array_reg[172] = 8'b00000001 & Branch_ie_out;   //Bit de control Branch que sale de la etapa IE
			
			//*********** MEM ***************
			array_reg[173] = mem_data_mem_out[31:24];//Valor leido de la memoria saliendo del registro MEM/WB (bits 31:24)
			array_reg[174] = mem_data_mem_out[23:16];//Valor leido de la memoria saliendo del registro MEM/WB (bits 23:16)
			array_reg[175] = mem_data_mem_out[15:8]; //Valor leido de la memoria saliendo del registro MEM/WB (bits 15:8)
			array_reg[176] = mem_data_mem_out[7:0];  //Valor leido de la memoria saliendo del registro MEM/WB (bits 7:0)
			
			array_reg[177] = alu_result_mem_out[31:24];//Resultado de la ALU saliendo del registro MEM/WB (bits 31:24)
			array_reg[178] = alu_result_mem_out[23:16];//Resultado de la ALU saliendo del registro MEM/WB (bits 23:16)
			array_reg[179] = alu_result_mem_out[15:8]; //Resultado de la ALU saliendo del registro MEM/WB (bits 15:8)
			array_reg[180] = alu_result_mem_out[7:0];  //Resultado de la ALU saliendo del registro MEM/WB (bits 7:0)
			
			array_reg[181] = 8'b00011111 & reg_dest_mem_out;   //Registro destino saliendo del registro MEM/WB
		
			array_reg[182] = 8'b00000001 & MemToReg_mem_out; //Bit de control MemToReg que sale de la etapa MEM
			array_reg[183] = 8'b00000001 & RegWrite_mem_out; //Bit de control RegWrite que sale de la etapa MEM
	  end	

  assign r_data = array_reg[r_ptr_reg];
  assign wr_en = wr & ~full_reg;

  always @(posedge clk)
	begin
		w_ptr_reg <= w_ptr_next;
		r_ptr_reg <= r_ptr_next;
		full_reg <= full_next;
		empty_reg <= empty_next;
	end

  //Logica del proximo estado
  always @*
  begin
	  w_ptr_succ = w_ptr_reg;
	  r_ptr_succ = r_ptr_reg + 1;
	  full_next = full_reg;
	  empty_next = empty_reg;
	  w_ptr_next = w_ptr_reg;
	  r_ptr_next = r_ptr_reg;

	  case({wr,rd})
    //2'b00: No hay que hacer nada
		  2'b01:
			  //Hay que sacar el primer elemento de la cola
			  if(~empty_reg)
				begin
				  r_ptr_next = r_ptr_succ;
				  full_next = 1'b0;
				  if(r_ptr_succ == w_ptr_reg)
					  empty_next = 1'b1;
				end
				
		  2'b10:
			  //Hay que escribir un nuevo elemento en la cola
			  if(~full_reg)
				begin
				  w_ptr_next = w_ptr_succ;
				  empty_next = 1'b0;
				  if(w_ptr_succ == r_ptr_reg)
					  full_next = 1'b1;
				end
		  
		  2'b11:
			begin
			  w_ptr_next = w_ptr_succ;
			  r_ptr_next = r_ptr_succ;
			end
			
	  endcase
  end
  
  //Logica de salida
  assign full = full_reg;
  assign empty = empty_reg;

endmodule
