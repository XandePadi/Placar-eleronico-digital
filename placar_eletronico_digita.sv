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

    





endmodule
//pontos indicados em 4 display
    //contagem de pontos no min(0000) e no max(9999)
    //cada equipe deve possuir dois botões de controle(incr e decr)
    /*pressionar o botão de incr/decr a contagem n pode pular -> para isso deve ser usado um circuio
    de detecção de borda e ou debouncer em cada um destes botoes de forma que o inc/decr sejam UNITARIOS
*/
    //botão para o reset colocada em nível lógico alto