module top(
    input logic MOSI , clk, cs, rst, 
	 input logic spi_sck,       // SPI Serial Clock
	 input logic [1:0] mode,
    output logic spi_MISO, 
    output logic [3:0]lds,  // Señal de los 4 leds que muestran el mensaje recibido del Master
    output logic pwm,
    output logic [6:0] seg,
    output logic       N_flag, C_flag, Z_flag, V_flag,
	 output logic		  slave_ready
	 
);

    //logic  mosi;
    logic [7:0] received_data;
	 logic [3:0] data1;
    logic [3:0] data2;
    logic [3:0] out;
	 

    assign mosi = ~cs&MOSI;
	 
	 assign lds[0] = out[0];
	 assign lds[1] = out[1];
	 assign lds[2] = out[2];
	 assign lds[3] = out[3];
	 
	 // Displaying received_data on LEDs (example)
    //assign MISO = out;
	 

    // Instantiations 
	 
	 SPI_Slave slave(
        .SCK(spi_sck),
        .MOSI(MOSI),
        .SS(cs),
        .received_data(received_data),
    ); 
	 

	 
	 
	 SPI_to_Arrays uus (
			.clk(clk),
			.reset_n(rst),
			.data_in(received_data),
			.operand1(data1),
			.operand2(data2),			
		);
		
    handshake hs(clk, rst, cs, slave_ready);
    flipflop ff(mosi, clk, spi_MISO);
    
    ALU alu(
        .a (data1),
        .b (data2),
        .opCode (mode),
        .out(out),
        .N_flag(N_flag),
        .Z_flag(Z_flag),
        .C_flag(C_flag),
        .V_flag(V_flag)
    );
	 
	 pwm_alu pwm_ (
        .clk(clk),
        .rst(rst),
        .alu_out(out),
        .pwm(pwm)    
    );
	 
	 /*
    seven_segdisp uut (
        .alu_out(out),
        .seg(seg)
    );
		*/


endmodule
