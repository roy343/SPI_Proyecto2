module mux_4_1_tb();

	logic[3:0] a,b,c,d,z;
	logic c1, c0;

	mux_4_1 mux41(a,b,c,d,c1,c0,d,z);
	
	initial begin 
	
	a = 4'b0000;
	b = 4'b0001;
	c = 4'b0000;
	d = 4'b0000;
	c1 = 1'b0;
	c0 = 1'b1;

	#40
	
	a = 4'b0001;
	b = 4'b0000;
	c = 4'b0000;
	d = 4'b0000;
	c1 = 1'b0;
	c0 = 1'b0;

	
	
	end
endmodule

