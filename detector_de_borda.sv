module detector_de_borda (
    input logic clock,
    input logic reset,
    
    input logic decr_a,
    input logic decr_b,
    input logic incr_a,
    input logic incr_b,

    output logic borda_incr_a,
    output logic borda_incr_b,
    output logic borda_decr_a,
    output logic borda_decr_b,

    output logic reset_out
);

    assign reset_out = reset; //reset n sofre efeito da bosrda, passa direto

    single_edge_detector u_incr_a (
        .clk(clock), .rst(reset),
        .sig_in(incr_a), .edge_out(borda_incr_a)
    );

    single_edge_detector u_decr_a (
        .clk(clock), .rst(reset),
        .sig_in(decr_a), .edge_out(borda_decr_a)
    );

    single_edge_detector u_incr_b (
        .clk(clock), .rst(reset),
        .sig_in(incr_b), .edge_out(borda_incr_b)
    );

    single_edge_detector u_decr_b (
        .clk(clock), .rst(reset),
        .sig_in(decr_b), .edge_out(borda_decr_b)
    );

endmodule
    