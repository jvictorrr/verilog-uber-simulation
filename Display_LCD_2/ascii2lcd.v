module ascii2lcd( oBit, iBit );

	output	[8:0]oBit;
	input 	[7:0]iBit;

	assign oBit = 9'h100 + iBit;
	
endmodule