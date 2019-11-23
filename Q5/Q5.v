module bcd_7_segment(
	input wire clk,
	input wire [3:0] inp,
	output wire [6:0] out
);

wire a, b, c, d;
assign {a, b, c, d} = inp;
reg [6:0] temp_out;
reg [6:0] temp2_out;

initial
begin
	temp_out = 0;
end

always @(posedge clk)
begin
	temp2_out <= temp_out;

	temp_out[6] <= (a | c | (b&d) | (~b&~d));
	temp_out[5] <= (~b | (c&d) | (~c&~d));
	temp_out[4] <= (~c | d | b);
	temp_out[3] <= ((~b&~d) | (~b&c) | (b&~c&d) | (c&~d) | a);
	temp_out[2] <= ((~b&~d) | (c&~d));
	temp_out[1] <= ((~c&~d) | (b&~c) | (b&~d) | a);
	temp_out[0] <= ((~b&c) | (b&~c) | (b&~d) | a);
end

assign out = temp2_out;

endmodule
