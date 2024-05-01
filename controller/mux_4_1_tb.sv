module mux_4_1_tb();

	logic a,b,c,d,z;
	logic c1, c0;

	mux_4_1 mux41(a,b,c,d,c1,c0,z);
	
	initial begin 
	
	a = 1'b0;
	b = 1'b1;
	c = 1'b0;
	d = 1'b1;
	c1 = 1'b0;
	c0 = 1'b0;

	#40
	
	a = 1'b0;
	b = 1'b1;
	c = 1'b0;
	d = 1'b1;
	c1 = 1'b0;
	c0 = 1'b1;
	
	#40
	
	a = 1'b0;
	b = 1'b1;
	c = 1'b0;
	d = 1'b1;
	c1 = 1'b1;
	c0 = 1'b0;

	#40
	
	a = 1'b0;
	b = 1'b1;
	c = 1'b0;
	d = 1'b1;
	c1 = 1'b1;
	c0 = 1'b1;

	
	
	end
endmodule

