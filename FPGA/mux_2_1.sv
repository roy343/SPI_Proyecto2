module mux_2_1(input logic a,b,s,
					output logic z);
		 
		 assign z = (a&~s)|(b&s);
							
				
endmodule