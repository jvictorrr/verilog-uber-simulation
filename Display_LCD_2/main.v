module Mod_Teste_LCD_2 (
 //////////////////// Fonte de Clock ////////////////////
		 CLOCK_27,    // 27 MHz
		 CLOCK_50,    // 50 MHz
		 //////////////////// Push Button    ////////////////////
		 KEY,         // Pushbutton (botoes) [3:0]
		 //////////////////// Chaves DPDT
		 SW,         // Toggle Switch (chaves) [17:0]
		 /////////////////// Display de 7-SEG ///////////////////
		 HEX0,       // Display 0
		 HEX1,       // Display 1
		 HEX2,       // Display 2
		 HEX3,       // Display 3
		 HEX4,       // Display 4
		 HEX5,       // Display 5
		 HEX6,       // Display 6
		 HEX7,       // Display 7
		 /////////////////// LED //////////////////
		 LEDG,       // LED Green (verde) [8:0]
		 LEDR,       // LED Red (vermelho) [17:0]
		 ////////////////////	LCD Module 16X2		////////////////
		 LCD_ON,							//	LCD Power ON/OFF
		 LCD_BLON,						//	LCD Back Light ON/OFF
		 LCD_RW,							//	LCD Read/Write Select, 0 = Write, 1 = Read
	    LCD_EN,							//	LCD Enable
		 LCD_RS,							//	LCD Command/Data Select, 0 = Command, 1 = Data
		 LCD_DATA,						//	LCD Data bus 8 bits
		 GPIO_0,							// GPIO
		 GPIO_1,			
	);


   input CLOCK_27;
   input CLOCK_50;

   input [3:0] KEY;
   input [17:0] SW;

   output [6:0] HEX0;
   output [6:0] HEX1;
   output [6:0] HEX2;
   output [6:0] HEX3;
   output [6:0] HEX4;
   output [6:0] HEX5;
	output [6:0] HEX6;
	output [6:0] HEX7;
	
	output [8:0] LEDG;
	output [17:0] LEDR;

// Parte 2
	////////////////////	LCD Module 16X2	////////////////////////////
	inout	[7:0]		LCD_DATA;				//	LCD Data bus 8 bits
	output			LCD_ON;					//	LCD Power ON/OFF
	output			LCD_BLON;				//	LCD Back Light ON/OFF
	output			LCD_RW;					//	LCD Read/Write Select, 0 = Write, 1 = Read
	output			LCD_EN;					//	LCD Enable
	output			LCD_RS;					//	LCD Command/Data Select, 0 = Command, 1 = Data
////////////////////////	GPIO	////////////////////////////////
	inout	[35:0]	GPIO_0;					//	GPIO Connection 0
	inout	[35:0]	GPIO_1;					//	GPIO Connection 1
////////////////////////////////////////////////////////////////////
	
	assign	GPIO_1		=	36'hzzzzzzzzz;
	assign	GPIO_0		=	36'hzzzzzzzzz;	
	
	//	LCD 
	assign	LCD_ON		=	1'b1;
	assign	LCD_BLON		=	1'b1;
	/////////////////////////////


////////// Módulo de teste Local e Destino


////Fios utilizados
wire DECIDE,pedido;
wire CLK, CLR,CLK_2,CLK_3;
wire[8:0]I,inicio,fim,posicao;
wire[7:0] L0,L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12,L13,L14,L15,
D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15;// Definição de varaveis para o Local de Partida e Destino
wire[7:0] M0,M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12,M13,M14,M15,
C0,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15;// Definição das variaveis para motorista e Carro
wire modo;// Escolhe qual informação será mostrada no LCD 
wire [3:0]acende_vermelho;
wire [7:0]P0,P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,
S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15;
wire [8:0]liga_LED,acende_verde,acende_verde_2;

wire[6:0] h0,h1,h2,h3,h4,h5,h6,h7,N1,N2,N3,N4,Le1,Le2,Le3;// variaveis de preço da corrida e de numero e letra da plcaca
wire[6:0] disp0,disp1,disp2,disp3,disp4,disp5,disp6,disp7; // variaveis resultantes para o display
wire clk_out;
wire controle;

wire [8:0]fio;
////// Atribuições as respectivas chaves e botões
assign DECIDE=SW[17];
assign pedido = SW[16];
assign CLK =KEY[1];
assign CLK_2=KEY[2];
assign CLK_3=KEY[3];
assign CLR= SW[13];
assign modo = SW[15];
assign controle =SW[14];
assign I[0]=SW[0];
assign I[1]=SW[1];
assign I[2]=SW[2];
assign I[3]=SW[3];
assign I[4]=SW[4];
assign I[5]=SW[5];
assign I[6]=SW[6];
assign I[7]=SW[7];
assign I[8]=SW[8];





/// Definição do Local e Destino
local_lcd(L0,L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12,L13,L14,L15,
D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15,DECIDE,CLK,CLR,I,fim,inicio);	

divisor_clock_50_1(clk_out,CLOCK_50);
// Definição dos motoristas
motorista(M0,M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12,M13,M14,M15,
C0,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,clk_out,
N1,N2,N3,N4,Le1,Le2,Le3,inicio,fim,acende_verde,acende_vermelho,pedido,liga_LED);



