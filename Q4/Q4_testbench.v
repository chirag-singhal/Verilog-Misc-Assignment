`include "Q4.v"
`timescale 1ns / 1ps
module testbench;
    reg clk;
    reg inp;
    wire out;
    seq_detector_110_mealy seq_det(
        .clk(clk),
        .inp(inp),
        .out(out)
    );

    integer i;
    initial
    begin
        clk = 0;
        for (i = 0; i <= 30; i=i+1)
        begin
            #10 clk = ~clk;         
        end
    end

    initial
    begin
        inp = 0;
        #5 inp = 1;
        #20 inp = 0;
        #20 inp = 1;
        #20 inp = 1;
        #20 inp = 0;
        #20 inp = 1;
        #20 inp = 1;
        #20 inp = 1;
        #20 inp = 0;
        #20 inp = 0;
        #20 inp = 1;
        #20 inp = 1;
        #20 inp = 0;
        #20 inp = 1;
    end

    initial
    begin
        $monitor("clk = %d\tinp = %d\tout = %d", clk, inp, out);
    end

endmodule
