`include "Q2.v"
`timescale 1ns / 1ps
module testbench;
	reg [1:0] x;
	reg [1:0] y;
	wire z3, z2, z1, z0;
	wire [3:0] z;
	bin_mul_2_2 mul(
		.x1(x[1]),
		.x0(x[0]),
		.y1(y[1]),
		.y0(y[0]),
		.z0(z0),
		.z1(z1),
		.z2(z2),
		.z3(z3)
	);
	assign z = {z3, z2, z1, z0};

	initial
	begin
		x = 2'b10;
		y = 2'b01;
		#20 x = 2'b11;
		y = 2'b11;
		#20 x = 2'b00;
		y = 2'b00;
		#20 x = 2'b11;
		y = 2'b10;
		#20 x = 2'b10;
		y = 2'b11;

	end

	initial
	begin
		$monitor("x = %2b\ty = %2b\tz = %4b", x, y, z);
	end

endmodule
