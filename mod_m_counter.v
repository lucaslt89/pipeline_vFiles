module mod_m_counter
  #(parameter N=4, M=10)
  (
	  input clk,
	  output max_tick,
	  output [N-1:0] q
  );

	reg [N-1:0] r_reg;
	wire [N-1:0] r_next;

	always @ (posedge clk)
		r_reg <= r_next;

	assign r_next = (r_reg == (M-1)) ? 0 : r_reg + 1;
	assign q = r_reg;
	assign max_tick = (r_reg==(M-1)) ? 1'b1: 1'b0;
	
endmodule
