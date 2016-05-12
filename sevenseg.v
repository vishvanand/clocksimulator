`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:32:46 05/12/2016 
// Design Name: 
// Module Name:    sevenseg 
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
module sevenseg(
//Input
///////////////////

clock, //100 MHz clock
reset, // reset
min2nd, 	//Minutes 2nd digit
min1st,	//Minutes 1st digit
sec2nd,	//Seconds 2nd digit
sec1st,	//Seconds 1st digit



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
	 
input [3:0] min2nd;
input [3:0] min1st;
input [3:0] sec2nd;
input [3:0] sec1st;
input reset;
input clock;

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

//Local Variables
reg [3:0] cur_value;
reg [1:0] cur_pos;


initial begin
cur_pos <= 0;
cur_value <= 0;
end


always @ (posedge clock) begin


	case(cur_pos)
	2'd3: cur_value <= min2nd;
	2'd2: cur_value <= min1st;
	2'd1: cur_value <= sec2nd;
	2'd0: cur_value <= sec1st;
	default: cur_value <= 0;
	endcase
	
	case(cur_pos) 
	2'd3: begin
	Digit4 <= 1'b1; 
	Digit3 <= 0;
	Digit2 <= 0;
	Digit1 <= 0;
	end
	2'd2: begin
	Digit4 <= 0; 
	Digit3 <= 1'b1;
	Digit2 <= 0;
	Digit1 <= 0;
	end
	2'd1: begin
	Digit4 <= 0; 
	Digit3 <= 0;
	Digit2 <= 1'b1;
	Digit1 <= 0;
	end
	2'd0: begin
	Digit4 <= 0; 
	Digit3 <= 0;
	Digit2 <= 0;
	Digit1 <= 1'b1;
	end
	default: begin
	Digit4 <= 0; 
	Digit3 <= 0;
	Digit2 <= 0;
	Digit1 <= 0;
	end
	endcase
	

	case(cur_value)
	4'd9: begin 
	LedA <= 1'b1;
	LedB <= 1'b1;
	LedC <= 1'b1;
	LedD <= 1'b1;
	LedE <= 0;
	LedF <= 1'b1;
	LedG <= 1'b1;
	end
	4'd8: begin 
	LedA <= 1'b1;
	LedB <= 1'b1;
	LedC <= 1'b1;
	LedD <= 1'b1;
	LedE <= 1'b1;
	LedF <= 1'b1;
	LedG <= 1'b1;
	end
	4'd7: begin 
	LedA <= 1'b1;
	LedB <= 1'b1;
	LedC <= 1'b1;
	LedD <= 0;
	LedE <= 0;
	LedF <= 1'b1;
	LedG <= 0;
	end
	4'd6: begin 
	LedA <= 1'b1;
	LedB <= 0;
	LedC <= 1'b1;
	LedD <= 1'b1;
	LedE <= 1'b1;
	LedF <= 1'b1;
	LedG <= 1'b1;
	end
	4'd5: begin 
	LedA <= 1'b1;
	LedB <= 0;
	LedC <= 1'b1;
	LedD <= 1'b1;
	LedE <= 0;
	LedF <= 1'b1;
	LedG <= 1'b1;
	end
	4'd4: begin
	LedA <= 0;
	LedB <= 1'b1;
	LedC <= 1'b1;
	LedD <= 0;
	LedE <= 0;
	LedF <= 1'b1;
	LedG <= 1'b1;
	end
	4'd3: begin
	LedA <= 1'b1;
	LedB <= 1'b1;
	LedC <= 1'b1;
	LedD <= 1'b1;
	LedE <= 0;
	LedF <= 0;
	LedG <= 1'b1;
	end
	4'd2: begin
	LedA <= 1'b1;
	LedB <= 1'b1;
	LedC <= 0;
	LedD <= 1'b1;
	LedE <= 1'b1;
	LedF <= 0;
	LedG <= 1'b1;
	end
	4'd1: begin 
	LedA <= 0;
	LedB <= 1'b1;
	LedC <= 1'b1;
	LedD <= 0;
	LedE <= 0;
	LedF <= 0;
	LedG <= 0;
	end
	4'd0: begin 
	LedA <= 1'b1;
	LedB <= 1'b1;
	LedC <= 1'b1;
	LedD <= 1'b1;
	LedE <= 1'b1;
	LedF <= 1'b1;
	LedG <= 0;
	end
	default: begin 
	LedA <= 0;
	LedB <= 0;
	LedC <= 0;
	LedD <= 0;
	LedE <= 0;
	LedF <= 0;
	LedG <= 0;
	end
	endcase

	
	cur_pos <= cur_pos + 1;

end



endmodule
