module detectores_de_borda (
    input  logic clk,
    input  logic reset,      // segue direto (bypass), como no diagrama

    input  logic incr_a,
    input  logic decr_a,
    input  logic incr_b,
    input  logic decr_b,

    output logic borda_incr_a,
    output logic borda_decr_a
    output logic borda_incr_b
    output logic borda_decr_b

    output logic reset_out
);

    assign reset_out = reset;

    edge_detector incr_a (
        .clk(clk), .rst(reset),
        .data(incr_a), .edge_out(borda_incr_a)
    );

    edge_detector decr_a (
        .clk(clk), .rst(reset),
        .data(decr_a), .edge_out(borda_decr_a)
    );

    edge_detector incr_b (
        .clk(clk), .rst(reset),
        .data(incr_b), .edge_out(borda_incr_b)
    );

    edge_detector decr_b (
        .clk(clk), .rst(reset),
        .data(decr_b), .edge_out(borda_decr_b)
    );

endmodule
