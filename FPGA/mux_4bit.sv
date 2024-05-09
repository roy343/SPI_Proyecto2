module mux_4bit(input logic[3:0] a,b,c,d,
					input logic c1,c0,
					output logic[3:0] z);
					
		logic[0:3] z_aux;
					
		mux_4_1 mux0(a[0],b[0],c[0],d[0],c1,c0,z_aux[3]);
		mux_4_1 mux1(a[1],b[1],c[1],d[1],c1,c0,z_aux[2]);
		mux_4_1 mux2(a[2],b[2],c[2],d[2],c1,c0,z_aux[1]);
		mux_4_1 mux3(a[3],b[3],c[3],d[3],c1,c0,z_aux[0]);
		
		assign z = z_aux;

endmodule