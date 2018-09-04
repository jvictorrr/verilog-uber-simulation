//Universidade Federal de Campina Grande
// Departamento de Engenharia Elétrica e Informática
// João Victor Rodrigues Ramalho: joao.ramalho@ee.ufcg.edu.br
// Pedro Henrique de Araújo Felipe: pedro.felipe@ee.ufcg.edu.br

// Modulo responsável pela inicialização do Local e Destino

module local_lcd(P0,P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,
S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,DECIDE,CLK,CLR,I,
fim,inicio);


	
	///////////////////////////////////Set_LCD///////////////////////////////////////////q
	
	///////////////////////////////////////////////////////////////////////////////
	
input DECIDE;
input CLK, CLR;
input [8:0]I;
output [8:0]fim;
output [8:0]inicio;
output [7:0] P0,P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,
S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15;

/////////////////////// 
//Inicialização.
			assign	P0= 8'h 4c; // L
			assign	P1= 8'h6f; // o
			assign	P2= 8'h 63; // c
			assign 	P3= 8'h 61; // a
			assign	P4= 8'h 4c; // L
			assign 	P5 = 8'h 3a; // :

			assign	S0= 8'h 44; // D
			assign	S1= 8'h 65; // e
			assign	S2= 8'h 73; // s
			assign 	S3= 8'h 74; // t
			assign	S4= 8'h 69; // i
			assign 	S5 = 8'h6e;  // n
			assign	S6= 8'h6f; // o
			assign 	S7 = 8'h 3a; // 

	
set_Local(P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,S8,S9,S10,S11,S12,S13,S14,S15,DECIDE,CLK,CLR,I,fim,inicio);

	
	 endmodule