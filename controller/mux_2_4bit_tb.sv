module mux_2_4bit_tb();

	logic[3:0] a,b,z;
	logic s;
	

	mux_2_4bit mux21(a,b,s,z);
	
	initial begin 
	
	a = 4'b0010;
	b = ~a;
	s = 1'b0;


	#40
	
	a = 4'b0010;
	b = ~a;
	s = 1'b1;


	
	
	end
endmodule