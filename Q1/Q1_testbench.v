`include "Q1.v"
`timescale 1ns / 1ps
module testbench;
	reg clk;
	reg reset;
	reg enable;
	wire [2:0] out;
	mod_8_counter counter(
		.clk(clk),
		.reset(reset),
		.enable(enable),
		.out(out)
	);

	integer i;
	initial
	begin
		clk = 0;
		for (i = 0; i <= 25; i=i+1)
		begin
			#10 clk = ~clk;			
		end
	end

	initial
	begin
		reset = 1;
		enable = 1;
		#20 reset = 0;
		#10 enable = 0;
		#20 reset = 1;
		#10 enable = 1;
		#100 enable = 0;
		#50 enable = 1;
	end

	initial
	begin
		$monitor("clk = %d\treset = %d\tenable = %d\tout = %3b", clk, reset, enable, out);
	end

endmodule
