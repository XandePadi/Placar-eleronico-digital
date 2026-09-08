module contador_equipe (
    input clk,
    input rst,

    input incr_a,
    input decr_a

    output numero_de_pontos
);

    detector_de_borda equipe_a(
        .clock(clk),
        .reset(rst),
        .borda_incr_a(incr_a),
        .borda_decr_a(decr_a)
    );

    always_ff @(posedge clk or posedge rst)begin
        if(rst)
            numero_de_pontos <= '0;
        else if(incr_a)
            numero_de_pontos <= numero_de_pontos + 1;
        else if(decr_a)
            numero_de_pontos <= numero_de_pontos - 1;
    end

endmodule