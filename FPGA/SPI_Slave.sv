module SPI_Slave (
    input logic SCK, // Reloj serial
    input logic MOSI, // Datos del maestro al esclavo
    input logic SS, // Selección del esclavo
    output logic [7:0] received_data // Datos recibidos
);

    logic [7:0] shift_reg; // Registro para almacenar los datos recibidos

    always_ff @(posedge SCK) begin
        if (SS == 1'b0) begin // El dispositivo esclavo está seleccionado
            // Desplaza el registro a la izquierda y agrega el nuevo bit recibido en MOSI
            shift_reg <= {shift_reg[6:0], MOSI};
        end
    end

    // Salida de los datos recibidos
    assign received_data = shift_reg;

endmodule