 //Universidade Federal de Campina Grande
// Departamento de Engenharia Elétrica e Informática
// João Victor Rodrigues Ramalho: joao.ramalho@ee.ufcg.edu.br
// Pedro Henrique de Araújo Felipe: pedro.felipe@ee.ufcg.edu.br

// Módulo responsável por realizar o deslocamento do motorista até a posição inicial do usuário.
 
module deslocamento(controle,clk, liga_LED,acende_verde,inicio,fim,fio,acende_verde_2);
 
input clk;
input[8:0] inicio,fim; 
input [7:0]acende_verde; // informação passada pelo modulo motorista
input [8:0]liga_LED; // entrada de quais LEDRS foram necessarios serem acessos na função motorista
input controle; 

output reg [8:0]fio;// variavel pra acender os LEDRS
output reg[7:0]acende_verde_2;// saida pra acender o LEDG

reg [8:0]cabo,aux; // bariáveis de auxilio


 always@(posedge clk)
 begin
 if(controle==0)
 begin
 fio=liga_LED;
 cabo=liga_LED;
 aux=cabo;
 acende_verde_2=acende_verde;
 end
	else
	begin 
	if(cabo !=9'b 100101011)
		begin
		if (acende_verde==8'b00000000)
			begin
			if(({fio}> {inicio}) && (acende_verde==8'b00000000))
			begin
			cabo = aux >> 1; // desloca o bit
			fio = cabo;
			aux=cabo;
			end
			else if({fio} <{inicio} && (acende_verde==8'b00000000))
			begin
			cabo = (aux << 1); 
			fio = cabo;
			aux=cabo;
			end
			else if({fio}=={inicio} &&(acende_verde==8'b00000000))
			begin
			acende_verde_2=~8'b00000000; // confirmação de chegada 
			end
		
		end
	end
end
end
	endmodule
