`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:42:30 03/03/2013 
// Design Name: 
// Module Name:    registers 
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
module registers(
    input [4:0] read_addr_a,
    input [4:0] read_addr_b,
    input [4:0] write_address,
    input [31:0]write_data,
    input reg_write, //0 to read, 1 to write.
	 input clock,
    output [31:0] data_a,
    output [31:0] data_b,
	 
	 //Registers to send via UART
	 output reg [31:0] register_0_id_out,
	 output reg [31:0] register_1_id_out,
	 output reg [31:0] register_2_id_out,
	 output reg [31:0] register_3_id_out,
	 output reg [31:0] register_4_id_out,
	 output reg [31:0] register_5_id_out,
	 output reg [31:0] register_6_id_out,
	 output reg [31:0] register_7_id_out,
	 output reg [31:0] register_8_id_out,
	 output reg [31:0] register_9_id_out,
	 output reg [31:0] register_10_id_out,
	 output reg [31:0] register_11_id_out,
	 output reg [31:0] register_12_id_out,
	 output reg [31:0] register_13_id_out,
	 output reg [31:0] register_14_id_out,
	 output reg [31:0] register_15_id_out,
	 output reg [31:0] register_16_id_out,
	 output reg [31:0] register_17_id_out,
	 output reg [31:0] register_18_id_out,
	 output reg [31:0] register_19_id_out,
	 output reg [31:0] register_20_id_out,
	 output reg [31:0] register_21_id_out,
	 output reg [31:0] register_22_id_out,
	 output reg [31:0] register_23_id_out,
	 output reg [31:0] register_24_id_out,
    output reg [31:0] register_25_id_out,
	 output reg [31:0] register_26_id_out,
	 output reg [31:0] register_27_id_out,
	 output reg [31:0] register_28_id_out,
	 output reg [31:0] register_29_id_out,
	 output reg [31:0] register_30_id_out,
	 output reg [31:0] register_31_id_out
	 );
	 
	 reg [31:0] registers [31:0];
	 reg [31:0] data_a_reg = 0;
	 reg [31:0] data_b_reg = 0;
	 integer i;
	 
	 //Valores iniciales de los registros
	 initial
	 begin
		for(i = 0; i < 32; i = i+1)
			registers[i] = 0;
		registers[1] = 10;
		registers[3] = 15;
		registers [5] = 15;
		registers [6] = 12;
		registers [15] = 20;
	 end
	 
	 always @(posedge clock)
	 begin
		
		if(reg_write)
		begin
			registers[write_address] = write_data;
		end

		data_a_reg = registers[read_addr_a];
		data_b_reg = registers[read_addr_b];
		
		//Register Outputs
		register_0_id_out = registers[0];
		register_1_id_out = registers[1];
		register_2_id_out = registers[2];
		register_3_id_out = registers[3];
		register_4_id_out = registers[4];
		register_5_id_out = registers[5];
		register_6_id_out = registers[6];
		register_7_id_out = registers[7];
		register_8_id_out = registers[8];
		register_9_id_out = registers[9];
		register_10_id_out = registers[10];
		register_11_id_out = registers[11];
		register_12_id_out = registers[12];
		register_13_id_out = registers[13];
		register_14_id_out = registers[14];
		register_15_id_out = registers[15];
		register_16_id_out = registers[16];
		register_17_id_out = registers[17];
		register_18_id_out = registers[18];
		register_19_id_out = registers[19];
		register_20_id_out = registers[20];
		register_21_id_out = registers[21];
		register_22_id_out = registers[22];
		register_23_id_out = registers[23];
		register_24_id_out = registers[24];
		register_25_id_out = registers[25];
		register_26_id_out = registers[26];
		register_27_id_out = registers[27];
		register_28_id_out = registers[28];
		register_29_id_out = registers[29];
		register_30_id_out = registers[30];
		register_31_id_out = registers[31];
	 end
	 
	 assign data_a = data_a_reg;
	 assign data_b = data_b_reg;
	 
endmodule
