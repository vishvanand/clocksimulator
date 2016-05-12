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
	 min_one,
	 min_ten,
	 sec_one,
	 sec_ten
    );
	 
	 input clk;
	 input reset;
	 
	 output reg min_one;
	 output reg min_ten;
	 output reg sec_one;
	 output reg sec_ten;
	 
always @(posedge clk) begin
	if (reset)
	begin
		min_one <= 0;
		min_ten <= 0;
		sec_one <= 0;
		sec_ten <= 0;
	end
	
	
	if (sec_one == 9)
	begin 
		sec_ten <= (sec_ten + 1) % 10;
	end
	else
	begin
		sec_one <= (sec_one + 1) % 10;
	end
	
	
	if (min_one == 9)
	begin
		min_ten <= (min_ten + 1) % 6;
	end
	else
	begin
		min_one <= (min_one + 1) % 10;
	end
end
endmodule


