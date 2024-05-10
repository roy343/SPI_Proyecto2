module tb_top();

    // Inputs
    logic MOSI, clk, cs, rst, rdy, dn;

    // Outputs
    logic MISO;
    logic [3:0] lds, out;
    logic pwm;
    logic [6:0] seg;
    logic N_flag, C_flag, Z_flag, V_flag;
    logic slave_ready;

    // Instantiate the top module
    top dut (
        .MOSI(MOSI),
        .clk(clk),
        .cs(cs),
        .rst(rst),
        .rdy(rdy),
        .dn(dn),
        .MISO(MISO),
        .lds(lds),
        .out(out),
        .pwm(pwm),
        .seg(seg),
        .N_flag(N_flag),
        .C_flag(C_flag),
        .Z_flag(Z_flag),
        .V_flag(V_flag),
        .slave_ready(slave_ready)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Initialize signals
    initial begin
        clk = 1'b0;
        rst = 1'b1;
        cs = 1'b0;
        rdy = 1'b0;
        dn = 1'b0;
        // Add more initializations as needed
        #10 rst = 1'b0;
        #100 $finish;
    end

    // Apply test vectors
    initial begin
        // Apply test vectors to input signals
        // For example, toggle MOSI and assert cs, rdy, dn signals as needed
        #20 MOSI = 10'b1010111010;
        cs = 1'b1;
        rdy = 1'b1;
        dn = 1'b1;
        // Add more test vectors as needed
        #50 cs = 1'b0;
        #50 rdy = 1'b0;
        #50 dn = 1'b0;
    end


endmodule
