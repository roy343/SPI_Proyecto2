module seven_segdisp(
    input logic [3:0] alu_out,  // Entrada binaria desde la FPGA
    output logic [6:0] seg    // Salida para los segmentos del display
);

// Definir las configuraciones de los segmentos para cada dígito
// Usamos un array donde cada elemento corresponde a un número en binario
logic [6:0] segmentos [0:15] = '{7'b0111111, 7'b0000110, 7'b1011011, 7'b1001111, 
                                7'b1100110, 7'b1101101, 7'b1111101, 7'b0000111, 
                                7'b1111111, 7'b1101111, 7'b1110111, 7'b1111100, 
                                7'b0111001, 7'b1011110, 7'b1111001, 7'b1110001};

// Asignar la configuración de segmentos correspondiente al número binario alu_out
assign seg = segmentos[alu_out];

endmodule