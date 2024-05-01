module ALU(input logic [3:0] a,b,
			  input logic [1:0] opCode,
			  output logic [3:0] out);
			  
		logic [3:0] and_temp, or_temp;
		
		
		
		
		assign and_temp = a & b;
		
		assign or_temp = a | b;
	
		mux_4_1 mux41(a,b,and_temp,or_temp,c1,c0,z);
		
			  
endmodule