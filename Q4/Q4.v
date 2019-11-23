module seq_detector_110_mealy(
	input wire clk,
	input wire inp,
	output reg out
);

	reg [2:0] state;
	//reg temp_out = 0;

	initial
	begin
		state = 3'b000;
		out <= 0;
	end

	always @(posedge clk)
	begin
		if (state == 3'b000) begin
			if (inp) begin
				state <= 3'b001;
			end
		end
		else if (state == 3'b001) begin
			if (inp) begin
				state <= 3'b010;
			end
			else begin
				state <= 3'b000;
			end
		end
		else if(state == 3'b010) begin
			if (~inp) begin
				state <= 3'b011;
				out <= 1;
			end
			else begin
				state <= 3'b010;
			end
		end
		else if (state == 3'b011) begin
			if (~inp) begin
				state <= 3'b100;
			end
		end
		else if (state == 3'b100) begin
			if (~inp) begin
				state <= 3'b000;
				out <= 0;
			end
			else begin
				state <= 3'b011;
			end
		end
	end

	//assign out = temp_out;

endmodule
