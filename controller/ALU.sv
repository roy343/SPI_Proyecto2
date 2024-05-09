module ALU(input logic [3:0] a,b,
			  input logic [1:0] opCode,
			  output logic [3:0] out,
			  output logic N_flag,Z_flag,C_flag,V_flag);
			  
		logic [3:0] and_temp, or_temp,b_temp,sum;
		logic c1,c0,carry_out;
		
		assign c1 = opCode[1];
		assign c0 = opCode[0];
		
		
		mux_2_4bit mux2(b,~b,c0,b_temp);
		
		
		adder_4bit add4bits(a,b_temp,0,sum,carry_out);
		
		assign and_temp = a & b;
		
		assign or_temp = a | b;
	
		mux_4bit mux4(and_temp,or_temp,sum,sum,c1,c0,out);
		
		assign N_flag = out[3];
		
		assign Z_flag = ~|out;
		
		assign C_flag = carry_out|~c1;
		
		assign V_flag = (c0^~a[3]^~b[3])|(a[3]^sum[3])|(~c1);
		
			  
endmodule