`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:49:51 05/12/2016 
// Design Name: 
// Module Name:    clk_counter 
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
module clk_counter(
    clk,
    reset,
	 minselect,
	 secselect,
	 min_one,
	 min_ten,
	 sec_one,
	 sec_ten
    );
	 
	 input clk;
	 input reset;
	 input minselect;
	 input secselect;
	 
	 output reg [3:0] min_one;
	 output reg [3:0] min_ten;
	 output reg [3:0] sec_one;
	 output reg [3:0] sec_ten;
	 
always @(posedge clk) begin
	if (reset)
	begin
		min_one <= 0;
		min_ten <= 0;
		sec_one <= 0;
		sec_ten <= 0;
	end
	
	if(secselect)
	begin
	if (sec_one == 9)
	begin 
		sec_ten <= (sec_ten == 9) ? 0 : sec_ten + 1;
	end
	else
	begin
		sec_one <= (sec_one == 9) ? 0 : sec_one + 1;
	end
	end
	
	if(minselect)
	begin
	if (min_one == 9)
	begin
		min_ten <= (sec_ten == 6) ? 0 : min_ten + 1;
	end
	else
	begin
		min_one <= (min_one == 9) ? 0 : min_one + 1;
	end
	end
end
endmodule


