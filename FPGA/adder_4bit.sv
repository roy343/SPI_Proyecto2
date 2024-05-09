module adder_4bit(input logic[3:0] a,b,
						input logic c_in,
						output logic[4:0] out,
						output logic c_out);
						
						
						
						logic[4:0] carry_aux;
						
						assign carry_aux[0] = c_in;

						adder add0(a[0],b[0],carry_aux[0],out[0],carry_aux[1]);
						adder add1(a[1],b[1],carry_aux[1],out[1],carry_aux[2]);
						adder add2(a[2],b[2],carry_aux[2],out[2],carry_aux[3]);
						adder add3(a[3],b[3],carry_aux[3],out[3],carry_aux[4]);
						
						assign out[4] = carry_aux[4];
						
						assign c_out = carry_aux[4];
						
						

endmodule