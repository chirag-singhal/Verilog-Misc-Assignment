`include "Q3.v"
`timescale 1ns / 1ps
module testbench;
	wire d0, d1, d2, d3, d4, d5, d6, d7;
	wire valid_input;
	reg [7:0] d;
	wire [2:0] out;
	priority_encoder_8_inp enc(
		.d0(d0),
		.d1(d1),
		.d2(d2),
		.d3(d3),
		.d4(d4),
		.d5(d5),
		.d6(d6),
		.d7(d7),
		.valid_input(valid_input),
		.out(out)
	);

	assign {d7, d6, d5, d4, d3, d2, d1, d0} = d;

	initial
	begin
		d = 42;
		#10 d = 17;
		#10 d = 230;
		#10 d = 0;
		#10 d = 128;
		#10 d = 32;

	end

	initial
	begin
		$monitor("d = %8b\tvalid_input = %d\tout = %3b", d, valid_input, out);
	end

endmodule
