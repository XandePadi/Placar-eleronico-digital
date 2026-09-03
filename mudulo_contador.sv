module contador(
	input rst,
	input clk,
	output cont_out[2:0]
);
    divisor_clock div_clk
	(
		.clk_in(),
		.clk_out (clk)
	);
	

	always_ff @(posedge clk or negedge rst ) begin
		if(!rst)begin
			cont_out = 3'b000	
		end
		
		else begin
			cont_out <= cont_out + 3'b001;
		end
	end
endmodule