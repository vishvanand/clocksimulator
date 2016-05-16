`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:01:05 05/14/2016
// Design Name:   clocksimulatortop
// Module Name:   D:/XilinxVerilog/CSFiles/clocksimulator/clocksimulator_test.v
// Project Name:  clocksimulator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clocksimulatortop
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clocksimulator_test;

	// Inputs
	reg clk;
	reg btnS;
	reg btnR;
	reg Select;
	reg Adjust1;
	reg Adjust2;

	// Outputs
	wire Digit4;
	wire Digit3;
	wire Digit2;
	wire Digit1;
	wire LedA;
	wire LedB;
	wire LedC;
	wire LedD;
	wire LedE;
	wire LedF;
	wire LedG;
	wire [3:0] Anode;

	// Instantiate the Unit Under Test (UUT)
	clocksimulatortop uut (
		.clk(clk), 
		.btnS(btnS), 
		.btnR(btnR), 
		.Select(Select), 
		.Adjust1(Adjust1), 
		.Adjust2(Adjust2), 
		.Digit4(Digit4), 
		.Digit3(Digit3), 
		.Digit2(Digit2), 
		.Digit1(Digit1), 
		.LedA(LedA), 
		.LedB(LedB), 
		.LedC(LedC), 
		.LedD(LedD), 
		.LedE(LedE), 
		.LedF(LedF), 
		.LedG(LedG), 
		.Anode(Anode)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		btnS = 0;
		btnR = 0;
		Select = 0;
		Adjust1 = 0;
		Adjust2 = 0;

		// Wait 100 ns for global reset to finish
		
		#100;
     
		btnR = 1;
		#100.005;
		btnR = 0;
		#100.01;
		btnR = 1;
		#100.015;
		btnR = 0;
		#100.02;
	
		// Add stimulus here

	end
	
	
    always
		#0.005 clk = !clk;  
endmodule

