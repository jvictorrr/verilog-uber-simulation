 //Universidade Federal de Campina Grande
// Departamento de Engenharia Elétrica e Informática
// João Victor Rodrigues Ramalho: joao.ramalho@ee.ufcg.edu.br
// Pedro Henrique de Araújo Felipe: pedro.felipe@ee.ufcg.edu.br


module set_Local(P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,S8,S9,S10,S11,S12,S13,S14,S15,DECIDE,CLK,CLR,I,fim,inicio);
input DECIDE;// utilizado como controle, para alternar entre local inicial e destino.
input CLK, CLR;
input [8:0]I;
output reg [8:0]fim;// registro da posição final
output reg [8:0]inicio; // registro da posição inicial
output reg[7:0] P6,P7,P8,P9,P10,P11,P12,P13,P14,
P15,S8,S9,S10,S11,S12,S13,S14,S15 ;// variáveis para a escrita no LCD

	always @(posedge CLK or posedge CLR)
	begin 	
		if (CLR)
			begin
			////////////////////////////////////////////Limpeza //////////////////////////////////////
				P6 = 8'h20;  //  Espaço em branco
				P7 = 8'h20;
				P8 = 8'h20;
				P9 = 8'h20;
				P10 = 8'h20;
				P11 = 8'h20;
				P12 = 8'h20;
				P13 = 8'h20;
				P14 = 8'h20;
				P15 = 8'h20;
				S8 = 8'h20;
				S9 = 8'h20;
				S10 = 8'h20;
				S11 = 8'h20;
				S12 = 8'h20;
				S13 = 8'h20;
				S14 = 8'h20;
				S15 = 8'h20;
				/////////////////////////////////////////////////////////////////////////////////////////
			end 
		else if(DECIDE==0)
			begin
			inicio={I};
			case({I})
			1: begin
			P6 = 8'h50;//P;
			P7 = 8'h72;//r;
			P8 = 8'h61;//a;
			P9 = 8'h74;//t;
			P10 = 8'h61;//a;
			P11 = 8'h20;//space
			P12 = 8'h20;//space
			P13 = 8'h20;//space
			P14 = 8'h20;//space
			P15 = 8'h20;//space
			end
		
			2:
			begin
			P6 = 8'h43;//C;
			P7 = 8'h65;//e;
			P8 = 8'h6e;//n;
			P6 = 8'h47;//G;
			P7 = 8'h6c;//l;
			P8 = 8'h6f;//o;
			P9 = 8'h72;//r;
			P10 = 8'h69;//i;
			P11 = 8'h61;//a;
			P12 = 8'h20;//space
			P13 = 8'h20;//space
			P14 = 8'h20;//space
			P15 = 8'h20;//space
			end
			4: 
			begin
			P6 = 8'h55;//U;
			P7 = 8'h46;//F;
			P8 = 8'h43;//C;
			P9 = 8'h47;//G;
			P10 = 8'h20;//space
			P11 = 8'h20;//space
			P12 = 8'h20;//space
			P13 = 8'h20;//space
			P14 = 8'h20;//space
			P15 = 8'h20;//space
			end
			
			8:
			begin
			P6 = 8'h43;//C;
			P7 = 8'h61;//a;
			P8 = 8'h74;//t;
			P9 = 8'h6f;//o;
			P10 = 8'h6c;//l;
			P11 = 8'h65;//e;
			P12 = 8'h20;//space
			P13 = 8'h20;//space
			P14 = 8'h20;//space
			P15 = 8'h20;//space
			end

			16:
			begin
			P6 = 8'h47;//G;
			P7 = 8'h6c;//l;
			P8 = 8'h6f;//o;
			P9 = 8'h72;//r;
			P10 = 8'h69;//i;
			P11 = 8'h61;//a;
			P12 = 8'h20;//space
			P13 = 8'h20;//space
			P14 = 8'h20;//space
			P15 = 8'h20;//space
			end
			32:
			begin
			P6 = 8'h4d;//M
			P7 = 8'h69;//i
			P8 = 8'h72;//r;
			P9 = 8'h61;//a;
			P10 = 8'h6e;//n
			P11 = 8'h74;//t
			P12 = 8'h65;//e
			P13 = 8'h20;//space
			P14 = 8'h20;//space
			P15 = 8'h20;//space
			end
			64:
			begin
			P6 = 8'h43;//C;
			P7 = 8'h75;//u;
			P8 = 8'h69;//i;
			P9 = 8'h74;//t;
			P10 = 8'h65;//e;
			P11 = 8'h73;//s;
			P12 = 8'h20;//space
			P13 = 8'h20;//space
			P14 = 8'h20;//space
			P15 = 8'h20;//space
			end
			128:
			begin
			P6 = 8'h54;//T;
			P7 = 8'h61;//a;
			P8 = 8'h6d;//m;
			P9 = 8'h62;//b;
			P10 = 8'h6f;//o;
			P11 = 8'h72;//r;
			P12 = 8'h20;//space
			P13 = 8'h20;//space
			P14 = 8'h20;//space
			P15 = 8'h20;//space
			end
			endcase
			end

		else if(DECIDE==1)
			begin
			fim={I};
			case({I})
			1:
			begin
			S8 = 8'h50;//P;
			S9 = 8'h72;//r;
			S10 = 8'h61;//a;
			S11 = 8'h74;//t;
			S12 = 8'h61;//a;
			S13 = 8'h20;//space
			S14 = 8'h20;//space
			S15 = 8'h20;//space
			end
		
			2:
			begin
			S8 = 8'h43;//C;
			S9 = 8'h65;//e;
			S10 = 8'h6e;//n;
			S11 = 8'h74;//t;
			S12 = 8'h72;//r;
			S13 = 8'h6f;//o;
			S14 = 8'h20;//space
			S15 = 8'h20;//space
			end
			4: 
			begin
			S8 = 8'h55;//U;
			S9 = 8'h46;//F;
			S10 = 8'h43;//C;
			S11 = 8'h47;//G;
			S12 = 8'h20;//space
			S13 = 8'h20;//space
			S14 = 8'h20;//space
			S15 = 8'h20;//space
			end
			
			8:
			begin
			S8 = 8'h43;//C;
			S9 = 8'h61;//a;
			S10 = 8'h74;//t;
			S11 = 8'h6f;//o;
			S12 = 8'h6c;//l;
			S13 = 8'h65;//e;
			S14 = 8'h22;//space
			S15 = 8'h22;//space
			end
			16:
			begin
			S8 = 8'h47;//G;
			S9 = 8'h6c;//l;
			S10 = 8'h6f;//o;
			S11 = 8'h72;//r;
			S12 = 8'h69;//i;
			S13 = 8'h61;//a;
			S14 = 8'h20;//space
			S15 = 8'h20;//space
			end
			32:
			begin
			S8 = 8'h4d;//M
			S9 = 8'h69;//i
			S10 = 8'h72;//r;
			S11 = 8'h61;//a;
			S12 = 8'h6e;//n
			S13 = 8'h74;//t
			S14 = 8'h65;//e
			S15 = 8'h20;//space
			end
			64:
			begin
			S8 = 8'h43;//C;
			S9 = 8'h75;//u;
			S10 = 8'h69;//i;
			S11 = 8'h74;//t;
			S12 = 8'h65;//e;
			S13 = 8'h73;//s;
			S14 = 8'h20;//space
			S15 = 8'h20;//space
			end
			128:
			begin
			S8 = 8'h54;//T;
			S9 = 8'h61;//a;
			S10 = 8'h6d;//m;
			S11 = 8'h62;//b;
			S12 = 8'h6f;//o;
			S13 = 8'h72;//r;
			S14 = 8'h20;//space
			S15 = 8'h20;//space
			end
			endcase
			end

	end 
	endmodule

