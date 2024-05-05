module mux_2_1_tb();

	logic a,b,s,z;
	

	mux_2_1 mux21(a,b,s,z);
	
	initial begin 
	
	a = 1'b0;
	b = 1'b1;
	s = 1'b0;


	#40
	
	a = 1'b1;
	b = 1'b0;
	s = 1'b0;

	
	#40
	
	a = 1'b0;
	b = 1'b1;
	s = 1'b1;



	#40
	
	a = 1'b1;
	b = 1'b0;
	s = 1'b1;

	
	
	end
endmodule