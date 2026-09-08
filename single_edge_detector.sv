module single_edge_detector(
    input clk,
    input rst,

    input sign_in,
    output edge_out
);

    logic sig_prev;

    always_ff @(posdge clk) begin
        if(rst)
            sig_prev <= 1'b0;
        else
            sig_prev <= sig_in;
    end

    assign edge_out = sig_in & ~sig_prev;
endmodule
