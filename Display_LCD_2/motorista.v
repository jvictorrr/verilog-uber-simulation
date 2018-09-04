 //Universidade Federal de Campina Grande
// Departamento de Engenharia Elétrica e Informática
// João Victor Rodrigues Ramalho: joao.ramalho@ee.ufcg.edu.br
// Pedro Henrique de Araújo Felipe: pedro.felipe@ee.ufcg.edu.br

// Módulo responsável por selecionar os motoristas


module motorista(M0,M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12,M13,M14,M15,
C0,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,clk,
N1,N2,N3,N4,L1,L2,L3,
inicio,fim,acende_verde,acende_vermelho,pedido,liga_LED);
input clk;
input[7:0] inicio,fim;
output reg [7:0]acende_verde;
output reg[17:0] acende_vermelho ;
input pedido;
output reg [8:0]liga_LED;

output reg [7:0] M0,M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12,M13,M14,M15,
C0,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15;
output reg [6:0] N1,N2,N3,N4,L1,L2,L3;
always@(posedge clk)
begin 
if (pedido==0)
liga_LED= 9'b 100101011;
else
begin
	case({inicio})
	1:
	begin
	liga_LED= 9'b000100000;
	//Nome do Motorista
	M0 = 8'h4a;//J
	M1 = 8'h6f;//o
	M2 = 8'h61;//a
	M3 = 8'h6f;//o
	M4 = 8'h20;//space 
	M5 = 8'h52;//R
	M6 = 8'h6f;//o
	M7 = 8'h64;//d
	M8 = 8'h72;//r
	M9 = 8'h69;//i
	M10 = 8'h67;//g
	M11 = 8'h75;//u
	M12 = 8'h65;//e
	M13 = 8'h73;//s
	M14 = 8'h20;//space
	M15 = 8'h20;//space
	//modelo do carro:
	C0 = 8'h46; //F 	
	C1 = 8'h69; //i
	C2 = 8'h61; //a
	C3 = 8'h74; //t
	C4 = 8'h2d; //-
	C5 = 8'h55; //U
	C6 = 8'h6e; //n
	C7 = 8'h6f; //o
	C9 = 8'h20;//space
	C10 = 8'h20;//space
	C11 = 8'h20;//space
	C12 = 8'h20;//space
	C13 = 8'h20;//space
	C14 = 8'h20;//space
	C15 = 8'h20;//space
	//placa do carro:
	N1 = ~7'b1011011;//2
	N2 = ~7'b1100110;//4
	N3 = ~7'b1011011;//2
	N4 = ~7'b1100110;//4
	L1 = ~7'b0111110;//V
	L2 = ~7'b00000110;//I
	L3 = ~7'b1110111;//A
	end

	2:
	begin
	liga_LED= 9'b000100000;
	//Nome do Motorista
	M0 = 8'h4a;//J
	M1 = 8'h6f;//o
	M2 = 8'h61;//a
	M3 = 8'h6f;//o
	M4 = 8'h20;//space 
	M5 = 8'h52;//R
	M6 = 8'h6f;//o
	M7 = 8'h64;//d
	M8 = 8'h72;//r
	M9 = 8'h69;//i
	M10 = 8'h67;//g
	M11 = 8'h75;//u
	M12 = 8'h65;//e
	M13 = 8'h73;//s
	M14 = 8'h20;//space
	M15 = 8'h20;//space
	//modelo do carro:
	C0 = 8'h46; //F 	
	C1 = 8'h69; //i
	C2 = 8'h61; //a
	C3 = 8'h74; //t
	C4 = 8'h2d; //-
	C5 = 8'h55; //U
	C6 = 8'h6e; //n
	C7 = 8'h6f; //o
	C9 = 8'h20; //space
	C10 = 8'h20; //space
	C11 = 8'h20; //space
	C12 = 8'h20; //space
	C13 = 8'h20; //space
	C14 = 8'h20; //space
	C15 = 8'h20; //space
	//placa do carro:
	N1 = ~7'b1011011;//2
	N2 = ~7'b1100110;//4
	N3 = ~7'b1011011;//2
	N4 = ~7'b1100110;//4
	L1 = ~7'b0111110;//V
	L2 = ~7'b00000110;//I
	L3 = ~7'b1110111;//A
	end
	
	4:
	begin 
	liga_LED=  9'b100000000;
	//Nome do Motorista
	M0 = 8'h4d; //M
	M1 = 8'h61; //a
	M2 = 8'h74; //t
	M3 = 8'h68; //h
	M4 = 8'h65; //e 
	M5 = 8'h75; //u
	M6 = 8'h73; //s
	M7 = 8'h20; //space
	M8 = 8'h43; //C
	M9 = 8'h61; //a
	M10 = 8'h72; //r
	M11 = 8'h64; //d
	M12 = 8'h6f; //o
	M13 = 8'h73; //s
	M14 = 8'h6f; //o
	M15 = 8'h20; //space
	//modelo do carro:
	C0 = 8'h46; //F 	
	C1 = 8'h69; //i
	C2 = 8'h61; //a
	C3 = 8'h74; //t
	C4 = 8'h2d; //-
	C5 = 8'h50;//P
	C6 = 8'h61;//a
	C7 = 8'h6c;//l
	C8 = 8'h69;//i
	C9 = 8'h6f;//o
	C10 = 8'h20;//space
	C11 = 8'h20;//space
	C12 = 8'h20;//space
	C13 = 8'h20;//space
	C14 = 8'h20;//space
	C15 = 8'h20;//space
	//placa do carro:
	N1 = ~7'b1011011;//2
	N2 = ~7'b1100110;//4
	N3 = ~7'b1011011;//2
	N4 = ~7'b1100110;//4
	L1 = ~7'b0111110;//V
	L2 = ~7'b00000110;//I
	L3 = ~7'b1110111;//A
	end

	8: 
	begin
	liga_LED=  9'b100000000;
	M0 = 8'h4d; //M
	M1 = 8'h61; //a
	M2 = 8'h74; //t
	M3 = 8'h68; //h
	M4 = 8'h65; //e 
	M5 = 8'h75; //u
	M6 = 8'h73; //s
	M7 = 8'h20; //space
	M8 = 8'h43; //C
	M9 = 8'h61; //a
	M10 = 8'h72; //r
	M11 = 8'h64; //d
	M12 = 8'h6f; //o
	M13 = 8'h73; //s
	M14 = 8'h6f; //o
	M15 = 8'h20; //space
	//modelo do carro:
	C0 = 8'h46; //F 	
	C1 = 8'h69; //i
	C2 = 8'h61; //a
	C3 = 8'h74; //t
	C4 = 8'h2d; //-
	C5 = 8'h50; //P
	C6 = 8'h61; //a
	C7 = 8'h6c; //l
	C8 = 8'h69; //i
	C9 = 8'h6f; //o
	C10 = 8'h20; //space
	C11 = 8'h20; //space
	C12 = 8'h20; //space
	C13 = 8'h20; //space
	C14 = 8'h20; //space
	C15 = 8'h20; //space
	//placa do carro:
	N1 = ~7'b1100110;//4
	N2 = ~7'b1001111;//3
	N3 = ~7'b1001111;//3
	N4 = ~7'b1100110;//4
	L1 = ~7'b1110001;//F
	L2 = ~7'b1101101;//S
	L3 = ~7'b1110001;//F
	end

   	16:
	begin
	liga_LED= 9'b000000010;
	//Nome do Motorista
	M0 = 8'h50;//P
	M1 = 8'h65;//e
	M2 = 8'h64;//d
	M3 = 8'h72;//r
	M4 = 8'h6f;//o 
	M5 = 8'h20;//space
	M6 = 8'h48;//H
	M7 = 8'h65;//e
	M8 = 8'h6e;//n
	M9 = 8'h72;//r
	M10 = 8'h69;//i
	M11 = 8'h71;//q
	M12 = 8'h75;//u
	M13 = 8'h65;//e
	M14 = 8'h20;//space
	M15 = 8'h20;//space
	//modelo do carro:
	C0 = 8'h56; //V
	C1 = 8'h6f; //o
	C2 = 8'h6c; //l
	C3 = 8'h6b; //k
	C4 = 8'h73; //s
	C5 = 8'h77; //w
	C6 = 8'h61; //a
	C7 = 8'h67; //g
	C9 = 8'h65; //e
	C10 = 8'h6e; //n
	C11 = 8'h2d; //-
	C12 = 8'h47; //G
	C13 = 8'h6f; //o
	C14 = 8'h6c; //l
	C15 = 8'h20; //space
	N1 = ~7'b1001111;//3
	N2 = ~7'b1001111;//3
	N3 = ~7'b1001111;//3
	N4 = ~7'b1100110;//4
	L1 = ~7'b1110001;//F
	L2 = ~7'b1110001;//F
	L3 = ~7'b1101101;//S
	end

	32:
	begin
	liga_LED= 9'b000000010;
	//Nome do Motorista
	M0 = 8'h50;//P
	M1 = 8'h65;//e
	M2 = 8'h64;//d
	M3 = 8'h72;//r
	M4 = 8'h6f;//o 
	M5 = 8'h20;//space
	M6 = 8'h48;//H
	M7 = 8'h65;//e
	M8 = 8'h6e;//n
	M9 = 8'h72;//r
	M10 = 8'h69;//i
	M11 = 8'h71;//q
	M12 = 8'h75;//u
	M13 = 8'h65;//e
	M14 = 8'h20;//space
	M15 = 8'h20;//space
	//modelo do carro:
	C0 = 8'h56; //V
	C1 = 8'h6f; //o
	C2 = 8'h6c; //l
	C3 = 8'h6b; //k
	C4 = 8'h73; //s
	C5 = 8'h77; //w
	C6 = 8'h61; //a
	C7 = 8'h67; //g
	C9 = 8'h65; //e
	C10 = 8'h6e; //n
	C11 = 8'h2d; //-
	C12 = 8'h47; //G
	C13 = 8'h6f; //o
	C14 = 8'h6c; //l
	C15 = 8'h20; //space
	N1 = ~7'b1001111;//3
	N2 = ~7'b1001111;//3
	N3 = ~7'b1001111;//3
	N4 = ~7'b1100110;//4
	L1 = ~7'b1110001;//F
	L2 = ~7'b1110001;//F
	L3 = ~7'b1101101;//S
	end

	64:
	begin
	liga_LED= 9'b000001000;
	//Nome do Motorista
	M0 = 8'h4c;//L
	M1 = 8'h75;//u
	M2 = 8'h6c;//l
	M3 = 8'h61;//a
	M4 = 8'h20;//space 
	M5 = 8'h53;//S
	M6 = 8'h69;//i
	M7 = 8'h6c;//l
	M8 = 8'h76;//v
	M9 = 8'h61;//a
	M10 = 8'h20;//space
	M11 = 8'h20;//space
	M12 = 8'h20;//space
	M13 = 8'h20;//space
	M14 = 8'h20;//space
	M15 = 8'h20;//space
	//modelo do carro:
	C0 = 8'h52;//R
	C1 = 8'h65;//e
	C2 = 8'h6e;//n
	C3 = 8'h61;//a
	C4 = 8'h75;//u
	C5 = 8'h6c;//l
	C6 = 8'h74;//t
	C7 = 8'h2d;//-
	C8 = 8'h4b;//K
	C9 = 8'h77;//w
	C10 = 8'h69;//i
	C11 = 8'h64;//d
	C12 = 8'h20;//space
	C13 = 8'h20;//space
	C14 = 8'h20;//space
	C15 = 8'h20;//space
	//placa do carro:
	N1 = ~7'b1001111;//3
	N2 = ~7'b1101101;//5
	N3 = ~7'b1001111;//3
	N4 = ~7'b1101101;//5
	L1 = ~7'b0111110;//U
	L2 = ~7'b1110001;//F
	L3 = ~7'b1101101;//S
	end

  	128:
  	begin
  	liga_LED= 9'b000000001;
	//Nome do Motorista
	M0 = 8'h50;//P
	M1 = 8'h79;//y
	M2 = 8'h65;//e
	M3 = 8'h74;//t
	M4 = 8'h72;//r 
	M5 = 8'h61;//a
	M6 = 8'h22;//
	M7 = 8'h46;//F
	M8 = 8'h65;//e
	M9 = 8'h69;//i
	M10 = 8'h74;//t
	M11 = 8'h6f;//o
	M12 = 8'h73;//s
	M13 = 8'h61;//a

	M14 = 8'h20;//space
	M15 = 8'h20;//space
	//modelo do carro:
	C0 = 8'h4a;//J
	C1 = 8'h65;//e
	C2 = 8'h65;//e
	C3 = 8'h70;//p
	C4 = 8'h2d;//-
	C5 = 8'h52;//R
	C6 = 8'h65;//e
	C7 = 8'h6e;//n
	C8 = 8'h65;//e
	C9 = 8'h67;//g
	C10 = 8'h61;//a
	C11 = 8'h64;//d
	C12 = 8'h65;//e
	C13 = 8'h20;//space
	C14 = 8'h20;//space
	C15 = 8'h20;//space

	//placa do carro:
	N1 = ~7'b1001111;//3
	N2 = ~7'b1101101;//5
	N3 = ~7'b1001111;//3
	N4 = ~7'b1101101;//5
	L1 = ~7'b0111110;//U
	L2 = ~7'b1110001;//F
	L3 = ~7'b1101101;//S

  	end
	256:
	begin
	
	liga_LED= 9'b000000001;
	//Nome do Motorista
	M0 = 8'h50;//P
	M1 = 8'h79;//y
	M2 = 8'h65;//e
	M3 = 8'h74;//t
	M4 = 8'h72;//r 
	M5 = 8'h61;//a
	M6 = 8'h22;//
	M7 = 8'h46;//F
	M8 = 8'h65;//e
	M9 = 8'h69;//i
	M10 = 8'h74;//t
	M11 = 8'h6f;//o
	M12 = 8'h73;//s
	M13 = 8'h61;//a

	M14 = 8'h20;//space
	M15 = 8'h20;//space
	//modelo do carro:
	C0 = 8'h4a;//J
	C1 = 8'h65;//e
	C2 = 8'h65;//e
	C3 = 8'h70;//p
	C4 = 8'h2d;//-
	C5 = 8'h52;//R
	C6 = 8'h65;//e
	C7 = 8'h6e;//n
	C8 = 8'h65;//e
	C9 = 8'h67;//g
	C10 = 8'h61;//a
	C11 = 8'h64;//d
	C12 = 8'h65;//e
	C13 = 8'h20;//space
	C14 = 8'h20;//space
	C15 = 8'h20;//space

	//placa do carro:
	N1 = ~7'b1001111;//3
	N2 = ~7'b1101101;//5
	N3 = ~7'b1001111;//3
	N4 = ~7'b1101101;//5
	L1 = ~7'b0111110;//U
	L2 = ~7'b1110001;//F
	L3 = ~7'b1101101;//S

	end
  	default: liga_LED= 9'b 100100010;
  	endcase
	end
end
endmodule