module divisor_clock_50_1(clk_out,clk);
	input clk;
	output reg clk_out;
	reg rst;
	reg [24:0]counter;
	initial
	rst=0;
	
	always@(posedge clk or negedge rst)
	begin
		if(!rst)
		begin
			rst = 1;
			counter = 25'd0;
			clk_out=1'b0;
		end
		else
		if(counter==25'd24_999_999)
		begin
			counter = 25'd0;
			clk_out=~clk_out;
		end
		else
		begin
			counter=counter+1;
		end
	end
endmodule