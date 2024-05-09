module SPI_to_Arrays (
    input wire clk,            // Señal de reloj
    input wire reset_n,        // Señal de reinicio asincrónico (activo bajo)
    input wire [15:0] data_in, // Datos recibidos del Arduino (dos operandos y un código de operación de 4 bits cada uno)
    output reg [3:0] operand1, // Primer operando de 4 bits
    output reg [3:0] operand2, // Segundo operando de 4 bits
    output reg [1:0] opcode    // Código de operación de 2 bits
);

reg [3:0] operand1_reg;  // Registro para almacenar el primer operando
reg [3:0] operand2_reg;  // Registro para almacenar el segundo operando
reg [1:0] opcode_reg;    // Registro para almacenar el código de operación

always @(posedge clk or negedge reset_n) begin
    operand1_reg <= (reset_n) ? data_in[15:12] : 4'b0;
    operand2_reg <= (reset_n) ? data_in[11:8] : 4'b0;
    opcode_reg <= (reset_n) ? data_in[7:6] : 2'b0;
end

// Asignar registros a las salidas
assign operand1 = operand1_reg;
assign operand2 = operand2_reg;
assign opcode = opcode_reg;

endmodule
