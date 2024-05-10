module SPI_to_Arrays (
    input wire clk,            // Clock signal
    input wire reset_n,        // Asynchronous reset signal (active low)
    input wire [7:0] data_in, // Data received from Arduino (two operands and a 4-bit operation code each)
    output reg [3:0] operand1, // First 4-bit operand
    output reg [3:0] operand2 // Second 4-bit operand
);

    // Registers to store operands and operation code
    reg [3:0] operand1_reg;
    reg [3:0] operand2_reg;

    // Update registers on positive clock edge and asynchronous reset
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            operand1_reg <= 4'b0;
            operand2_reg <= 4'b0;
        end else begin
            operand1_reg <= data_in[3:0];
            operand2_reg <= data_in[7:4];
        end
    end

    // Assign registers to outputs
    assign operand1 = operand1_reg;
    assign operand2 = operand2_reg;

endmodule
