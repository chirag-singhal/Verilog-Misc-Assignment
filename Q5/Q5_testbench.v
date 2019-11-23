`include "Q5.v"
`timescale 100ms / 1ms
module testbench;
	reg clk;
	reg [3:0] inp;
	wire [6:0] out;
	bcd_7_segment dec(
		.clk(clk),
		.inp(inp),
		.out(out)
	);

	integer i;
	initial
	begin
		clk = 0;
		for (i = 0; i <= 22; i=i+1)
		begin
			#5 clk = ~clk;			
		end
	end

	initial
	begin
		inp = 1;
		#10 inp = 2;
		#10 inp = 3;
		#10 inp = 4;
		#10 inp = 5;
		#10 inp = 6;
		#10 inp = 7;
		#10 inp = 8;
		#10 inp = 9;
	end

	initial
	begin
		$monitor("clk = %d\tinp = %d\tout = %7b", clk, inp, out);
	end

endmodule
