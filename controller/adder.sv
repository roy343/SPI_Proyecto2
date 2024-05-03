module adder(input logic a,b, c_in,
					output logic out,c_out);
					


	assign out = a ^ b ^ c_in;
	assign c_out = (a & b) | (c_in & a) | (c_in & b);

endmodule