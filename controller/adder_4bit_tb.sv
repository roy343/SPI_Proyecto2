module adder_4bit_tb();

	logic[3:0] a,b;
	logic[3:0]out;
	logic c_in, c_out;
	
	
	adder_4bit add4bit(a,b,c_in,out,c_out);
	
	initial begin 
	
	a = 4'b0000;
	b = 4'b0001;
	c_in = 1'b0;
	

	#40
	
	a = 4'b0000;
	b = 4'b0001;
	c_in = 1'b0;

	#40
	
	a = 4'b0010;
	b = 4'b0001;
	c_in = 1'b0;

	#40
	
	a = 4'b0010;
	b = 4'b0010;
	c_in = 1'b0;
	
	#40
	
	a = 4'b1111;
	b = 4'b0001;
	c_in = 1'b0;
	
	end
endmodule