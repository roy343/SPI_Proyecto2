// Submódulo que almacena las señales en flipflops

module flipflop(input D, clk,
					 output reg Q);
					 
		always @(posedge clk)begin
		
			Q <= D;
		
		end
		
endmodule