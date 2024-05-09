module ALU_tb();

	logic[3:0] a,b,out;
	logic[1:0] opCode;
	
	ALU alu(a,b,opCode,out);
	
	initial begin 
	
	a = 4'b0010;
	b = 4'b0010;
	opCode = 2'b00;

	#40
	
	a = 4'b0010;
	b = 4'b0010;
	opCode = 2'b01;

	#40
	
	a = 4'b0010;
	b = 4'b0010;
	opCode = 2'b10;

	#40
	
	a = 4'b0010;
	b = 4'b0011;
	opCode = 2'b11;
	
	
	end
endmodule
	