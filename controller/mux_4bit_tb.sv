module mux_4bit_tb();

	logic[3:0] a,b,c,d,z;
	logic c1, c0;

	mux_4bit mux41(a,b,c,d,c1,c0,z);
	
	initial begin 
	
	a = 4'b0001;
	b = 4'b0010;
	c = 4'b1101;
	d = 4'b0010;
	c1 = 1'b0;
	c0 = 1'b0;
	#40
	
	a = 4'b0001;
	b = 4'b0010;
	c = 4'b1101;
	d = 4'b0010;
	c1 = 1'b0;
	c0 = 1'b1;
	#40
	
	a = 4'b0001;
	b = 4'b0010;
	c = 4'b1101;
	d = 4'b0010;
	c1 = 1'b1;
	c0 = 1'b0;
	#40
	
	a = 4'b0001;
	b = 4'b0010;
	c = 4'b1101;
	d = 4'b0010;
	c1 = 1'b1;
	c0 = 1'b1;


	
	
	


	
	
	end
endmodule