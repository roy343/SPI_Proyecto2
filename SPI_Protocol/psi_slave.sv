// Módulo top

module psi_slave(input MOSI , clk, cs, rst, rdy, dn, 
						 output MISO, 
						 output reg [3:0]lds,							 // Señal de los 4 leds que muestran el mensaje recibido del Master
						 output reg start,								 
						 output logic SA, SB, SC, SD, SE, SF, SG); // Señales del 7 segmentos
						 
			logic mosi;
			
			assign mosi = ~cs&MOSI;
			
			handshake hs(clk, rst, rdy, dn, start);
			SPregister regist(mosi, clk, lds);
			flipflop ff(mosi, clk, MISO);
			code1 uut (
			 .A(lds[3]),
			 .B(lds[2]),
			 .C(lds[1]),
			 .D(lds[0]),
			 .SA(SA),
			 .SB(SB),
			 .SC(SC),
			 .SD(SD),
			 .SE(SE),
			 .SF(SF),
			 .SG(SG)
		  );
		  
		  
			
	
	
endmodule