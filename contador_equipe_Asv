module contador_equipe_A (
    input logic clk,
    input logic rst,

    input logic borda_incr_a,
    input logic borda_decr_a,

    output logic [3:0] unidade_A,
    output logic [3:0] dezena_A,
    output logic [3:0] centena_A,
    output logic [3:0] milhar_A
);

    always_ff @(posedge clk or posedge rst) begin

        if (rst) begin
            unidade_A <= 4'd0;
            dezena_A  <= 4'd0;
            centena_A <= 4'd0;
            milhar_A  <= 4'd0;
        end

        else if (borda_incr_a) begin

            if (unidade_A == 9) begin
                unidade_A <= 0;

                if (dezena_A == 9) begin
                    dezena_A <= 0;

                    if (centena_A == 9) begin
                        centena_A <= 0;

                        if (milhar_A == 9) begin
                            milhar_A <= 9;
                        end
                        else begin
                            milhar_A <= milhar_A + 1;
                        end

                    end
                    else begin
                        centena_A <= centena_A + 1;
                    end

                end
                else begin
                    dezena_A <= dezena_A + 1;
                end

            end
            else begin
                unidade_A <= unidade_A + 1;
            end

        end

        else if (borda_decr_a) begin

            if (unidade_A == 0 && dezena_A == 0 &&
                centena_A == 0 && milhar_A == 0) begin

                unidade_A <= 0;
                dezena_A  <= 0;
                centena_A <= 0;
                milhar_A  <= 0;

            end

            else if (unidade_A == 0) begin

                unidade_A <= 9;

                if (dezena_A == 0) begin
                    dezena_A <= 9;

                    if (centena_A == 0) begin
                        centena_A <= 9;
                        milhar_A  <= milhar_A - 1;
                    end
                    else begin
                        centena_A <= centena_A - 1;
                    end

                end
                else begin
                    dezena_A <= dezena_A - 1;
                end
            end
            else begin
                unidade_A <= unidade_A - 1;
            end
        end  
    end

endmodule