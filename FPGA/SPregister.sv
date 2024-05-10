// Submódulo que asigna cada bit recibido al array de leds

module SPregister(input MOSI, clk,
						output reg[9:0] data_received);
						
	wire Q1, Q2, Q3, Q4;
						
	flipflop ff1(MOSI, clk, Q1);
	
	assign data_received[0] = Q1;
	
	flipflop ff2(Q1, clk, Q2);
	
	assign data_received[1] = Q2;
	
	flipflop ff3(Q2, clk, Q3);
	
	assign data_received[2] = Q3;
	
	flipflop ff4(Q3, clk, Q4);
	
	assign data_received[3] = Q4;
	
	flipflop ff5(Q4, clk, Q5);
	
	assign data_received[4] = Q5;
	
	flipflop ff6(Q5, clk, Q6);
	
	assign data_received[5] = Q6;
	
	flipflop ff7(Q6, clk, Q7);
	
	assign data_received[6] = Q7;
	
	flipflop ff8(Q7, clk, Q8);
	
	assign data_received[7] = Q8;
	
	flipflop ff9(Q8, clk, Q9);
	
	assign data_received[8] = Q9;
	
	flipflop ff10(Q9, clk, Q10);
	
	assign data_received[9] = Q10;
		

endmodule