module mux_4_1(input logic a,b,c,d,
					input logic c1,c0,
					output logic [3:0] z);
					


	assign z = (~c0 & ~c1 & a) | (~c1 & c0 & b) | (c1 & ~c0 & c) | (c1 & c0 & d);

endmodule

