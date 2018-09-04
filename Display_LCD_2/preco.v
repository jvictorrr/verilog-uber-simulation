 //Universidade Federal de Campina Grande
// Departamento de Engenharia Elétrica e Informática
// João Victor Rodrigues Ramalho: joao.ramalho@ee.ufcg.edu.br
// Pedro Henrique de Araújo Felipe: pedro.felipe@ee.ufcg.edu.br

// Modulo responsável por definir o preço


module preco(clk,h0,h1,h2,h3,h4,h5,h6,h7,posicao);

input clk;
input[8:0] posicao;
output reg [6:0] h0,h1,h2,h3,h4,h5,h6,h7;

always @(posedge clk)
begin
case ({posicao})
9'b100000001 : 
begin
h0=~7'b0000000;
h1=~7'b0000000;
h2=~7'b0000000;
h3=~7'b0000000;
h4=~7'b0000110; // 1
h5=~7'b1011011; // 2
h6=~7'b1101101; // 5
h7=~7'b0000110; // 1
end 
9'b100000010, 9'b010000001:
begin
h0=~7'b0000000;
h1=~7'b0000000;
h2=~7'b0000000;
h3=~7'b0000000;
h4=~7'b1100110; // 4
h5=~7'b1100110; // 4
h6=~7'b1011011; // 2
h7=~7'b0000110; // 1
end
9'b001000001, 9'b010000010, 9'b100000100:
begin
h0=~7'b0000000;
h1=~7'b0000000;
h2=~7'b0000000;
h3=~7'b0000000;
h4=~7'b1001111; // 3
h5=~7'b1001111; // 3
h6= 7'b1000000; // 0
h7= ~7'b0000110; // 1
end
9'b000100001, 9'b010000100, 9'b100001000, 9'b001000010:
begin
h0=~7'b0000000;
h1=~7'b0000000;
h2=~7'b0000000;
h3=~7'b0000000;
h4= ~7'b1011011; // 2
h5=~7'b1101101; // 5
h6=7'b0011000; //9
h7=~7'b0000000;
end
9'b000010001, 9'b0100010000, 9'b100010000, 9'b001000100, 9'b000100010:
begin
h0=~7'b0000000;
h1=~7'b0000000;
h2=~7'b0000000;
h3=~7'b0000000;
h4=~7'b0000111; // 7
h5= ~7'b1100110; // 4
h6= 7'b0000000; // 8
h7=~7'b0000000;
end
9'b000001001, 9'b010010000, 9'b100100000, 9'b001001000, 9'b000100100, 9'b000010010:
begin
h0=~7'b0000000;
h1=~7'b0000000;
h2=~7'b0000000;
h3=~7'b0000000;
h4= ~7'b1101101; // 5
h5= ~7'b1001111; // 3
h6= ~7'b0000111; // 7
h7=~7'b0000000;
end
9'b000000101, 9'b010100000, 9'b101000000, 9'b000101000, 9'b000010100, 9'b000001010, 9'b001010000:
begin
h0=~7'b0000000;
h1=~7'b0000000;
h2=~7'b0000000;
h3=~7'b0000000;
h4= ~7'b1101101; // 5
h5= ~7'b0000111; // 7
h6= 7'b0000010; // 6
h7=~7'b0000000;
end
default:
begin
h0=~7'b0000000;
h1=~7'b0000000;
h2=~7'b0000000;
h3=~7'b0000000;
h4=~7'b0000000;
h5=~7'b0000000;
h6=~7'b0000000;
h7=~7'b0000000;
end
endcase
end
endmodule




