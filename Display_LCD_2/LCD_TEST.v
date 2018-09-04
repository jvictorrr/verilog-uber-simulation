module	LCD_TEST (	//	Host Side
					iCLK,iRST_N,
					d000,d001,d002,d003,d004,d005,d006,d007,d008,d009,d010,d011,d012,d013,d014,d015,
					d100,d101,d102,d103,d104,d105,d106,d107,d108,d109,d110,d111,d112,d113,d114,d115,
					//	LCD Side
					LCD_DATA,LCD_RW,LCD_EN,LCD_RS	);
//	Host Side
input			iCLK,iRST_N;
// Data test
input  	[7:0] d000,d001,d002,d003,d004,d005,d006,d007,d008,d009,d010,d011,d012,d013,d014,d015,d100,d101,d102,d103,d104,d105,d106,d107,d108,d109,d110,d111,d112,d113,d114,d115;
wire 		[8:0] r000,r001,r002,r003,r004,r005,r006,r007,r008,r009,r010,r011,r012,r013,r014,r015,r100,r101,r102,r103,r104,r105,r106,r107,r108,r109,r110,r111,r112,r113,r114,r115;

ascii2lcd( r000, d000 );
ascii2lcd( r001, d001 );
ascii2lcd( r002, d002 );
ascii2lcd( r003, d003 );
ascii2lcd( r004, d004 );
ascii2lcd( r005, d005 );
ascii2lcd( r006, d006 );
ascii2lcd( r007, d007 );
ascii2lcd( r008, d008 );
ascii2lcd( r009, d009 );
ascii2lcd( r010, d010 );
ascii2lcd( r011, d011 );
ascii2lcd( r012, d012 );
ascii2lcd( r013, d013 );
ascii2lcd( r014, d014 );
ascii2lcd( r015, d015 );

ascii2lcd( r100, d100 );
ascii2lcd( r101, d101 );
ascii2lcd( r102, d102 );
ascii2lcd( r103, d103 );
ascii2lcd( r104, d104 );
ascii2lcd( r105, d105 );
ascii2lcd( r106, d106 );
ascii2lcd( r107, d107 );
ascii2lcd( r108, d108 );
ascii2lcd( r109, d109 );
ascii2lcd( r110, d110 );
ascii2lcd( r111, d111 );
ascii2lcd( r112, d112 );
ascii2lcd( r113, d113 );
ascii2lcd( r114, d114 );
ascii2lcd( r115, d115 );

//	LCD Side
output	[7:0]	LCD_DATA;
output			LCD_RW,LCD_EN,LCD_RS;
//	Internal Wires/Registers
reg	[5:0]	LUT_INDEX;
reg	[8:0]	LUT_DATA;
reg	[5:0]	mLCD_ST;
reg	[17:0]	mDLY;
reg			mLCD_Start;
reg	[7:0]	mLCD_DATA;
reg			mLCD_RS;
wire		mLCD_Done;

parameter	LCD_INTIAL	=	0;
parameter	LCD_RESTART	=	4;
parameter	LCD_LINE1	=	5;
parameter	LCD_CH_LINE	=	LCD_LINE1+16;
parameter	LCD_LINE2	=	LCD_LINE1+16+1;
parameter	LUT_SIZE	=	LCD_LINE2+16-1;

