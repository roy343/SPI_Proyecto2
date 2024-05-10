module spi_receiver(
    input logic MOSI,
    input logic clk, rst,
    input logic rdy, dn,
    output logic [7:0] received_data,
    output logic [3:0] data1,
    output logic [3:0] data2,
    output logic start
);

    // Register to hold the received data
    reg [7:0] received_data_reg;
    // Register to hold the next state
    reg [1:0] next_state;

    // Data selection multiplexers
    wire [7:0] selected_data;
    assign selected_data = (next_state == 2'b01 && dn && rdy) ? {received_data_reg[6:0], MOSI} : received_data_reg;

    // Register to capture received data
    always @(posedge clk) begin
        received_data_reg <= selected_data;
    end

    // Register to capture the next state
    always @(posedge clk) begin
        next_state <= (next_state == 2'b01 && dn && rdy) ? 2'b01 : next_state;
    end

    // Generate start signal
    assign start = (next_state == 2'b00 && rdy);
	 
	 assign data1 = received_data_reg[3:0];
    assign data2 = received_data_reg[7:4];
	 assign received_data = received_data_reg;

endmodule