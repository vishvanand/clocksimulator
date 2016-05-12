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
module clock_divider_led(
    clock,
    enable,
	 clock_count,
	 reset,
    out_counter
    );
	 
input clock;
input enable;
input [25:0] clock_count;
input reset;
output out_counter;

reg out_counter;
reg [25:0] local_timer;



always @(posedge clock)
begin
		if(reset)
			begin
					local_timer <= 26'b0;
					out_counter <= 1'b1;
			end
begin
		if(enable)
			local_timer <= local_timer+1;
end
begin
	if(local_timer == clock_count)
		begin
		out_counter <= ~out_counter;
		local_timer <= 26'b0;
		end
end
end
endmodule