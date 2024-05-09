module pwm_alu (
    input logic clk,      // Clock de entrada
    input logic rst,      // Reset sincrónico activo alto
    input logic [3:0] alu_out,  // Valor de entrada desde la ALU (0 a 15)
    output logic pwm       // Salida PWM
);

// Contador de ciclo de trabajo
reg [3:0] counter;
reg [3:0] counter_next;

// Lógica de contador
always @(posedge clk or posedge rst) begin
    if (rst) begin
        counter <= 4'b0000;
    end else begin
        counter <= counter_next;
    end
end

// Lógica de PWM
always @(*) begin
    counter_next = counter + 1;
    pwm = (counter < alu_out) & (~rst);
end

endmodule