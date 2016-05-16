//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:31:32 05/10/2016 
// Design Name: 
// Module Name:    debouncer 
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
module debouncer(
input clk,
input PB,
output reg PB_state
    );

// Synchronize the switch input to the clock
reg PB_sync_0;
always @(posedge clk) PB_sync_0 <= PB; 
reg PB_sync_1;
always @(posedge clk) PB_sync_1 <= PB_sync_0;


always @(posedge clk)
begin
PB_state <= PB_sync_1;
end
endmodule
