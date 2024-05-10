// Submódulo para el proceso de handshake
// Estado 0: Esperando conexión del Master
// Estado 1: Recibe el mensaje

module handshake(
	 input logic clk,
    input logic rst,
    input logic master_ready,  // Signal from the master indicating readiness to send data
    output logic slave_ready    // Signal to the master indicating readiness to receive data
);
    // Internal state variable for the handshake
    enum logic [1:0] {IDLE, READY} state;
    
    // Output initially not ready
    assign slave_ready = 1'b0;
    
    // State machine for the handshake
    always_ff @(posedge clk, negedge rst) begin
        if (!rst) begin
            state <= IDLE;  // Reset state machine
        end else begin
            case (state)
                IDLE: begin
                    // If master is ready, move to READY state
                    if (master_ready) begin
                        state <= READY;
                    end
                end
                READY: begin
                    // Stay in READY state until master indicates not ready
                    if (!master_ready) begin
                        state <= IDLE;
                    end
                end
                default: state <= IDLE;  // Default case
            endcase
        end
    end
endmodule