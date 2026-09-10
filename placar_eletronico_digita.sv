module placar_eletronico_digital (
    input logic clock,
    input logic reset,
    input logic incr_a,
    input logic decr_a,
    input logic incr_b,
    input logic decr_b,

    output logic[6:0] display,
    output logic[7:0] display_en
);

    //variáveis internas
    logic clock_div;
    logic [2:0] saida_contador;

    logic [3:0] unidade_A;
    logic [3:0] dezena_A;
    logic [3:0] centena_A;
    logic [3:0] milhar_A;
    logic [3:0] unidade_B;
    logic [3:0] dezena_B;
    logic [3:0] centena_B;
    logic [3:0] milhar_B;

    logic borda_incr_a;
    logic borda_decr_a;
    logic borda_incr_b;
    logic borda_decr_b;


    divisor_clock div_clk (
        .clk_in   (clock),
        .clk_out   (clock_div)
    );

    modulo_contador cont(
        .clk     (clock_div),
        .rst     (reset),
        .cont_out (saida_contador)
    );

    decoder dec (
        .contador (saida_contador),
        .display_en (display_en)
    );

    mux_decoder mux (
        .contador (saida_contador),

        .unidade_A(unidade_A),
        .dezena_A(dezena_A),
        .centena_A(centena_A),
        .milhar_A(milhar_A),
        .unidade_B(unidade_B),
        .dezena_B(dezena_B),
        .centena_B(centena_B),
        .milhar_B(milhar_B),

        .display (display)
    );

    detectores_de_borda detectores (
        .clk(clock),
        .reset(reset),

        .incr_a(incr_a),
        .decr_a(decr_a),
        .incr_b(incr_b),
        .decr_b(decr_b),

        .borda_incr_a(borda_incr_a),
        .borda_decr_a(borda_decr_a),
        .borda_incr_b(borda_incr_b),
        .borda_decr_b(borda_decr_b)
    );

    contador_equipe_A equipe_a (
        .clk(clock),
        .rst(reset),

        .borda_incr_a(borda_incr_a),
        .borda_decr_a(borda_decr_a),

        .unidade_A(unidade_A),
        .dezena_A(dezena_A),
        .centena_A(centena_A),
        .milhar_A(milhar_A)
    );

    contador_equipe_B equipe_b (
        .clk(clock),
        .rst(reset),

        .borda_incr_b(borda_incr_b),
        .borda_decr_b(borda_decr_b),

        .unidade_B(unidade_B),
        .dezena_B(dezena_B),
        .centena_B(centena_B),
        .milhar_B(milhar_B)
    );





endmodule
