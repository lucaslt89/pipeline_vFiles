module uart_rx
  #(
    parameter DBIT = 8,      // number of data bits
              SB_TICK = 16   // number of ticks needed for stop bits.
  )
  (
    input clk,
    input rx,
	 input s_tick,
    output reg rx_done_tick,
    output [7:0] dout
  );
  
  //Declaracion de estados simbólicos
  localparam [1:0]
      idle  = 2'b00,
      start = 2'b01,
      data  = 2'b10,
      stop  = 2'b11;
      
  //Declaración de señales
  reg [1:0] state_reg, state_next;
  reg [3:0] s_reg, s_next; //Numero de sampling ticks para hacer el oversampling
  reg [2:0] n_reg, n_next; //Numero de bits de datos recibidos en el estado data.
  reg [7:0] b_reg, b_next; //Byte recibido.
  reg [4:0] auxs;				//Auxiliar para truncar
  reg [3:0] auxn;
  
  //Cuerpo
  //Registros de datos y de estado de la FSMD
  always @(posedge clk)
  begin
      state_reg <= state_next;
      s_reg <= s_next;
      n_reg <= n_next;
      b_reg <= b_next;
  end
      
  // FSMD next-state logic
  always @*
  begin
    state_next = state_reg;
    rx_done_tick = 1'b0;
    s_next = s_reg;
    n_next = n_reg;
    b_next = b_reg;
    
    case (state_reg)
      idle:
        if(~rx)
        begin
          state_next = start;
          s_next = 0;
        end
      
      start:
        if(s_tick)
          if(s_reg == 7)
          begin
            state_next = data;
            s_next = 0;
            n_next = 0;
          end
          
          else
			 begin
            auxs = s_reg +1;
				s_next = auxs[3:0];
			 end
		
      data:
        if(s_tick)
          if(s_reg == 15)
          begin
            s_next = 0;
            b_next = {rx, b_reg[7:1]};
            if(n_reg == (DBIT - 1))
              state_next = stop;
            else
            begin
					auxn = n_reg + 1;
					n_next = auxn[2:0];
				end
			 end
          
          else
			 begin
            auxs = s_reg +1;
				s_next = auxs[3:0];
			 end
            
      stop:
        if(s_tick)
          if(s_reg == (SB_TICK - 1))
          begin
            state_next = idle;
            rx_done_tick = 1'b1;
          end
          
          else
			 begin
            auxs = s_reg +1;
				s_next = auxs[3:0];
			 end
    endcase
  end
  
  //Salida
  assign dout = b_reg;
  
endmodule
