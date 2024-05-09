module ALU(input logic [3:0] a,b,
			  input logic [1:0] opCode,
			  output logic [3:0] out,
			  output logic carry_out);
			  
		logic [3:0] and_temp, or_temp,b_temp,c,d;
		logic c1,c0;
		
		assign c1 = opCode[1];
		assign c0 = opCode[0];
		
		
		mux_2_4bit mux2(b,~b,c0,b_temp);
		
		
		adder_4bit add4bits(a,b_temp,0,c,carry_out);
		
		assign and_temp = a & b;
		
		assign or_temp = a | b;
	
		mux_4bit mux4(and_temp,or_temp,c,c,c1,c0,out);
		
			  
endmodule