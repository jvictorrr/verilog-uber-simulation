//Universidade Federal de Campina Grande
// Departamento de Engenharia Elétrica e Informática
// João Victor Rodrigues Ramalho: joao.ramalho@ee.ufcg.edu.br
// Pedro Henrique de Araújo Felipe: pedro.felipe@ee.ufcg.edu.br


// Modulo responsável por conseguir o vetor posição

module location(inicio,fim,posicao);

input[8:0] inicio,fim;
output[8:0] posicao; 
assign posicao[0]= inicio[0]+fim[0];
assign posicao[1]= inicio[1]+fim[1];
assign posicao[2]= inicio[2]+fim[2];
assign posicao[3]= inicio[3]+fim[3];
assign posicao[4]= inicio[4]+fim[4];
assign posicao[5]= inicio[5]+fim[5];
assign posicao[6]= inicio[6]+fim[6];
assign posicao[7]= inicio[7]+fim[7];
assign posicao[8]= inicio[8]+fim[8];

endmodule