// Module parameters
// D: 	Flip-Flop data input
// CLK: Clock signal
// CLR: Clear signal
// Q: 	Flip-Flop output

module FF_D(D, CLK, CLR, Q);
	input D, CLK, CLR;
	output Q;
	reg Q;

	always @ (negedge CLK or posedge CLR)
		if (CLR)
			Q = 0;
		else
			Q = D;
endmodule
