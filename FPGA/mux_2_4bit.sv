module mux_2_4bit(input logic[3:0] a,b,
					input logic s,
					output logic[3:0] z);
					
		logic[0:3] z_aux;
					
		mux_2_1 mux0(a[0],b[0],s,z_aux[3]);
		mux_2_1 mux1(a[1],b[1],s,z_aux[2]);
		mux_2_1 mux2(a[2],b[2],s,z_aux[1]);
		mux_2_1 mux3(a[3],b[3],s,z_aux[0]);

		
		assign z = z_aux;

endmodule