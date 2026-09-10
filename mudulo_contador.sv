module modulo_contador(
	input reset,
	input clock,
	output logic [2:0] cont_out
);

	always_ff @(posedge clock or posedge reset ) begin
		if(reset or cont_out == 3'b111)begin
			cont_out <= 3'b000;
		end
		else begin
			cont_out <= cont_out + 3'b001;
		end
	end
endmodule
