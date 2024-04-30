// Submódulo que asigna cada bit recibido al array de leds

module SPregister(input MOSI, clk,
						output reg[3:0] leds);
						
	wire Q1, Q2, Q3, Q4;
						
	flipflop ff1(MOSI, clk, Q1);
	
	assign leds[0] = Q1;
	
	flipflop ff2(Q1, clk, Q2);
	
	assign leds[1] = Q2;
	
	flipflop ff3(Q2, clk, Q3);
	
	assign leds[2] = Q3;
	
	flipflop ff4(Q3, clk, Q4);
	
	assign leds[3] = Q4;
		

endmodule