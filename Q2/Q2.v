module bin_mul_2_2(
	input wire x1, x0,
	input wire y1, y0,
	output wire z3, z2, z1, z0
);

	and(z0, x0, y0);

	wire t1, t2;
	and(t1, x1, y0);
	and(t2, x0, y1);
	xor(z1, t1, t2);

	wire t3, t4;
	and(t3, x1, y1);
	and(t4, t1, t2);
	xor(z2, t4, t3);

	and(z3, t4, t3);

endmodule