always@(posedge iCLK or negedge iRST_N)
begin
	if(!iRST_N)
	begin
		LUT_INDEX	<=	0;
		mLCD_ST		<=	0;
		mDLY		<=	0;
		mLCD_Start	<=	0;
		mLCD_DATA	<=	0;
		mLCD_RS		<=	0;
	end
	else
	begin
		begin
			case(mLCD_ST)
			0:	begin
					mLCD_DATA	<=	LUT_DATA[7:0];
					mLCD_RS		<=	LUT_DATA[8];
					mLCD_Start	<=	1;
					mLCD_ST		<=	1;
				end
			1:	begin
					if(mLCD_Done)
					begin
						mLCD_Start	<=	0;
						mLCD_ST		<=	2;					
					end
				end
			2:	begin
					if(mDLY<18'h3FFFE)
					mDLY	<=	mDLY+1;
					else
					begin
						mDLY	<=	0;
						mLCD_ST	<=	3;
					end
				end
			3:	begin
					if(LUT_INDEX<LUT_SIZE)
						LUT_INDEX	<=	LUT_INDEX+1;
					else
						LUT_INDEX	<=	LCD_RESTART;
					mLCD_ST	<=	0;
				end
			endcase
		end
	end
end

function [8:0] hex2char;
	input [3:0] h;
	hex2char = (h>9 ? 9'h137 : 9'h130) + h;	
endfunction

always
begin
	case(LUT_INDEX)
	//	Initial
	LCD_INTIAL+0:	LUT_DATA	<=	9'h038;
	LCD_INTIAL+1:	LUT_DATA	<=	9'h00C;
	LCD_INTIAL+2:	LUT_DATA	<=	9'h001;
	LCD_INTIAL+3:	LUT_DATA	<=	9'h006;
	LCD_INTIAL+4:	LUT_DATA	<=	9'h080;
	//	Line 1	
	LCD_LINE1+0:	LUT_DATA	<=	r000;
	LCD_LINE1+1:	LUT_DATA	<=	r001;
	LCD_LINE1+2:	LUT_DATA	<=	r002;
	LCD_LINE1+3:	LUT_DATA	<=	r003;
	LCD_LINE1+4:	LUT_DATA	<=	r004;
	LCD_LINE1+5:	LUT_DATA	<=	r005;             
	LCD_LINE1+6:	LUT_DATA	<=	r006;
	LCD_LINE1+7:	LUT_DATA	<=	r007;
	LCD_LINE1+8:	LUT_DATA	<=	r008;
	LCD_LINE1+9:	LUT_DATA	<=	r009;
	LCD_LINE1+10:	LUT_DATA	<= r010;             
	LCD_LINE1+11:	LUT_DATA	<=	r011;
	LCD_LINE1+12:	LUT_DATA	<=	r012;
	LCD_LINE1+13:	LUT_DATA	<=	r013;
	LCD_LINE1+14:	LUT_DATA	<=	r014;
	LCD_LINE1+15:	LUT_DATA	<=	r015;             
	//	Change Line               
	LCD_CH_LINE:	LUT_DATA	<=  9'h0C0;	                    
	//	Line 2                    
	LCD_LINE2+0:	LUT_DATA	<=  r100;
	LCD_LINE2+1:	LUT_DATA	<=	r101;
	LCD_LINE2+2:	LUT_DATA	<=	r102;
	LCD_LINE2+3:	LUT_DATA	<=	r103;
	LCD_LINE2+4:	LUT_DATA	<=	r104;
	LCD_LINE2+5:	LUT_DATA	<=	r105;             
	LCD_LINE2+6:	LUT_DATA	<=	r106;
	LCD_LINE2+7:	LUT_DATA	<=	r107;
	LCD_LINE2+8:	LUT_DATA	<=	r108;
	LCD_LINE2+9:	LUT_DATA	<=	r109;
	LCD_LINE2+10:	LUT_DATA	<=	r110;             
	LCD_LINE2+11:	LUT_DATA	<=	r111;
	LCD_LINE2+12:	LUT_DATA	<=	r112;
	LCD_LINE2+13:	LUT_DATA	<=	r113;
	LCD_LINE2+14:	LUT_DATA	<=	r114;
	LCD_LINE2+15:	LUT_DATA	<=	r115;
	default:	    LUT_DATA	<=	9'h120;
	endcase
end

LCD_Controller 		u0	(	//	Host Side
							.iDATA(mLCD_DATA),
							.iRS(mLCD_RS),
							.iStart(mLCD_Start),
							.oDone(mLCD_Done),
							.iCLK(iCLK),
							.iRST_N(iRST_N),
							//	LCD Interface
							.LCD_DATA(LCD_DATA),
							.LCD_RW(LCD_RW),
							.LCD_EN(LCD_EN),
							.LCD_RS(LCD_RS)	);

endmodule
