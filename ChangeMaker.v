module ChangeMaker(reset, choice, payment, change);
	input reset;
	input [1:0] choice;
	input [3:0] payment;
	output [3:0] change;
	reg [3:0] tempchange;
	
	//4 choices: 00: granola bar (4), 01: chips(3), 10: candy(2), 11: gum (1)
	
	always @(choice, payment)
		begin
			if (reset == 4'b0001)
				begin
					tempchange = 4'b0000;
				end
				
			if (payment==0)
				begin
					tempchange = 4'b0000;
				end
			if (choice == 2'b00)
				begin
					tempchange = payment - 4'b0100;
				end
			else if (choice == 2'b01)
				begin
					tempchange = payment - 4'b0011;
				end
			else if (choice == 2'b10)
				begin
					tempchange = payment - 4'b0010;
				end
			else
				begin
					tempchange = payment - 4'b0001;
				end
		end
		assign change = tempchange;
endmodule
