module adder_tb();

	logic a,b,c_in,out,c_out;

	adder fadder(a,b,c_in,out,c_out);
	
	initial begin 
	
	a = 1'b0;
	b = 1'b0;
	c_in = 1'b0;

	#40
	
	a = 1'b0;
	b = 1'b1;
	c_in = 1'b0;

	
	#40
	
	a = 1'b1;
	b = 1'b0;
	c_in = 1'b0;


	#40
	
	a = 1'b1;
	b = 1'b1;
	c_in = 1'b0;

	
	
	end
endmodule