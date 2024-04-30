// Submódulo para el proceso de handshake
// Estado 0: Esperando conexión del Master
// Estado 1: Recibe el mensaje

module handshake
(
   input      clk,
   input      rst_l,    
   input      ready,
   input      done,
   output reg start
);

   reg [1:0] state;
   wire state0, state1, state2;
   wire reset_trigger;

   assign state0 = (state == 2'b00);

   assign state1 = (state == 2'b01);

   assign state2 = (state == 2'b10);

   // Lógica combinacional para determinar si el reinicio debe ocurrir
   assign reset_trigger = (!rst_l) | (state2 & !done & !ready);

   always @(posedge clk) begin
      // Lógica para el estado siguiente
      state <= (state1 & done) | (state2 & !(ready & state1 & done));

      // Lógica para la señal de inicio
      start <= state0 & ready;

		if (reset_trigger) begin
         state <= 2'b00;
         start <= 1'b0;
      end
		end
endmodule