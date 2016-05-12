`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:07:26 05/12/2016 
// Design Name: 
// Module Name:    clocksimulatortop 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clocksimulatortop(

clk,
reset,
btnS,
btnR,
Select,
Adjust1,
Adjust2,

Digit4,	
Digit3,	
Digit2,	
Digit1,	
LedA,	
LedB,	
LedC,	
LedD,	
LedE,
LedF,	
LedG	

    );


input clk;
input reset;
input btnS;
input btnR;
input Select;
input Adjust1;
input Adjust2;

output reg Digit4;
output reg Digit3;
output reg Digit2;
output reg Digit1;
output reg LedA;
output reg LedB;
output reg LedC;
output reg LedD;
output reg LedE;
output reg LedF;
output reg LedG;


wire debBtnS;
wire debBtnR;

debouncer debounceS ( .clk(clk), .PB(btnS), .PB_state(debBtnS) );
debouncer debounceR ( .clk(clk), .PB(btnR), .PB_state(debBtnR) );

wire clk1hz;
wire clk2hz;
wire clk4hz;
wire clk50hz;

clock_divider_led clock1hz ( .clock(clk), .enable(1'b1), .clock_count(26'd50000000), .reset(reset), .out_counter(clk1hz));
clock_divider_led clock2hz ( .clock(clk), .enable(1'b1), .clock_count(25'd25000000), .reset(reset), .out_counter(clk2hz));
clock_divider_led clock4hz ( .clock(clk), .enable(1'b1), .clock_count(26'd1250000000), .reset(reset), .out_counter(clk4hz));
clock_divider_led clock50hz( .clock(clk), .enable(1'b1), .clock_count(25'd1000000), .reset(reset), .out_counter(clk50hz));

wire minone;
wire minten;
wire secone;
wire secten;

wire clk1hzPause;

assign clk1hzPause = ~debBtnS & clk1hz;


clk_counter count(.clk(clk1hzPause), .reset(reset), .min_one(minone), .min_ten(minten), .sec_one(secone), .sec_ten(secten));

wire dig4;
wire dig3;
wire dig2;
wire dig1;

wire leda;
wire ledb;
wire ledc;
wire ledd;
wire lede;
wire ledf;
wire ledg;

sevenseg seven(.clock(clk), .reset(reset), .min1st(minone), .min2nd(minten),	.sec1st(secone), .sec2nd(secten), .Digit4(dig4), 	
.Digit3(dig3), .Digit2(dig2),	.Digit1(dig1),	.LedA(leda), .LedB(ledb),	.LedC(ledc),	.LedD(ledd), .LedE(lede),
.LedF(ledf),	.LedG(ledg));		

always @ (posedge clk1hz)
begin
if(debBtnS)
begin
		Digit4 <= dig4;
		Digit3 <= dig3;
		Digit2 <= dig2;
		Digit1 <= dig1;
		LedA <= leda;
		LedB <= ledb;
		LedC <= ledc;
		LedD <= ledd;
		LedE <= lede;
		LedF <= ledf;
		LedG <= ledg;
end
end
  
endmodule