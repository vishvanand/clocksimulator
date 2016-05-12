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
    out_counter
    );
	 
input clock;
input enable;
input clock_count;
output out_counter;

reg out_counter;
reg [27:0] local_timer;

initial out_counter = 1'b0;
initial local_timer = clock_count;

always @(posedge clock)
begin
begin
		if(enable)
			local_timer <= local_timer+1;
		
end
begin
	if(local_timer == clock_count)
		begin
		out_counter <= ~out_counter;
		local_timer <= 28'b0;
		end
end
end
endmodule