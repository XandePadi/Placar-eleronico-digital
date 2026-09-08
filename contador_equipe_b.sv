module contador_equipe_b (
    input clk,
    input rst,

    input incr_b,
    input decr_b

    output numero_de_pontos
);

    detector_de_borda equipe_a(
        .clock(clk),
        .reset(rst),
        .borda_incr_a(incr_b),
        .borda_decr_a(decr_b)
    );

    always_ff @(posedge clk or posedge rst)begin
        if(rst)
            numero_de_pontos <= '0;
        else if(incr_b)
            numero_de_pontos <= numero_de_pontos + 1;
        else if(decr_b)
            numero_de_pontos <= numero_de_pontos - 1;
    end

endmodule