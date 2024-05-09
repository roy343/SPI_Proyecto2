// Módulo top

module top(input logic MOSI , clk, cs, rst, rdy, dn, 
						 output MISO, 
						 output logic [3:0]lds,							 // Señal de los 4 leds que muestran el mensaje recibido del Master
						 output logic start,
						 output logic pwm,
						 output logic [6:0] seg); // Señales del 7 segmentos
						 
			logic mosi;
			
			logic [3:0] a,b;
			logic [1:0] opCode;
			logic [3:0] out;
			logic       carry_out;
			
			assign mosi = ~cs&MOSI;
			
			
			handshake hs(clk, rst, rdy, dn, start);
			
			SPregister regist(mosi, clk, lds);
			
			flipflop ff(mosi, clk, MISO);
			
			/*
			pwm_alu pwm_alu (
				.clk(clk),
				.rst(rst),
				.alu_out(out),
				.pwm(pwm)	
			);
			
			seven_segdisp uut (
			 .clk(clk),
			 .rst(rst),
			 .alu_out(lds)
		  );
		  

		  
		   ALU alu(
				.a (a),
				.b (b),
				.opCode (opCode),
				.out(out),
				.carry_out(carry_out)
			);
			
			*/
	
	
endmodule