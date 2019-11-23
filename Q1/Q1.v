module mod_8_counter(
    input wire clk,
    input wire reset,
    input wire enable,
    output wire [2:0] out
);

    reg [2:0] pres_state;
    wire [2:0] next_state;

    always @(negedge clk, negedge reset)
    begin
        if(~reset)
            pres_state <= 0;
        else if(enable)
            pres_state <= next_state;
    end
    assign out = pres_state;
    assign next_state = pres_state+1;
endmodule
