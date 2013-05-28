module uart
  #(  // Configuracion por defecto:
      // 19,200 baudios, 8 bits de datos, 1 bit de stop, 2^2 FIFO
    parameter DBIT = 8,      // Bits de datos
              SB_TICK = 16,  // Ticks para el bit de stop. 16/24/32 para 1/1,5/2 bits
              DVSR = 326,    // DVSR para generar el Baudrate. DVSR = 50M/(16*baudrate)
              DVSR_BIT = 9   // Bits del DVSR
  )
  (
    input wire clk,
    input wire rx,
    output wire rx_empty, tx,
	 output reg clock_status,
	 output [7:0] rx_data_out_debug,
	 
	 //Debugging signals for IF
	 input [7:0] current_pc,
	 input [7:0] pc_if_out,
	 input [31:0] instruccion_if_out,
	 
	 //Debugging signals for ID
	 input [4:0] sa_id_out,
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
	 input [7:0] jump_dest_id_out,
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
	 input Bne_id_out,
	 input Jump_id_out,
    input [1:0]sel_dire_salto,
    input [5:0]op_code_id_out,
    input [2:0] trunk_mode_id_out,
	 
	 //Debugging signals for IE
	 input [31:0] result_ie_out,
	 input [31:0] registro_2_ie_out,
	 input [7:0] jump_dest_addr_ie_out,
	 input zero_signal_ie_out,
	 input [4:0] reg_dest_ie_out,
	 //Control Signals Output
	 input MemToReg_ie_out,
	 input RegWrite_ie_out,
	 input MemRead_ie_out,
	 input MemWrite_ie_out,
	 input Branch_ie_out,
	 input [2:0] trunk_mode_ie_out,
	 
	 //Debugging signals for MEM
	 input [31:0] mem_data_mem_out,
	 input [31:0] alu_result_mem_out,
	 input [4:0] reg_dest_mem_out,
	 //Control Signals Output
	 input MemToReg_mem_out,
	 input RegWrite_mem_out
  );
  
  // Declaración de señales
  wire tick, rx_done_tick, tx_done_tick;
  wire tx_empty, tx_fifo_not_empty;
  wire [7:0] tx_fifo_out, rx_data_out, fifo_data_rd;
  
  // Cuerpo  
  always @(negedge clk)
  begin
		//if(rx_done_tick == 1) begin
			if(rx_data_out == 8'b01110011)
			begin
				clock_status = 1;
			end
			
			else if (rx_data_out != 8'b01110011)
			begin
				clock_status = 0;
			end
		//end
  end
	
	//******** Baud Rate generator ********
  mod_m_counter #(
	.M(DVSR),
	.N(DVSR_BIT)
  )
  baud_gen_unit(
	.clk(clk),
	.q(),
	.max_tick(tick)
  );
   //************************************* 
	
	//*********** UART Receiver ***********
  uart_rx #(
	.DBIT(DBIT),
	.SB_TICK(SB_TICK)
  )
  uart_rx_unit(
	.clk(clk),
	.rx(rx),
	.s_tick(tick),
	.rx_done_tick(rx_done_tick),
	.dout(rx_data_out)
  );
	//*************************************

	//*********** FIFO Receiver ***********
	fifo #(
	 .B(DBIT)
	)
	fifo_rx_unit (
    .clk(clk), 
    .rd(tx_done_tick), 
    .wr(rx_done_tick), 
    .full(), 
    .empty(rx_empty), 
    .r_data(fifo_data_rd),
	 
	 //Debug signals for IF
	 .current_pc(current_pc),
	 .pc_if_out(pc_if_out),
	 .instruccion_if_out(instruccion_if_out),
	 
	 //Debugging signals for ID
	 .sa_id_out(sa_id_out),
	 .register_0_id_out(register_0_id_out), 
    .register_1_id_out(register_1_id_out), 
    .register_2_id_out(register_2_id_out), 
    .register_3_id_out(register_3_id_out), 
    .register_4_id_out(register_4_id_out), 
    .register_5_id_out(register_5_id_out), 
    .register_6_id_out(register_6_id_out), 
    .register_7_id_out(register_7_id_out), 
    .register_8_id_out(register_8_id_out), 
    .register_9_id_out(register_9_id_out), 
    .register_10_id_out(register_10_id_out), 
    .register_11_id_out(register_11_id_out), 
    .register_12_id_out(register_12_id_out), 
    .register_13_id_out(register_13_id_out), 
    .register_14_id_out(register_14_id_out), 
    .register_15_id_out(register_15_id_out), 
    .register_16_id_out(register_16_id_out), 
    .register_17_id_out(register_17_id_out), 
    .register_18_id_out(register_18_id_out), 
    .register_19_id_out(register_19_id_out), 
    .register_20_id_out(register_20_id_out), 
    .register_21_id_out(register_21_id_out), 
    .register_22_id_out(register_22_id_out), 
    .register_23_id_out(register_23_id_out), 
    .register_24_id_out(register_24_id_out), 
    .register_25_id_out(register_25_id_out), 
    .register_26_id_out(register_26_id_out), 
    .register_27_id_out(register_27_id_out), 
    .register_28_id_out(register_28_id_out), 
    .register_29_id_out(register_29_id_out), 
    .register_30_id_out(register_30_id_out), 
    .register_31_id_out(register_31_id_out), 
    .data_a_id_out(data_a_id_out), 
    .data_b_id_out(data_b_id_out), 
    .sign_extend_id_out(sign_extend_id_out), 
    .jump_dest_id_out(jump_dest_id_out), 
    .reg_dest_r_type_id_out(reg_dest_r_type_id_out), 
    .reg_dest_l_type_id_out(reg_dest_l_type_id_out), 
    .RegDst_id_out(RegDst_id_out), 
    .ALUSrc_id_out(ALUSrc_id_out), 
    .MemToReg_id_out(MemToReg_id_out), 
    .RegWrite_id_out(RegWrite_id_out), 
    .MemRead_id_out(MemRead_id_out), 
    .MemWrite_id_out(MemWrite_id_out), 
    .Branch_id_out(Branch_id_out), 
    .ALUOp_id_out(ALUOp_id_out),
	 .Bne_id_out(Bne_id_out),
	 .Jump_id_out(Jump_id_out),
    .sel_dire_salto(sel_dire_salto),
    .op_code_id_out(op_code_id_out),
    .trunk_mode_id_out(trunk_mode_id_out),
	 
	 //Debugging signals for IE
    .result_ie_out(result_ie_out), 
    .registro_2_ie_out(registro_2_ie_out), 
    .jump_dest_addr_ie_out(jump_dest_addr_ie_out), 
    .zero_signal_ie_out(zero_signal_ie_out), 
    .reg_dest_ie_out(reg_dest_ie_out), 
    .MemToReg_ie_out(MemToReg_ie_out), 
    .RegWrite_ie_out(RegWrite_ie_out), 
    .MemRead_ie_out(MemRead_ie_out), 
    .MemWrite_ie_out(MemWrite_ie_out), 
    .Branch_ie_out(Branch_ie_out),
	 .trunk_mode_ie_out(trunk_mode_ie_out),
	 
	 //Debugging signals for MEM
    .mem_data_mem_out(mem_data_mem_out), 
    .alu_result_mem_out(alu_result_mem_out), 
    .reg_dest_mem_out(reg_dest_mem_out), 
    .MemToReg_mem_out(MemToReg_mem_out), 
    .RegWrite_mem_out(RegWrite_mem_out)
   );
	//*************************************
	
   //********** UART Transmitter *********
  uart_tx #(
	.DBIT(DBIT),
	.SB_TICK(SB_TICK)
  )
  uart_tx_unit(
	.clk(clk),
	.tx_start(tx_fifo_not_empty || tx_done_tick),
	.s_tick(tick),
	.data_in(fifo_data_rd),
	.tx_done_tick(tx_done_tick),
	.tx(tx)
  );
	//*************************************
	
	assign tx_fifo_not_empty = ~rx_empty;
	
	assign rx_data_out_debug = rx_data_out;
  
endmodule
