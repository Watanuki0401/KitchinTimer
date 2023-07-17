`timescale 1ns / 1ps
module kitchen_timer_sim(
    );
    
parameter WB_PERIOD = 10.0;
reg sim_reset = 1'b1;
reg sim_clk = 1'b0;
reg SW_1 = 1'b1;
reg SW_2 = 1'b1; 
reg SW_3 = 1'b1;
wire [3:0]out_led;
wire [2:0]rgb_led;

initial begin
    sim_clk = 1'b0; //clkの初期値を0に設定
    sim_reset = 1'b1;
    SW_1 = 1'b1;
    #10
    SW_1 = 1'b0;
    #10
    SW_1 = 1'b1;
    #10
    SW_1 = 1'b0;
    #10
    SW_1 = 1'b1;
    #10
    SW_1 = 1'b0;
    #10
    SW_1 = 1'b1;
    #10
    SW_1 = 1'b0;
    #10
    SW_1 = 1'b1;
    #10
    SW_1 = 1'b0;
    #10
    SW_1 = 1'b1; 
    #10
    SW_2 = 1'b0;
    #10
    SW_2 = 1'b1;
    #300
    sim_reset = 1'b0;
    #10
    sim_reset = 1'b1;
end
     
// クロック生成
always#(WB_PERIOD/2)begin
    sim_clk = ~sim_clk; //WE_PERIOD=5ns毎にclkの値を反転する
end

     
kitchen_timer kitchen_timer_sim(
        .CLK(sim_clk),
        .RESET_SW0(sim_reset),
        .SW_1(SW_1),
        .SW_2(SW_2),
        .SW_3(SW_3),
        .out_led(out_led),
        .rgb_led(rgb_led)
    );
endmodule
