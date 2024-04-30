module tb_pwm_alu;

  // Parámetros de simulación
  parameter CLK_PERIOD = 50; // Período del reloj en unidades de tiempo de simulación
  parameter SIM_TIME = 20000;  // Tiempo de simulación total

  // Declaraciones de señales
  reg clk = 0;          // Clock
  reg rst = 1;          // Reset
  reg [3:0] alu_out;    // Valor de la ALU (0 a 15)
  wire pwm;             // Salida PWM

  // Instanciar el módulo bajo prueba
  pwm_alu dut (
    .clk(clk),
    .rst(rst),
    .alu_out(alu_out),
    .pwm(pwm)
  );

  // Generar el reloj
  always #(CLK_PERIOD / 2) clk = ~clk;

  // Inicializar la señal de reset
  initial begin
    rst = 1;
    #10; // Esperar un tiempo para que los valores se estabilicen
    rst = 0;
  end

  // Simular el comportamiento del módulo
  initial begin
    // Valor de entrada de la ALU igual a 6 (40% de ciclo de trabajo)
    alu_out = 2;
    
    // Iniciar la simulación
    $dumpfile("tb_pwm_alu.vcd"); // Archivo VCD para visualización en waveform
    $dumpvars(0, tb_pwm_alu);     // Volcar las variables
    #0; // Empezar la simulación con un retraso de 0 unidades de tiempo
    $display("Inicio de la simulación");
    #SIM_TIME; // Ejecutar la simulación durante SIM_TIME unidades de tiempo
    $display("Fin de la simulación");
    $finish; // Terminar la simulación
  end

endmodule
