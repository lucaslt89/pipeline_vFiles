`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:09:45 02/25/2013 
// Design Name: 
// Module Name:    data_mem 
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
module data_mem(
    input clock,
    input [10:0] address,
	 input [31:0] in_data,
	 input write,
	 output [31:0] out_data
    );
	 
	
	integer i;
	reg [31:0] memoria [0:2047];
	reg [31:0] aux;
	
	initial
	begin
		for (i = 0; i < 2048; i=i+1)
			memoria[i] = 32'b00000_00000_00000_00000_00000_00000_00;
	end
	
	always@(posedge clock)
	begin
		if(write)
			memoria[address] = in_data;
		else
			aux = memoria[address];
	end
	
	assign out_data = aux;



endmodule
