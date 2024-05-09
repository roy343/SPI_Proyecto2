module ALU_tb();

	logic[3:0] a,b,out;
	logic[1:0] opCode;
	
	ALU alu(a,b,opCode,out,N_flag,Z_flag,C_flag,V_flag);
	
	initial begin 
	
	a = 4'b0010;
	b = 4'b0010;
	opCode = 2'b00;

	#40
	
	a = 4'b0010;
	b = 4'b0010;
	opCode = 2'b01;

	#40
	
	a = 4'b1111;
	b = 4'b0001;
	opCode = 2'b10;

	#40
	
	a = 4'b0010;
	b = 4'b0010;
	opCode = 2'b11;
	
	
	end
endmodule
	