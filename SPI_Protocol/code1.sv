// Submódulo para mostrar mensaje en 7 segmentos


module and_gate(
  input logic A,
  input logic B,
  output logic Y
);
  assign Y = A & B;
endmodule

module and_gate3(
  input logic A,
  input logic B,
  input logic C,
  output logic Y
);
  assign Y = A & B & C;
endmodule

module and_gate4(
  input logic A,
  input logic B,
  input logic C,
  input logic D,
  output logic Y
);
  assign Y = A & B & C & D;
endmodule

module or_gate(
  input logic A,
  input logic B,
  input logic C,
  input logic D,
  output logic Y
);
  assign Y = ~(A | B | C | D);
endmodule

module or_gate2(
  input logic A,
  input logic B,
  output logic Y
);
  assign Y = ~(A | B );
endmodule

module not_gate(
  input logic A,
  output logic Y
);
  assign Y = ~A;
endmodule

module code1(
  input logic A,
  input logic B,
  input logic C,
  input logic D,
  output logic SA,
  output logic SB,
  output logic SC,
  output logic SD,
  output logic SE,
  output logic SF,
  output logic SG
);

wire X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11, X12, X13, X14, X15, X16, X17, X18, X19, X20, X21, X22, X23, X24, X25, X26;

and_gate U1 (.A(~A), .B(C), .Y(X1));
and_gate3 U2 (.A(A), .B(~B), .C(~C), .Y(X2));
and_gate3 U3 (.A(~B), .B(~C), .C(~D), .Y(X3));
and_gate3 U4 (.A(~A), .B(B), .C(D), .Y(X4));
or_gate U5 (.A(X1), .B(X2), .C(X3), .D(X4), .Y(SA));

and_gate U6 (.A(~A), .B(~B), .Y(X5));
and_gate U7 (.A(~B), .B(~C), .Y(X6));
and_gate3 U8 (.A(~A), .B(C), .C(D), .Y(X7));
and_gate U9 (.A(~C), .B(~D), .Y(X8));
or_gate U10 (.A(X5), .B(X6), .C(X7), .D(X8), .Y(SB));

and_gate U11 (.A(~A), .B(~C), .Y(X9));
and_gate U12 (.A(~B), .B(~C), .Y(X10));
and_gate U13 (.A(~A), .B(D), .Y(X11));
and_gate U14 (.A(~A), .B(B), .Y(X12));
or_gate U15 (.A(X9), .B(X10), .C(X11), .D(X12), .Y(SC));

and_gate3 U16 (.A(~B), .B(~C), .C(~D), .Y(X13));
and_gate3 U17 (.A(~A), .B(~B), .C(C), .Y(X14));
and_gate3 U18 (.A(~A), .B(C), .C(~D), .Y(X15));
and_gate4 U19 (.A(~A), .B(B), .C(~C), .D(D), .Y(X16));
or_gate U20 (.A(X13), .B(X14), .C(X15), .D(X16), .Y(SD));

and_gate3 U21 (.A(~B), .B(~C), .C(~D), .Y(X17));
and_gate3 U22 (.A(~A), .B(C), .C(~D), .Y(X18));
or_gate2 U23 (.A(X17), .B(X18), .Y(SE));

and_gate U24 (.A(~C), .B(~D), .Y(X19));
and_gate U25 (.A(B), .B(~C), .Y(X20));
and_gate U26 (.A(A), .B(~C), .Y(X21));
and_gate3 U27 (.A(~A), .B(B), .C(~D), .Y(X22));
or_gate U28 (.A(X19), .B(X20), .C(X21), .D(X22), .Y(SF));

and_gate U29 (.A(B), .B(~C), .Y(X23));
and_gate U30 (.A(A), .B(~C), .Y(X24));
and_gate3 U31 (.A(~A), .B(C), .C(~D), .Y(X25));
and_gate3 U32 (.A(~A), .B(~B), .C(C), .Y(X26));
or_gate U33 (.A(X23), .B(X24), .C(X25), .D(X26), .Y(SG));
endmodule




