 //Universidade Federal de Campina Grande
// Departamento de Engenharia Elétrica e Informática
// João Victor Rodrigues Ramalho: joao.ramalho@ee.ufcg.edu.br
// Pedro Henrique de Araújo Felipe: pedro.felipe@ee.ufcg.edu.br

// Módulo Mux de entrada e saída serial de 7 bits

module mux_2_1_7bits(I0,I1,C,S);
input C;
input [6:0]I0,I1;
output [6:0] S;

assign S[0]= (~C&I0[0])|(C&I1[0]);
assign S[1]= (~C&I0[1])|(C&I1[1]);
assign S[2]= (~C&I0[2])|(C&I1[2]);
assign S[3]= (~C&I0[3])|(C&I1[3]);
assign S[4]= (~C&I0[4])|(C&I1[4]);
assign S[5]= (~C&I0[5])|(C&I1[5]);
assign S[6]= (~C&I0[6])|(C&I1[6]);

endmodule