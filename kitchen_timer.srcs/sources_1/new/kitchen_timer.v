`timescale 1ns/1ps

module kitchen_timer(
input CLK,
input RESET_SW,
input SW_1,
input SW_2,
input SW_3,
output reg[3:0]out_led,
output reg[2:0]rgb_led
);

reg [26:0]u_cnt = 0;
reg div_clk = 0;

reg [3:0]memo = 0;
reg [3:0]Count = 0;

reg flg = 0;
reg flg2 = 0;
reg re = 0;

reg [2:0]light = 0;

always @(posedge(CLK))begin

    if(SW_1 == 0)begin
	   memo <= memo + 1;//カウント保持（＋）
    end

    if(SW_3 == 0)begin
	   memo <= memo - 1;//カウント保持（ー）
    end

    if(SW_2 == 0)begin	//タイマースタートflg
	   if(flg == 0)begin
	      re <= 1;
		  flg <= 1;
	   end
	   else begin
		  flg <= 0;
	   end
    end

    if(RESET_SW == 0)begin
       re = 1;
    end

    if (u_cnt == 4/2)begin //500000000/2
	   div_clk <= !div_clk;
	   u_cnt <= 1;
    end
    else begin
	   u_cnt <= u_cnt + 1;
    end

end

always @(posedge(div_clk))begin
	if(flg == 0)begin
	end
	else begin
	   if(re == 1)begin
	       Count <= memo;
	       re <= 0;
	   end
	   if(flg2 == 0)begin
           light = 3'b000;
           flg2 <= 1;
	   end
	   if(Count == 0)begin
	       light <= 3'b100;
	       flg2 <= 0;
	   end
	   else begin
	       Count <= Count - 1;
	   end 
	end
end

always @*begin
	out_led <= Count;
	rgb_led <= light;
end

endmodule	