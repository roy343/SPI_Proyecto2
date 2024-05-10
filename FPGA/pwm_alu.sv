module pwm_alu (
    input wire clk,      // Clock de entrada
    input wire rst,      // Reset sincrónico activo alto
    input wire [3:0] alu_out,  // Valor de entrada desde la ALU (0 a 15)
    output reg pwm       // Salida PWM
);

// Contador de ciclo de trabajo
reg [3:0] counter;
reg [3:0] counter_next;

// Lógica de contador
always @(posedge clk or posedge rst) begin
    counter <= (rst & ~clk) ? 4'b0000 : counter_next;
end

// Lógica de PWM
always @(*) begin
    counter_next = counter + 1;
    pwm = (counter < alu_out) & (~rst);
end

endmodule
