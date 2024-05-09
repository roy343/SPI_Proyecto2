module ALU(
    input  logic [3:0] a,
    input  logic [3:0] b,
    input  logic [1:0] opCode,
    output logic [3:0] out,
    output logic carry_out
);

    logic [3:0] and_temp, or_temp, c, d;
    logic c1, c0;
    logic carry_out_add4bits, carry_out_add4bitm;

    assign c1 = opCode[1];
    assign c0 = opCode[0];

    // Instantiate adders
    adder_4bit add4bits(a, b, 0, c, carry_out_add4bits);
    adder_4bit add4bitm(a, ~b, 0, d, carry_out_add4bitm);

    assign and_temp = a & b;
    assign or_temp = a | b;

    // Mux to select output based on opCode
    mux_4bit mux4(and_temp, or_temp, c, d, c1, c0, out);

    // The carry_out will be selected based on the opCode
    mux_2_1 carry_mux (opCode[1], carry_out_add4bits, carry_out_add4bitm, carry_out);


endmodule