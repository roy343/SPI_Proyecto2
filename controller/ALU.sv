module ALU(input logic [3:0] a,b,
			  input logic [1:0] opCode,
			  output logic [3:0] out);
			  
		logic [3:0] and_temp, or_temp,c,d;;
		logic c1,c0;
		
		assign c1 = opCode[1];
		assign c0 = opCode[0];
		
		//Falta cambiar a estructural
		assign c = a + b;
		assign d = a - b;
		
		
		assign and_temp = a & b;
		
		assign or_temp = a | b;
	
		mux_4bit mux4(and_temp,or_temp,c,d,c1,c0,out);
		
			  
endmodule