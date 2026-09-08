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




endmodule
//pontos indicados em 4 display
    //contagem de pontos no min(0000) e no max(9999)
    //cada equipe deve possuir dois botões de controle(incr e decr)
    /*pressionar o botão de incr/decr a contagem n pode pular -> para isso deve ser usado um circuio
    de detecção de borda e ou debouncer em cada um destes botoes de forma que o inc/decr sejam UNITARIOS
*/
    //botão para o reset colocada em nível lógico alto
