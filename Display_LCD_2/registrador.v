module registrador(I,CLK,CLR,Q);
input CLK,CLR;
input[3:0] I;
output reg [3:0]Q;

FF_D f0(I[0], CLK, CLR, Q[0]);
FF_D f1(I[1], CLK, CLR, Q[1]);
FF_D f2(I[2], CLK, CLR, Q[2]);
FF_D f3(I[3], CLK, CLR, Q[3]);


endmodule