// Submódulo que almacena las señales en flipflops

module flipflop(input logic D, clk,
					 output logic Q);
					 
		always @(posedge clk)begin
		
			Q <= D;
		
		end
		
endmodule