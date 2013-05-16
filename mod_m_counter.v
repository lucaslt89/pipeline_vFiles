module mod_m_counter
  #(parameter N=4, M=10)
  (
	  input clk,
	  output max_tick,
	  output [N-1:0] q
  );

	reg [N-1:0] r_reg;
	reg [N:0] aux;
	wire [N-1:0] r_next;

	always @ (posedge clk)
		r_reg <= r_next;
	
	always @ *
	begin
		if(r_reg==(M-1))
			aux = 1'b0;
		else
			aux = r_reg+1;
	end
	
	assign r_next = aux[N-1:0];
	assign q = r_reg;
	assign max_tick = (r_reg==(M-1)) ? 1'b1: 1'b0;
	
endmodule
