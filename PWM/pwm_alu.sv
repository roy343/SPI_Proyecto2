module pwm_alu (
    input wire clk,      // Clock de entrada
    input wire rst,      // Reset sincrónico activo alto
    input wire [3:0] alu_out,  // Valor de entrada desde la ALU (0 a 15)
    output reg pwm       // Salida PWM
);

// Contador de ciclo de trabajo
reg [3:0] counter;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        counter <= 0;
        pwm <= 0;
    end else begin
        if (counter < alu_out) begin
            pwm <= 1;
        end else begin
            pwm <= 0;
        end
        if (counter == 15) begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
    end
end

endmodule
