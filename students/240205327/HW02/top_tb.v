`timescale 1ms/1ms
module top_tb;

    wire clk;
    wire red, yellow, green;
    reg  red_l, yellow_l, green_l;
    reg  [6:0] t;

    clk_gen_1s v_clk(clk);

    led u1(red_l,    red);
    led u2(green_l,  green);
    led u3(yellow_l, yellow);

    initial t = 7'd0;
    always @(posedge clk) begin
        if (t == 7'd69)
            t <= 7'd0;
        else
            t <= t + 7'd1;
    end

    always @(*) begin
        red_l    = 1'b0;
        green_l  = 1'b0;
        yellow_l = 1'b0;

        if (t < 7'd30)
            red_l   = 1'b1;
        else if (t < 7'd60)
            green_l = 1'b1;
        else
            yellow_l = clk;
    end

endmodule
