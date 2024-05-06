module seven_segdisp (
    input wire clk,      // Clock de entrada
    input wire rst,      // Reset sincrónico activo alto
    input wire [3:0] alu_out,  // Valor de entrada desde la ALU (0 a 15)
    output reg [6:0] seg // Salida de 7 segmentos
);

// Registro para almacenar el patrón de segmentos
reg [6:0] seg_pattern;

// Ecuaciones booleanas para el patrón de segmentos
assign seg_pattern = (alu_out == 4'b0000) ? 7'b1000000 : // 0
                     (alu_out == 4'b0001) ? 7'b1111001 : // 1
                     (alu_out == 4'b0010) ? 7'b0100100 : // 2
                     (alu_out == 4'b0011) ? 7'b0110000 : // 3
                     (alu_out == 4'b0100) ? 7'b0011001 : // 4
                     (alu_out == 4'b0101) ? 7'b0010010 : // 5
                     (alu_out == 4'b0110) ? 7'b0000010 : // 6
                     (alu_out == 4'b0111) ? 7'b1111000 : // 7
                     (alu_out == 4'b1000) ? 7'b0000000 : // 8
                     (alu_out == 4'b1001) ? 7'b0010000 : // 9
                     (alu_out == 4'b1010) ? 7'b0001000 : // A
                     (alu_out == 4'b1011) ? 7'b0000011 : // B
                     (alu_out == 4'b1100) ? 7'b1000110 : // C
                     (alu_out == 4'b1101) ? 7'b0100001 : // D
                     (alu_out == 4'b1110) ? 7'b0000110 : // E
                     (alu_out == 4'b1111) ? 7'b0001110 : // F
                     7'b1111111; // Apagar todos los segmentos si la entrada es inválida

// Registro para almacenar el patrón de segmentos
always @(posedge clk or posedge rst) begin
    seg <= (rst) ? 7'b1111111 : seg_pattern; // Asignación condicional para manejar el reset
end

endmodule
