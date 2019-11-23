module priority_encoder_8_inp(
	input wire d0, d1, d2, d3, d4, d5, d6, d7,
	output wire valid_input,
	output wire [2:0] out
);

	assign valid_input = (d0|d1|d2|d3|d4|d5|d6|d7);
	assign out[0] = ((~d0&d1) || (~d0&~d1&~d2&d3) || (~d0&~d1&~d2&~d3&~d4&d5) || (~d0&~d1&~d2&~d3&~d4&~d5&~d6&d7)); 
	assign out[1] = ((~d0&~d1&d2) || (~d0&~d1&~d2&d3) || (~d0&~d1&~d2&~d3&~d4&~d5&d6) || (~d0&~d1&~d2&~d3&~d4&~d5&~d6&d7));
	assign out[2] = ((~d0&~d1&~d2&~d3&d4) || (~d0&~d1&~d2&~d3&~d4&d5) || (~d0&~d1&~d2&~d3&~d4&~d5&d6) || (~d0&~d1&~d2&~d3&~d4&~d5&~d6&d7));

endmodule