// deslocamento do LEDR
deslocamento(controle,clk_out, liga_LED,acende_verde,inicio,fim,fio,acende_verde_2);
///////////////// Primeira Linha LCD///////////////
mux2_1  LCD_0(L0,M0,modo,P0);
mux2_1  LCD_1 (L1,M1,modo,P1);
mux2_1  LCD_2 (L2,M2,modo,P2);
mux2_1  LCD_3 (L3,M3,modo,P3);
mux2_1  LCD_4(L4,M4,modo,P4);
mux2_1  LCD_5(L5,M5,modo,P5);
mux2_1  LCD_6(L6,M6,modo,P6);
mux2_1  LCD_7(L7,M7,modo,P7);
mux2_1  LCD_8(L8,M8,modo,P8);
mux2_1  LCD_9(L9,M9,modo,P9);
mux2_1 LCD_10(L10,M10,modo,P10);
mux2_1 LCD_11(L11,M11,modo,P11);
mux2_1 LCD_12(L12,M12,modo,P12);
mux2_1 LCD_13(L13,M13,modo,P13);
mux2_1 LCD_14(L14,M14,modo,P14);
mux2_1 LCD_15(L15,M15,modo,P15);

//////////////////Segunda Linha LCD/////////////
mux2_1 LCD_2_0 (D0,C0,modo,S0);
mux2_1 LCD_2_1 (D1,C1,modo,S1);
mux2_1 LCD_2_2 (D2,C2,modo,S2);
mux2_1 LCD_2_3 (D3,C3,modo,S3);
mux2_1 LCD_2_4 (D4,C4,modo,S4);
mux2_1 LCD_2_5(D5,C5,modo,S5);
mux2_1 LCD_2_6(D6,C6,modo,S6);
mux2_1 LCD_2_7(D7,C7,modo,S7);
mux2_1 LCD_2_8(D8,C8,modo,S8);
mux2_1 LCD_2_9(D9,C9,modo,S9);
mux2_1 LCD_2_10(D10,C10,modo,S10);
mux2_1 LCD_2_11(D11,C11,modo,S11);
mux2_1 LCD_2_12(D12,C12,modo,S12);
mux2_1 LCD_2_13(D13,C13,modo,S13);
mux2_1 LCD_2_14(D14,C14,modo,S14);
mux2_1 LCD_2_15(D15,C15,modo,S15);
/////////////////////////////////////////////
//Função para localização e preço
location(inicio,fim,posicao);
preco(CLK,h0,h1,h2,h3,h4,h5,h6,h7,posicao);


/////////// mux para alternar entre preço e placa do carro/////
mux_2_1_7bits H0(h0,N1,modo,disp0);
mux_2_1_7bits H1(h1,N2,modo,disp1);
mux_2_1_7bits H2(h2,N3,modo,disp2);
mux_2_1_7bits H3(h3,N4,modo,disp3);
mux_2_1_7bits H4(h4,Le1,modo,disp4);
mux_2_1_7bits H5(h5,Le2,modo,disp5);
mux_2_1_7bits H6(h6,Le3,modo,disp6);
mux_2_1_7bits H7(h7,~7'b0000000,modo,disp7);

assign LEDR= fio;
assign LEDG= acende_verde_2;

assign HEX0 = disp0;
assign HEX1 = disp1;
assign HEX2 = disp2;
assign HEX3 = disp3;
assign HEX4 = disp4;
assign HEX5 = disp5;
assign HEX6 = disp6;
assign HEX7 = disp7;

	LCD_TEST u5	(	
	
							//	Host Side
							.iCLK  	( CLOCK_50 ),
							.iRST_N	( KEY[0]),
							
							//Data to display
	/////////////////////////////////////////////////////////////////////////////////////////////						
							// Para utilizar todo o Display LCD, deve-se
							//	Escrever o caractere em hexadecimal de acordo com a tabela ASCII
							// H� espa�o para 16 caracteres em cada uma das duas linhas
	/////////////////////////////////////////////////////////////////////////////////////////////				
	
							.d000 ( P0 ),
							.d001 ( P1 ),
							.d002 ( P2 ),
							.d003 ( P3 ),
							.d004 ( P4 ),
							.d005 ( P5) ,
							.d006 ( P6 ),
							.d007 ( P7 ),
							.d008 ( P8 ),
							.d009 ( P9 ),
							.d010 ( P10 ),
							.d011 ( P11 ),
							.d012 ( P12 ),
							.d013 ( P13 ),
							.d014 ( P14 ),
							.d015 ( P15 ),
							
							.d100 ( S0 ),
							.d101 ( S1 ),
							.d102 ( S2 ),
							.d103 ( S3 ),
							.d104 ( S4 ),
							.d105 ( S5 ),
							.d106 ( S6 ),
							.d107 ( S7 ),
							.d108 ( S8 ),
							.d109 ( S9 ),
							.d110 ( S10 ),
							.d111 ( S11 ),
							.d112 ( S12 ),
							.d113 ( S13 ),
							.d114 ( S14 ),
							.d115 ( S15 ),
							
							//	LCD Side
							
							.LCD_DATA( LCD_DATA ),
							.LCD_RW  ( LCD_RW ),
							.LCD_EN	( LCD_EN ),
							.LCD_RS  ( LCD_RS ));


endmodule

