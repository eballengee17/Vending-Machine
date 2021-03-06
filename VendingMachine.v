module VendingMachine(
	input reset, 
	input [1:0] choice, 
	input [3:0] payment, 
	output[3:0] change,
	input Clock,
	input [1:0] Binary_Input1,
	input [3:0] Binary_Input2,
	output o_Segment_A,
	output o_Segment_B,
	output o_Segment_C,
	output o_Segment_D,
	output o_Segment_E,
	output o_Segment_F,
	output o_Segment_G);
	

	wire[1:0] item;
	assign item[1:0] = Binary_Input1;
	
	wire[3:0] paid;
	assign paid[3:0] = Binary_Input2;

	ChangeMaker changeMaker(reset, item, paid, change);

	wire[3:0] Result;
	assign Result = change[3:0];

	SevenSegment sevenSegment(Clock, Result, o_Segment_A, o_Segment_B, o_Segment_C, o_Segment_D, o_Segment_E, o_Segment_F, o_Segment_G);

endmodule
