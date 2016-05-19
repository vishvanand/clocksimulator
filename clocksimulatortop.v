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
btnS,
btnR,
Select,
Adjust1,
Adjust2,
isdec,
/*
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
LedG,	
*/

 Cathode,
 Anode
    );


input clk;
input btnS;
input btnR;
input Select;
input Adjust1;
input Adjust2;
input isdec;
/*
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
*/

output reg [6:0] Cathode;
output reg [3:0] Anode;

wire debBtnS;
wire debBtnR;
wire reset;
reg pause;
reg [0:1] sel;


debouncer debounceS ( .clk(clk), .PB(btnS), .PB_state(debBtnS) );
debouncer debounceR ( .clk(clk), .PB(btnR), .PB_state(debBtnR) );


assign reset = debBtnR;


/*always @ (posedge clk)
begin
if(reset)
	pause = 0;
if(debBtnS)
	pause = ~pause;
end
*/

wire clk1hz;
wire clk2hz;
wire clk4hz;
wire clk50hz;

clock_divider_led clock1hz ( .clock(clk), .enable(1'b1), .clock_count(26'd50000000), .reset(0), .out_counter(clk1hz));
clock_divider_led clock2hz ( .clock(clk), .enable(1'b1), .clock_count(26'd25000000), .reset(0), .out_counter(clk2hz));
clock_divider_led clock4hz ( .clock(clk), .enable(1'b1), .clock_count(26'd12500000), .reset(0), .out_counter(clk4hz));
clock_divider_led clock50hz( .clock(clk), .enable(1'b1), .clock_count(26'd25000), .reset(0), .out_counter(clk50hz));

wire [3:0] minone;
wire [3:0] minten;
wire [3:0] secone;
wire [3:0] secten;




wire minselect;
wire secselect; 

//assign minselect = (~Adjust1 | (Adjust1 & Select)) & ~debBtnS;
//assign secselect = (~Adjust1 | (Adjust1 & ~Select)) & ~debBtnS;



//assign secselect = ~debBtnS;
//assign minselect = ~debBtnS;  

wire clockfreq;

assign clockfreq = Adjust1? clk2hz:clk1hz;

assign secselect = Adjust1 && Adjust2? 1'b0 : ~debBtnS;
assign minselect = Adjust1 && ~Adjust2? 1'b0 : ~debBtnS;

reg countblink;

always @ (posedge clk4hz)
begin
	if(reset)
		countblink <= 1;
	else
		countblink <= ~countblink;
end




clk_counter count(.clk(clockfreq), .reset(debBtnR), .minselect(minselect), .secselect(secselect) , .min_one(minone), .min_ten(minten), .sec_one(secone), .sec_ten(secten), .isdec(isdec));



/*
sevenseg seven(.clock(clk), .reset(reset), .min1st(minone), .min2nd(minten),	.sec1st(secone), .sec2nd(secten), .Digit4(dig4), 	
.Digit3(dig3), .Digit2(dig2),	.Digit1(dig1),	.LedA(leda), .LedB(ledb),	.LedC(ledc),	.LedD(ledd), .LedE(lede),
.LedF(ledf),	.LedG(ledg));		
*/

wire [3:0] anodeout;
wire [6:0] cathodeout;


reg [3:0] selectdigit;

always @ (posedge clk50hz)
begin
	if ( reset )
	begin
		sel <= 0;
		
	end
	
	else
	begin
		selectdigit <= sel == 2'b11 ? secone : sel == 2'b00 ? secten : sel == 2'b01 ? minone : minten;
		sel <= sel + 2'b01;
	end
end

sevenseg(.select(sel), .digit_val(selectdigit), .src_clk(clk50hz), .anode(anodeout), .segment(cathodeout) );

reg [3:0] anodeoutblink;


/*
always @ (posedge clk4hz)
begin

	if(Adjust1 && ~Adjust2) //blink and adjust second
	begin
		anodeoutblink <= {anodeout[3:2], 2'b00}; 	
	end
	else if(Adjust1 && Adjust2)
	begin
		anodeoutblink <= {2'b00,anodeout[2:0]};
	end
	else
	begin
	anodeoutblink <= anodeout; 
	end
		
	
end
*/



always @ (posedge clk50hz)

if ( reset )
	begin
		Cathode <= 7'b1111111;
		Anode <= 0;
	
	end
else
begin
/*
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
		*/
		
	
		if(Adjust1 && ~Adjust2)
		begin
			Anode[3] <= anodeout[3];
			Anode[2] <= anodeout[2];
			Anode[1] <= anodeout[1]; 
			Anode[0] <= anodeout[0]; 
			Cathode <= cathodeout;
		end
		else if (Adjust1 && Adjust2)
		begin
			Anode[1] <= anodeout[1];
			Anode[0] <= anodeout[0];
			Anode[2] <= anodeout[2];
			Anode[3] <= anodeout[3];
			Cathode <= cathodeout;
		end
		else
		begin
	
			Anode <= anodeout;
			Cathode <= cathodeout;
			
		end
end

/*
always @ (posedge clk4hz)
begin
if(Adjust1)
	begin
		Anode <= ~Anode;
	end
end 
*/
endmodule
