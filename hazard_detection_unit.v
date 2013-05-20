`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:23:07 05/19/2013 
// Design Name: 
// Module Name:    hazard_detection_unit 
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
module hazard_detection_unit(
    input ID_EX_MemRead, 			//MemRead_ID_out
    input [4:0] ID_EX_RegisterRt,
	 input [4:0] IF_ID_RegisterRt,
	 input [4:0] IF_ID_RegisterRs,
    output reg PCWrite,				//PCWrite
    output reg IF_ID_Write,		//IF_ID_Write
    output reg stall_mux			//stall_mux
    );

always@*
begin
	if(ID_EX_MemRead
	& ((ID_EX_RegisterRt == IF_ID_RegisterRs)
		| (ID_EX_RegisterRt == IF_ID_RegisterRt)))
	begin
		PCWrite = 0;
		IF_ID_Write = 0;
		stall_mux=0;
	end
	
	else
	begin
		PCWrite = 1;
		IF_ID_Write = 1;
		stall_mux = 1;
	end
		
end

endmodule


