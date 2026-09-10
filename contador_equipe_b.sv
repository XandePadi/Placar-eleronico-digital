module contador_equipe_B (
    input logic clk,
    input logic rst,

    input logic incr_b,
    input logic decr_b,

    output logic [3:0] unidade_B,
    output logic [3:0] dezena_B,
    output logic [3:0] centena_B,
    output logic [3:0] milhar_B
);

    logic borda_incr_b;
    logic borda_decr_b;

    detector_de_borda equipe_b (
        .clock        (clk),
        .reset        (rst),
        .incr_b       (incr_b),
        .decr_b       (decr_b),
        .borda_incr_b (borda_incr_b),
        .borda_decr_b (borda_decr_b)
    );

    always_ff @(posedge clk or posedge rst) begin

        if (rst) begin
            unidade_B <= 4'd0;
            dezena_B  <= 4'd0;
            centena_B <= 4'd0;
            milhar_B  <= 4'd0;
        end

        else if (borda_incr_b) begin

            if (unidade_B == 9) begin
                unidade_B <= 0;

                if (dezena_B == 9) begin
                    dezena_B <= 0;

                    if (centena_B == 9) begin
                        centena_B <= 0;

                        if (milhar_B == 9) begin
                            milhar_B <= 9; // milhar fica parado no 9
                        end
                        else begin
                            milhar_B <= milhar_B + 1;
                        end

                    end
                    else begin
                        centena_B <= centena_B + 1;
                    end

                end
                else begin
                    dezena_B <= dezena_B + 1;
                end

            end
            else begin
                unidade_B <= unidade_B + 1;
            end

        end

        else if (borda_decr_b) begin
            if (unidade_B == 0 && dezena_B == 0 && centena_B == 0 && milhar_B == 0) begin
                // já está zerado, não decrementa
                unidade_B <= 0;
                dezena_B  <= 0;
                centena_B <= 0;
                milhar_B  <= 0;
            end

            else if (unidade_B == 0) begin
                unidade_B <= 9;

                if (dezena_B == 0) begin
                    dezena_B <= 9;

                    if (centena_B == 0) begin
                        centena_B <= 9;
                        milhar_B  <= milhar_B - 1; // aqui sabemos que milhar > 0
                    end
                    else begin
                        centena_B <= centena_B - 1;
                    end

                end
                else begin
                    dezena_B <= dezena_B - 1;
                end

            end
            else begin
                unidade_B <= unidade_B - 1;
            end

        end
    end

    

endmodule
