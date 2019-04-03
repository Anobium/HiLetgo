;Program compiled by Great Cow BASIC (0.98.<<>> 2019-04-02  (Windows 32 bit))
;Need help? See the GCBASIC forums at http://sourceforge.net/projects/gcbasic/forums,
;check the documentation or email w_cholmondeley at users dot sourceforge dot net.

;********************************************************************************

;Chip Model: MEGA328P
;Assembler header file
.INCLUDE "m328pdef.inc"

;SREG bit names (for AVR Assembler compatibility, GCBASIC uses different names)
#define C 0
#define H 5
#define I 7
#define N 2
#define S 4
#define T 6
#define V 3
#define Z 1

;********************************************************************************

;Set aside memory locations for variables
.EQU	CHARCODE=307
.EQU	CHARCOL=308
.EQU	CHARCOL_H=309
.EQU	CHARLOCX=310
.EQU	CHARLOCX_H=311
.EQU	CHARLOCY=312
.EQU	CHARLOCY_H=313
.EQU	COLSPERFONT=314
.EQU	CURRCHARCOL=315
.EQU	CURRCHARROW=316
.EQU	CURRCHARVAL=317
.EQU	DRAWLINE=318
.EQU	DRAWLINE_H=319
.EQU	GLCDBACKGROUND=320
.EQU	GLCDBACKGROUND_H=321
.EQU	GLCDCOLOUR=322
.EQU	GLCDCOLOUR_H=323
.EQU	GLCDDEVICEHEIGHT=324
.EQU	GLCDDEVICEHEIGHT_H=325
.EQU	GLCDDEVICEWIDTH=326
.EQU	GLCDDEVICEWIDTH_H=327
.EQU	GLCDFNTDEFAULT=328
.EQU	GLCDFNTDEFAULTSIZE=329
.EQU	GLCDFONTWIDTH=330
.EQU	GLCDFOREGROUND=331
.EQU	GLCDFOREGROUND_H=332
.EQU	GLCDPRINTLEN=333
.EQU	GLCDPRINTLOC=334
.EQU	GLCDPRINTLOC_H=335
.EQU	GLCDPRINT_STRING_COUNTER=336
.EQU	GLCDROTATESTATE=337
.EQU	GLCDTEMP=338
.EQU	GLCDTEMP_H=339
.EQU	GLCDX=340
.EQU	GLCDX_H=341
.EQU	GLCDY=342
.EQU	GLCDY_H=343
.EQU	GLCD_YORDINATE=344
.EQU	GLCD_YORDINATE_H=345
.EQU	ILI9341SENDBYTE=346
.EQU	ILI9341SENDWORD=347
.EQU	ILI9341SENDWORD_H=348
.EQU	LINECOLOUR=349
.EQU	LINECOLOUR_H=350
.EQU	LINEX1=351
.EQU	LINEX1_H=352
.EQU	LINEX2=353
.EQU	LINEX2_H=354
.EQU	LINEY1=355
.EQU	LINEY1_H=356
.EQU	LINEY2=357
.EQU	LINEY2_H=358
.EQU	LOCALCHARCODE=359
.EQU	LOCALCHARCODE_H=360
.EQU	OBJHEIGHT=361
.EQU	OBJHEIGHT_H=362
.EQU	OBJWIDTH=363
.EQU	OBJWIDTH_H=364
.EQU	OLDGLCDFONTWIDTH=365
.EQU	PIXELRGB=366
.EQU	PIXELRGB_H=367
.EQU	PRINTLOCX=368
.EQU	PRINTLOCX_H=369
.EQU	PRINTLOCY=370
.EQU	PRINTLOCY_H=371
.EQU	ROWSPERFONT=372
.EQU	SELECTEDTABLE=373
.EQU	SELECTEDTABLE_H=374
.EQU	STRINGPOINTER=375
.EQU	SYSLCDPRINTDATAHANDLER=376
.EQU	SYSLCDPRINTDATAHANDLER_H=377
.EQU	SYSREPEATTEMP1=378
.EQU	SYSREPEATTEMP2=379
.EQU	SYSREPEATTEMP2_H=380
.EQU	SYSSTRINGPARAM1=256
.EQU	TABLEREADPOSITION=381
.EQU	TABLEREADPOSITION_H=382
.EQU	TFTX=383
.EQU	TFTXPOS=385
.EQU	TFTXPOS_H=386
.EQU	TFTX_H=384
.EQU	TFTY=387
.EQU	TFTYPOS=389
.EQU	TFTYPOS_H=390
.EQU	TFTY_H=388
.EQU	XCOUNT=391
.EQU	XCOUNT_H=392
.EQU	YCOUNT=393
.EQU	YCOUNT_H=394
.EQU	_X1=395
.EQU	_X1_H=396
.EQU	_X2=397
.EQU	_X2_H=398
.EQU	_Y1=399
.EQU	_Y1_H=400
.EQU	_Y2=401
.EQU	_Y2_H=402

;********************************************************************************

;Register variables
.DEF	DELAYTEMP=r25
.DEF	DELAYTEMP2=r26
.DEF	SYSBITTEST=r5
.DEF	SYSBYTETEMPA=r22
.DEF	SYSBYTETEMPB=r28
.DEF	SYSBYTETEMPX=r0
.DEF	SYSCALCTEMPA=r22
.DEF	SYSCALCTEMPB=r28
.DEF	SYSCALCTEMPX=r0
.DEF	SYSDIVMULTX=r2
.DEF	SYSDIVMULTX_H=r3
.DEF	SYSREADA=r30
.DEF	SYSREADA_H=r31
.DEF	SYSSTRINGA=r26
.DEF	SYSSTRINGA_H=r27
.DEF	SYSSTRINGB=r28
.DEF	SYSSTRINGB_H=r29
.DEF	SYSSTRINGLENGTH=r25
.DEF	SYSVALUECOPY=r21
.DEF	SYSWAITTEMPMS=r29
.DEF	SYSWAITTEMPMS_H=r30
.DEF	SYSWAITTEMPUS=r27
.DEF	SYSWAITTEMPUS_H=r28
.DEF	SYSWORDTEMPA=r22
.DEF	SYSWORDTEMPA_H=r23
.DEF	SYSWORDTEMPB=r28
.DEF	SYSWORDTEMPB_H=r29
.DEF	SYSWORDTEMPX=r0
.DEF	SYSWORDTEMPX_H=r1
.DEF	SYSTEMP1=r6
.DEF	SYSTEMP1_H=r7
.DEF	SYSTEMP2=r8
.DEF	SYSTEMP2_H=r9
.DEF	SYSTEMP3=r16
.DEF	SYSTEMP4=r4

;********************************************************************************

;Vectors
;Interrupt vectors
.ORG	0
	rjmp	BASPROGRAMSTART ;Reset
.ORG	2
	reti	;INT0
.ORG	4
	reti	;INT1
.ORG	6
	reti	;PCINT0
.ORG	8
	reti	;PCINT1
.ORG	10
	reti	;PCINT2
.ORG	12
	reti	;WDT
.ORG	14
	reti	;TIMER2_COMPA
.ORG	16
	reti	;TIMER2_COMPB
.ORG	18
	reti	;TIMER2_OVF
.ORG	20
	reti	;TIMER1_CAPT
.ORG	22
	reti	;TIMER1_COMPA
.ORG	24
	reti	;TIMER1_COMPB
.ORG	26
	reti	;TIMER1_OVF
.ORG	28
	reti	;TIMER0_COMPA
.ORG	30
	reti	;TIMER0_COMPB
.ORG	32
	reti	;TIMER0_OVF
.ORG	34
	reti	;SPI_STC
.ORG	36
	reti	;USART_RX
.ORG	38
	reti	;USART_UDRE
.ORG	40
	reti	;USART_TX
.ORG	42
	reti	;ADC
.ORG	44
	reti	;EE_READY
.ORG	46
	reti	;ANALOG_COMP
.ORG	48
	reti	;TWI
.ORG	50
	reti	;SPM_READY

;********************************************************************************

;Start of program memory page 0
.ORG	52
BASPROGRAMSTART:
;Initialise stack
	ldi	SysValueCopy,high(RAMEND)
	out	SPH, SysValueCopy
	ldi	SysValueCopy,low(RAMEND)
	out	SPL, SysValueCopy
;Call initialisation routines
	call	INITSYS
	call	INITUNO
	rcall	INITGLCD_ILI9341
	call	INITGLCD_SSD1289

;Start of the main program
;''A demonstration program for GCGB and GCB.
;''--------------------------------------------------------------------------------------------------------------------------------
;''This program is a simple GLCD demonstration of the GLCD capabilities.
;''It is a nice graphical LCD, suitable for a lot of various projects.
;''This program display a BMP file on the display and some text.
;'':
;'':
;''@author  EvanV
;''@licence GPL
;''@version 1.0
;''@date    03.04.2019
;''********************************************************************************
;Chip Settings.
;#define GLCD_TYPE GLCD_TYPE_ILI9341
;Pin mappings for 8bit bus
;#define GLCD_RD       ANALOG_0          ' read command line
;#define GLCD_WR       ANALOG_1          ' write command line
;#define GLCD_RS       ANALOG_2          ' Command/Data line
;#define GLCD_CS       ANALOG_3          ' Chip select line
;#define GLCD_RESET    ANALOG_4          ' Reset line
;#define GLCD_DB0       DIGITAL_8
;#define GLCD_DB1       DIGITAL_9
;#define GLCD_DB2       DIGITAL_2
;#define GLCD_DB3       DIGITAL_3
;#define GLCD_DB4       DIGITAL_4
;#define GLCD_DB5       DIGITAL_5
;#define GLCD_DB6       DIGITAL_6
;#define GLCD_DB7       DIGITAL_7
;main program start here
;#define DEFAULT_GLCDBACKGROUND TFT_WHITE     'change the default background color to white
;#define GLCD_OLED_FONT                       'select the OLED fonts
;Use standard methods to display picture and some text.
;DrawBMP_SSD1289 (30, 40, Image1)
	ldi	SysValueCopy,30
	sts	TFTXPOS,SysValueCopy
	ldi	SysValueCopy,0
	sts	TFTXPOS_H,SysValueCopy
	ldi	SysValueCopy,40
	sts	TFTYPOS,SysValueCopy
	ldi	SysValueCopy,0
	sts	TFTYPOS_H,SysValueCopy
	ldi	SysValueCopy,low(TABLEIMAGE1)
	sts	SELECTEDTABLE,SysValueCopy
	ldi	SysValueCopy,high(TABLEIMAGE1)
	sts	SELECTEDTABLE_H,SysValueCopy
	rcall	DRAWBMP
;GLCDfntDefaultsize = 2
	ldi	SysValueCopy,2
	sts	GLCDFNTDEFAULTSIZE,SysValueCopy
;GLCDPrint  80, 200, "ILI9341", TFT_RED
	ldi	SysValueCopy,80
	sts	PRINTLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCX_H,SysValueCopy
	ldi	SysValueCopy,200
	sts	PRINTLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM1)
	ldi	SysStringB_H,high(SYSSTRINGPARAM1)
	ldi	SysReadA,low(StringTable2<<1)
	ldi	SysReadA_H,high(StringTable2<<1)
	call	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM1)
	sts	SysLCDPRINTDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM1)
	sts	SysLCDPRINTDATAHandler_H,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINECOLOUR,SysValueCopy
	ldi	SysValueCopy,248
	sts	LINECOLOUR_H,SysValueCopy
	rcall	GLCDPRINT4
;GLCDPrint  5, 230, "UNO AVR Graphical LCD Shield", TFT_RED
	ldi	SysValueCopy,5
	sts	PRINTLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCX_H,SysValueCopy
	ldi	SysValueCopy,230
	sts	PRINTLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM1)
	ldi	SysStringB_H,high(SYSSTRINGPARAM1)
	ldi	SysReadA,low(StringTable3<<1)
	ldi	SysReadA_H,high(StringTable3<<1)
	call	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM1)
	sts	SysLCDPRINTDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM1)
	sts	SysLCDPRINTDATAHandler_H,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINECOLOUR,SysValueCopy
	ldi	SysValueCopy,248
	sts	LINECOLOUR_H,SysValueCopy
	rcall	GLCDPRINT4
;box 2,2, GLCD_WIDTH-3, GLCD_HEIGHT-3, TFT_BLACK
	ldi	SysValueCopy,2
	sts	LINEX1,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINEX1_H,SysValueCopy
	ldi	SysValueCopy,2
	sts	LINEY1,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINEY1_H,SysValueCopy
	ldi	SysValueCopy,237
	sts	LINEX2,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINEX2_H,SysValueCopy
	ldi	SysValueCopy,61
	sts	LINEY2,SysValueCopy
	ldi	SysValueCopy,1
	sts	LINEY2_H,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINECOLOUR,SysValueCopy
	sts	LINECOLOUR_H,SysValueCopy
	rcall	BOX
;box 1,1, GLCD_WIDTH-2, GLCD_HEIGHT-2, TFT_RED
	ldi	SysValueCopy,1
	sts	LINEX1,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINEX1_H,SysValueCopy
	ldi	SysValueCopy,1
	sts	LINEY1,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINEY1_H,SysValueCopy
	ldi	SysValueCopy,238
	sts	LINEX2,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINEX2_H,SysValueCopy
	ldi	SysValueCopy,62
	sts	LINEY2,SysValueCopy
	ldi	SysValueCopy,1
	sts	LINEY2_H,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINECOLOUR,SysValueCopy
	ldi	SysValueCopy,248
	sts	LINECOLOUR_H,SysValueCopy
	rcall	BOX
;box 0,0, GLCD_WIDTH-1, GLCD_HEIGHT-1, TFT_YELLOW
	ldi	SysValueCopy,0
	sts	LINEX1,SysValueCopy
	sts	LINEX1_H,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINEY1,SysValueCopy
	sts	LINEY1_H,SysValueCopy
	ldi	SysValueCopy,239
	sts	LINEX2,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINEX2_H,SysValueCopy
	ldi	SysValueCopy,63
	sts	LINEY2,SysValueCopy
	ldi	SysValueCopy,1
	sts	LINEY2_H,SysValueCopy
	ldi	SysValueCopy,224
	sts	LINECOLOUR,SysValueCopy
	ldi	SysValueCopy,255
	sts	LINECOLOUR_H,SysValueCopy
	rcall	BOX
;GLCDfntDefaultsize = 1
	ldi	SysValueCopy,1
	sts	GLCDFNTDEFAULTSIZE,SysValueCopy
;GLCDPrint 22, 309, "Great Cow BASIC a compiler for Microchip AVR & PIC", TFT_BLACK
	ldi	SysValueCopy,22
	sts	PRINTLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCX_H,SysValueCopy
	ldi	SysValueCopy,53
	sts	PRINTLOCY,SysValueCopy
	ldi	SysValueCopy,1
	sts	PRINTLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM1)
	ldi	SysStringB_H,high(SYSSTRINGPARAM1)
	ldi	SysReadA,low(StringTable4<<1)
	ldi	SysReadA_H,high(StringTable4<<1)
	call	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM1)
	sts	SysLCDPRINTDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM1)
	sts	SysLCDPRINTDATAHandler_H,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINECOLOUR,SysValueCopy
	sts	LINECOLOUR_H,SysValueCopy
	rcall	GLCDPRINT4
;GLCDPrint  196, 6, "April 2019", TFT_BLACK
	ldi	SysValueCopy,196
	sts	PRINTLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCX_H,SysValueCopy
	ldi	SysValueCopy,6
	sts	PRINTLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM1)
	ldi	SysStringB_H,high(SYSSTRINGPARAM1)
	ldi	SysReadA,low(StringTable5<<1)
	ldi	SysReadA_H,high(StringTable5<<1)
	call	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM1)
	sts	SysLCDPRINTDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM1)
	sts	SysLCDPRINTDATAHandler_H,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINECOLOUR,SysValueCopy
	sts	LINECOLOUR_H,SysValueCopy
	rcall	GLCDPRINT4
;loop forever
;do
SysDoLoop_S1:
;loop
	rjmp	SysDoLoop_S1
SysDoLoop_E1:
;#define InitGLCD_ILI9341 nop
;#define ST7920ReadDelay = 20
;#define ST7920WriteDelay = 2
;#define ILI9326_DataPort GLCD_DataPort
;#define ILI9326_GLCD_RST GLCD_RST
;#define ILI9326_GLCD_CS  GLCD_CS
;#define ILI9326_GLCD_RS  GLCD_RS
;#define ILI9326_GLCD_WR  GLCD_WR
;#define ILI9326_GLCD_RD  GLCD_RD
;#define ILI9486L_RST GLCD_RST
;#define ILI9486L_CS GLCD_CS
;#define ILI9486L_DC GLCD_DC
;#define ILI9486L_WR GLCD_WR
;#define ILI9486L_RD GLCD_RD
;#define ILI9486L_DB0 GLCD_DB0
;#define ILI9486L_DB1 GLCD_DB1
;#define ILI9486L_DB2 GLCD_DB2
;#define ILI9486L_DB3 GLCD_DB3
;#define ILI9486L_DB4 GLCD_DB4
;#define ILI9486L_DB5 GLCD_DB5
;#define ILI9486L_DB6 GLCD_DB6
;#define ILI9486L_DB7 GLCD_DB7
;#define ILI9486L_RST GLCD_RST
;#define ILI9486L_CS GLCD_CS
;#define ILI9486L_DC GLCD_DC
;#define ILI9486L_WR GLCD_WR
;#define ILI9486L_RD GLCD_RD
;#define tinyDelay nop:nop
;#define ILI9481_GLCD_RST GLCD_RST
;#define ILI9481_GLCD_CS GLCD_CS
;#define ILI9481_GLCD_RS GLCD_RS
;#define ILI9481_GLCD_WR GLCD_WR
;#define ILI9481_GLCD_RD GLCD_RD
;#define ILI9481_GLCD_DB0 GLCD_DB0
;#define ILI9481_GLCD_DB1 GLCD_DB1
;#define ILI9481_GLCD_DB2 GLCD_DB2
;#define ILI9481_GLCD_DB3 GLCD_DB3
;#define ILI9481_GLCD_DB4 GLCD_DB4
;#define ILI9481_GLCD_DB5 GLCD_DB5
;#define ILI9481_GLCD_DB6 GLCD_DB6
;#define ILI9481_GLCD_DB7 GLCD_DB7
;#define ILI9481_GLCD_RST GLCD_RST
;#define ILI9481_GLCD_CS GLCD_CS
;#define ILI9481_GLCD_RS GLCD_RS
;#define ILI9481_GLCD_WR GLCD_WR
;#define LCDON 4
;#define FLASHON 3
;#define FLASH 3
;#define CursorON 2
;#define FLASHOFF 0xFC   'an AND MASK
;#define CursorOFF 0xFD  'an AND MASK
;#define LCDOFF 0xFB     'an AND MASK
BASPROGRAMEND:
	sleep
	rjmp	BASPROGRAMEND

;********************************************************************************

BOX:
;dim GLCDTemp as word
;Make sure that starting point (1) is always less than end point (2)
;If LineX1 > LineX2 Then
	lds	SysWORDTempB,LINEX1
	lds	SysWORDTempB_H,LINEX1_H
	lds	SysWORDTempA,LINEX2
	lds	SysWORDTempA_H,LINEX2_H
	call	SysCompLessThan16
	sbrs	SysByteTempX,0
	rjmp	ENDIF4
;GLCDTemp = LineX1
	lds	SysValueCopy,LINEX1
	sts	GLCDTEMP,SysValueCopy
	lds	SysValueCopy,LINEX1_H
	sts	GLCDTEMP_H,SysValueCopy
;LineX1 = LineX2
	lds	SysValueCopy,LINEX2
	sts	LINEX1,SysValueCopy
	lds	SysValueCopy,LINEX2_H
	sts	LINEX1_H,SysValueCopy
;LineX2 = GLCDTemp
	lds	SysValueCopy,GLCDTEMP
	sts	LINEX2,SysValueCopy
	lds	SysValueCopy,GLCDTEMP_H
	sts	LINEX2_H,SysValueCopy
;End If
ENDIF4:
;If LineY1 > LineY2 Then
	lds	SysWORDTempB,LINEY1
	lds	SysWORDTempB_H,LINEY1_H
	lds	SysWORDTempA,LINEY2
	lds	SysWORDTempA_H,LINEY2_H
	call	SysCompLessThan16
	sbrs	SysByteTempX,0
	rjmp	ENDIF5
;GLCDTemp = LineY1
	lds	SysValueCopy,LINEY1
	sts	GLCDTEMP,SysValueCopy
	lds	SysValueCopy,LINEY1_H
	sts	GLCDTEMP_H,SysValueCopy
;LineY1 = LineY2
	lds	SysValueCopy,LINEY2
	sts	LINEY1,SysValueCopy
	lds	SysValueCopy,LINEY2_H
	sts	LINEY1_H,SysValueCopy
;LineY2 = GLCDTemp
	lds	SysValueCopy,GLCDTEMP
	sts	LINEY2,SysValueCopy
	lds	SysValueCopy,GLCDTEMP_H
	sts	LINEY2_H,SysValueCopy
;End If
ENDIF5:
;dim DrawLine as word
;Draw lines going across
;For DrawLine = LineX1 To LineX2
	lds	SysTemp1,LINEX1
	ldi	SysTemp3,1
	sub	SysTemp1,SysTemp3
	sts	DRAWLINE,SysTemp1
	lds	SysTemp1,LINEX1_H
	ldi	SysTemp3,0
	sbc	SysTemp1,SysTemp3
	sts	DRAWLINE_H,SysTemp1
	lds	SysWORDTempB,LINEX1
	lds	SysWORDTempB_H,LINEX1_H
	lds	SysWORDTempA,LINEX2
	lds	SysWORDTempA_H,LINEX2_H
	call	SysCompLessThan16
	sbrc	SysByteTempX,0
	rjmp	SysForLoopEnd2
ENDIF6:
SysForLoop2:
	lds	SysTemp1,DRAWLINE
	inc	SysTemp1
	sts	DRAWLINE,SysTemp1
	lds	SysTemp1,DRAWLINE_H
	brne	PC + 2
	inc	SysTemp1
	sts	DRAWLINE_H,SysTemp1
;PSet DrawLine, LineY1, LineColour
	lds	SysValueCopy,DRAWLINE
	sts	GLCDX,SysValueCopy
	lds	SysValueCopy,DRAWLINE_H
	sts	GLCDX_H,SysValueCopy
	lds	SysValueCopy,LINEY1
	sts	GLCDY,SysValueCopy
	lds	SysValueCopy,LINEY1_H
	sts	GLCDY_H,SysValueCopy
	lds	SysValueCopy,LINECOLOUR
	sts	GLCDCOLOUR,SysValueCopy
	lds	SysValueCopy,LINECOLOUR_H
	sts	GLCDCOLOUR_H,SysValueCopy
	call	PSET_ILI9341
;PSet DrawLine, LineY2, LineColour
	lds	SysValueCopy,DRAWLINE
	sts	GLCDX,SysValueCopy
	lds	SysValueCopy,DRAWLINE_H
	sts	GLCDX_H,SysValueCopy
	lds	SysValueCopy,LINEY2
	sts	GLCDY,SysValueCopy
	lds	SysValueCopy,LINEY2_H
	sts	GLCDY_H,SysValueCopy
	lds	SysValueCopy,LINECOLOUR
	sts	GLCDCOLOUR,SysValueCopy
	lds	SysValueCopy,LINECOLOUR_H
	sts	GLCDCOLOUR_H,SysValueCopy
	call	PSET_ILI9341
;Next
	lds	SysWORDTempA,DRAWLINE
	lds	SysWORDTempA_H,DRAWLINE_H
	lds	SysWORDTempB,LINEX2
	lds	SysWORDTempB_H,LINEX2_H
	call	SysCompLessThan16
	sbrc	SysByteTempX,0
	rjmp	SysForLoop2
ENDIF7:
SysForLoopEnd2:
;Draw lines going down
;For DrawLine = LineY1 To LineY2
	lds	SysTemp1,LINEY1
	ldi	SysTemp3,1
	sub	SysTemp1,SysTemp3
	sts	DRAWLINE,SysTemp1
	lds	SysTemp1,LINEY1_H
	ldi	SysTemp3,0
	sbc	SysTemp1,SysTemp3
	sts	DRAWLINE_H,SysTemp1
	lds	SysWORDTempB,LINEY1
	lds	SysWORDTempB_H,LINEY1_H
	lds	SysWORDTempA,LINEY2
	lds	SysWORDTempA_H,LINEY2_H
	call	SysCompLessThan16
	sbrc	SysByteTempX,0
	rjmp	SysForLoopEnd3
ENDIF8:
SysForLoop3:
	lds	SysTemp1,DRAWLINE
	inc	SysTemp1
	sts	DRAWLINE,SysTemp1
	lds	SysTemp1,DRAWLINE_H
	brne	PC + 2
	inc	SysTemp1
	sts	DRAWLINE_H,SysTemp1
;PSet LineX1, DrawLine, LineColour
	lds	SysValueCopy,LINEX1
	sts	GLCDX,SysValueCopy
	lds	SysValueCopy,LINEX1_H
	sts	GLCDX_H,SysValueCopy
	lds	SysValueCopy,DRAWLINE
	sts	GLCDY,SysValueCopy
	lds	SysValueCopy,DRAWLINE_H
	sts	GLCDY_H,SysValueCopy
	lds	SysValueCopy,LINECOLOUR
	sts	GLCDCOLOUR,SysValueCopy
	lds	SysValueCopy,LINECOLOUR_H
	sts	GLCDCOLOUR_H,SysValueCopy
	call	PSET_ILI9341
;PSet LineX2, DrawLine, LineColour
	lds	SysValueCopy,LINEX2
	sts	GLCDX,SysValueCopy
	lds	SysValueCopy,LINEX2_H
	sts	GLCDX_H,SysValueCopy
	lds	SysValueCopy,DRAWLINE
	sts	GLCDY,SysValueCopy
	lds	SysValueCopy,DRAWLINE_H
	sts	GLCDY_H,SysValueCopy
	lds	SysValueCopy,LINECOLOUR
	sts	GLCDCOLOUR,SysValueCopy
	lds	SysValueCopy,LINECOLOUR_H
	sts	GLCDCOLOUR_H,SysValueCopy
	call	PSET_ILI9341
;Next
	lds	SysWORDTempA,DRAWLINE
	lds	SysWORDTempA_H,DRAWLINE_H
	lds	SysWORDTempB,LINEY2
	lds	SysWORDTempB_H,LINEY2_H
	call	SysCompLessThan16
	sbrc	SysByteTempX,0
	rjmp	SysForLoop3
ENDIF9:
SysForLoopEnd3:
	ret

;********************************************************************************

DRAWBMP:
;Dim TableReadPosition, TableLen, SelectedTable as word
;Start of code
;Dim  PixelRGB , XCount, YCount, TFTYEnd, objwidth, objHeight, TableReadPosition, TFTX , TFTY as Word
;TableReadPosition = 1
	ldi	SysValueCopy,1
	sts	TABLEREADPOSITION,SysValueCopy
	ldi	SysValueCopy,0
	sts	TABLEREADPOSITION_H,SysValueCopy
;Read selected table
;Select Case SelectedTable
;Case @TableImage1: ReadTable TableImage1, TableReadPosition, objwidth
SysSelect1Case1:
	lds	SysWORDTempA,SELECTEDTABLE
	lds	SysWORDTempA_H,SELECTEDTABLE_H
	ldi	SysWORDTempB,low(TABLEIMAGE1)
	ldi	SysWORDTempB_H,high(TABLEIMAGE1)
	call	SysCompEqual16
	sbrs	SysByteTempX,0
	rjmp	SysSelect1Case2
	lds	SYSSTRINGA,TABLEREADPOSITION
	lds	SYSSTRINGA_H,TABLEREADPOSITION_H
	call	TABLEIMAGE1
	sts	OBJWIDTH,SysByteTempX
	lds	SYSSTRINGA,TABLEREADPOSITION
	lds	SYSSTRINGA_H,TABLEREADPOSITION_H
	call	TABLEIMAGE1_H
	sts	OBJWIDTH_H,SysByteTempX
;TableReadPosition++
	lds	SysTemp1,TABLEREADPOSITION
	inc	SysTemp1
	sts	TABLEREADPOSITION,SysTemp1
	lds	SysTemp1,TABLEREADPOSITION_H
	brne	PC + 2
	inc	SysTemp1
	sts	TABLEREADPOSITION_H,SysTemp1
;ReadTable TableImage1, TableReadPosition, objHeight
	lds	SYSSTRINGA,TABLEREADPOSITION
	lds	SYSSTRINGA_H,TABLEREADPOSITION_H
	call	TABLEIMAGE1
	sts	OBJHEIGHT,SysByteTempX
	lds	SYSSTRINGA,TABLEREADPOSITION
	lds	SYSSTRINGA_H,TABLEREADPOSITION_H
	call	TABLEIMAGE1_H
	sts	OBJHEIGHT_H,SysByteTempX
;Case @TableImage2: ReadTable TableImage2, TableReadPosition, objwidth
	rjmp	SysSelectEnd1
SysSelect1Case2:
	lds	SysWORDTempA,SELECTEDTABLE
	lds	SysWORDTempA_H,SELECTEDTABLE_H
	ldi	SysWORDTempB,low(TABLEIMAGE2)
	ldi	SysWORDTempB_H,high(TABLEIMAGE2)
	call	SysCompEqual16
	sbrs	SysByteTempX,0
	rjmp	SysSelect1Case3
	lds	SYSSTRINGA,TABLEREADPOSITION
	call	TABLEIMAGE2
	sts	OBJWIDTH,SysByteTempX
	ldi	SysValueCopy,0
	sts	OBJWIDTH_H,SysValueCopy
;TableReadPosition++
	lds	SysTemp1,TABLEREADPOSITION
	inc	SysTemp1
	sts	TABLEREADPOSITION,SysTemp1
	lds	SysTemp1,TABLEREADPOSITION_H
	brne	PC + 2
	inc	SysTemp1
	sts	TABLEREADPOSITION_H,SysTemp1
;ReadTable TableImage2, TableReadPosition, objHeight
	lds	SYSSTRINGA,TABLEREADPOSITION
	call	TABLEIMAGE2
	sts	OBJHEIGHT,SysByteTempX
	ldi	SysValueCopy,0
	sts	OBJHEIGHT_H,SysValueCopy
;Case @TableImage3: ReadTable TableImage3, TableReadPosition, objwidth
	rjmp	SysSelectEnd1
SysSelect1Case3:
	lds	SysWORDTempA,SELECTEDTABLE
	lds	SysWORDTempA_H,SELECTEDTABLE_H
	ldi	SysWORDTempB,low(TABLEIMAGE3)
	ldi	SysWORDTempB_H,high(TABLEIMAGE3)
	call	SysCompEqual16
	sbrs	SysByteTempX,0
	rjmp	SysSelect1Case4
	lds	SYSSTRINGA,TABLEREADPOSITION
	call	TABLEIMAGE3
	sts	OBJWIDTH,SysByteTempX
	ldi	SysValueCopy,0
	sts	OBJWIDTH_H,SysValueCopy
;TableReadPosition++
	lds	SysTemp1,TABLEREADPOSITION
	inc	SysTemp1
	sts	TABLEREADPOSITION,SysTemp1
	lds	SysTemp1,TABLEREADPOSITION_H
	brne	PC + 2
	inc	SysTemp1
	sts	TABLEREADPOSITION_H,SysTemp1
;ReadTable TableImage3, TableReadPosition, objHeight
	lds	SYSSTRINGA,TABLEREADPOSITION
	call	TABLEIMAGE3
	sts	OBJHEIGHT,SysByteTempX
	ldi	SysValueCopy,0
	sts	OBJHEIGHT_H,SysValueCopy
;Case @TableImage4: ReadTable TableImage4, TableReadPosition, objwidth
	rjmp	SysSelectEnd1
SysSelect1Case4:
	lds	SysWORDTempA,SELECTEDTABLE
	lds	SysWORDTempA_H,SELECTEDTABLE_H
	ldi	SysWORDTempB,low(TABLEIMAGE4)
	ldi	SysWORDTempB_H,high(TABLEIMAGE4)
	call	SysCompEqual16
	sbrs	SysByteTempX,0
	rjmp	SysSelect1Case5
	lds	SYSSTRINGA,TABLEREADPOSITION
	call	TABLEIMAGE4
	sts	OBJWIDTH,SysByteTempX
	ldi	SysValueCopy,0
	sts	OBJWIDTH_H,SysValueCopy
;TableReadPosition++
	lds	SysTemp1,TABLEREADPOSITION
	inc	SysTemp1
	sts	TABLEREADPOSITION,SysTemp1
	lds	SysTemp1,TABLEREADPOSITION_H
	brne	PC + 2
	inc	SysTemp1
	sts	TABLEREADPOSITION_H,SysTemp1
;ReadTable TableImage4, TableReadPosition, objHeight
	lds	SYSSTRINGA,TABLEREADPOSITION
	call	TABLEIMAGE4
	sts	OBJHEIGHT,SysByteTempX
	ldi	SysValueCopy,0
	sts	OBJHEIGHT_H,SysValueCopy
;Case @TableImage5: ReadTable TableImage5, TableReadPosition, objwidth
	rjmp	SysSelectEnd1
SysSelect1Case5:
	lds	SysWORDTempA,SELECTEDTABLE
	lds	SysWORDTempA_H,SELECTEDTABLE_H
	ldi	SysWORDTempB,low(TABLEIMAGE5)
	ldi	SysWORDTempB_H,high(TABLEIMAGE5)
	call	SysCompEqual16
	sbrs	SysByteTempX,0
	rjmp	SysSelectEnd1
	lds	SYSSTRINGA,TABLEREADPOSITION
	call	TABLEIMAGE5
	sts	OBJWIDTH,SysByteTempX
	ldi	SysValueCopy,0
	sts	OBJWIDTH_H,SysValueCopy
;TableReadPosition++
	lds	SysTemp1,TABLEREADPOSITION
	inc	SysTemp1
	sts	TABLEREADPOSITION,SysTemp1
	lds	SysTemp1,TABLEREADPOSITION_H
	brne	PC + 2
	inc	SysTemp1
	sts	TABLEREADPOSITION_H,SysTemp1
;ReadTable TableImage5, TableReadPosition, objHeight
	lds	SYSSTRINGA,TABLEREADPOSITION
	call	TABLEIMAGE5
	sts	OBJHEIGHT,SysByteTempX
	ldi	SysValueCopy,0
	sts	OBJHEIGHT_H,SysValueCopy
;End Select
SysSelectEnd1:
;TableReadPosition = 3
	ldi	SysValueCopy,3
	sts	TABLEREADPOSITION,SysValueCopy
	ldi	SysValueCopy,0
	sts	TABLEREADPOSITION_H,SysValueCopy
;For YCount = 0 to (objHeight - 1)
	ldi	SysValueCopy,255
	sts	YCOUNT,SysValueCopy
	sts	YCOUNT_H,SysValueCopy
	lds	SysTemp2,OBJHEIGHT
	ldi	SysTemp3,1
	sub	SysTemp2,SysTemp3
	mov	SysTemp1,SysTemp2
	lds	SysTemp2,OBJHEIGHT_H
	ldi	SysTemp3,0
	sbc	SysTemp2,SysTemp3
	mov	SysTemp1_H,SysTemp2
	ldi	SysWORDTempB,0
	ldi	SysWORDTempB_H,0
	mov	SysWORDTempA,SysTemp1
	mov	SysWORDTempA_H,SysTemp1_H
	call	SysCompLessThan16
	sbrc	SysByteTempX,0
	rjmp	SysForLoopEnd4
ENDIF10:
SysForLoop4:
	lds	SysTemp1,YCOUNT
	inc	SysTemp1
	sts	YCOUNT,SysTemp1
	lds	SysTemp1,YCOUNT_H
	brne	PC + 2
	inc	SysTemp1
	sts	YCOUNT_H,SysTemp1
;For XCount = 0 to (objwidth - 1)
	ldi	SysValueCopy,255
	sts	XCOUNT,SysValueCopy
	sts	XCOUNT_H,SysValueCopy
	lds	SysTemp2,OBJWIDTH
	ldi	SysTemp3,1
	sub	SysTemp2,SysTemp3
	mov	SysTemp1,SysTemp2
	lds	SysTemp2,OBJWIDTH_H
	ldi	SysTemp3,0
	sbc	SysTemp2,SysTemp3
	mov	SysTemp1_H,SysTemp2
	ldi	SysWORDTempB,0
	ldi	SysWORDTempB_H,0
	mov	SysWORDTempA,SysTemp1
	mov	SysWORDTempA_H,SysTemp1_H
	call	SysCompLessThan16
	sbrc	SysByteTempX,0
	rjmp	SysForLoopEnd5
ENDIF11:
SysForLoop5:
	lds	SysTemp1,XCOUNT
	inc	SysTemp1
	sts	XCOUNT,SysTemp1
	lds	SysTemp1,XCOUNT_H
	brne	PC + 2
	inc	SysTemp1
	sts	XCOUNT_H,SysTemp1
;Read selected table
;Select Case SelectedTable
;Case @TableImage1: ReadTable TableImage1, TableReadPosition, PixelRGB
SysSelect2Case1:
	lds	SysWORDTempA,SELECTEDTABLE
	lds	SysWORDTempA_H,SELECTEDTABLE_H
	ldi	SysWORDTempB,low(TABLEIMAGE1)
	ldi	SysWORDTempB_H,high(TABLEIMAGE1)
	call	SysCompEqual16
	sbrs	SysByteTempX,0
	rjmp	SysSelect2Case2
	lds	SYSSTRINGA,TABLEREADPOSITION
	lds	SYSSTRINGA_H,TABLEREADPOSITION_H
	call	TABLEIMAGE1
	sts	PIXELRGB,SysByteTempX
	lds	SYSSTRINGA,TABLEREADPOSITION
	lds	SYSSTRINGA_H,TABLEREADPOSITION_H
	call	TABLEIMAGE1_H
	sts	PIXELRGB_H,SysByteTempX
;Case @TableImage2: ReadTable TableImage2, TableReadPosition, PixelRGB
	rjmp	SysSelectEnd2
SysSelect2Case2:
	lds	SysWORDTempA,SELECTEDTABLE
	lds	SysWORDTempA_H,SELECTEDTABLE_H
	ldi	SysWORDTempB,low(TABLEIMAGE2)
	ldi	SysWORDTempB_H,high(TABLEIMAGE2)
	call	SysCompEqual16
	sbrs	SysByteTempX,0
	rjmp	SysSelect2Case3
	lds	SYSSTRINGA,TABLEREADPOSITION
	call	TABLEIMAGE2
	sts	PIXELRGB,SysByteTempX
	ldi	SysValueCopy,0
	sts	PIXELRGB_H,SysValueCopy
;Case @TableImage3: ReadTable TableImage3, TableReadPosition, PixelRGB
	rjmp	SysSelectEnd2
SysSelect2Case3:
	lds	SysWORDTempA,SELECTEDTABLE
	lds	SysWORDTempA_H,SELECTEDTABLE_H
	ldi	SysWORDTempB,low(TABLEIMAGE3)
	ldi	SysWORDTempB_H,high(TABLEIMAGE3)
	call	SysCompEqual16
	sbrs	SysByteTempX,0
	rjmp	SysSelect2Case4
	lds	SYSSTRINGA,TABLEREADPOSITION
	call	TABLEIMAGE3
	sts	PIXELRGB,SysByteTempX
	ldi	SysValueCopy,0
	sts	PIXELRGB_H,SysValueCopy
;Case @TableImage4: ReadTable TableImage4, TableReadPosition, PixelRGB
	rjmp	SysSelectEnd2
SysSelect2Case4:
	lds	SysWORDTempA,SELECTEDTABLE
	lds	SysWORDTempA_H,SELECTEDTABLE_H
	ldi	SysWORDTempB,low(TABLEIMAGE4)
	ldi	SysWORDTempB_H,high(TABLEIMAGE4)
	call	SysCompEqual16
	sbrs	SysByteTempX,0
	rjmp	SysSelect2Case5
	lds	SYSSTRINGA,TABLEREADPOSITION
	call	TABLEIMAGE4
	sts	PIXELRGB,SysByteTempX
	ldi	SysValueCopy,0
	sts	PIXELRGB_H,SysValueCopy
;Case @TableImage5: ReadTable TableImage5, TableReadPosition, PixelRGB
	rjmp	SysSelectEnd2
SysSelect2Case5:
	lds	SysWORDTempA,SELECTEDTABLE
	lds	SysWORDTempA_H,SELECTEDTABLE_H
	ldi	SysWORDTempB,low(TABLEIMAGE5)
	ldi	SysWORDTempB_H,high(TABLEIMAGE5)
	call	SysCompEqual16
	sbrs	SysByteTempX,0
	rjmp	SysSelectEnd2
	lds	SYSSTRINGA,TABLEREADPOSITION
	call	TABLEIMAGE5
	sts	PIXELRGB,SysByteTempX
	ldi	SysValueCopy,0
	sts	PIXELRGB_H,SysValueCopy
;End Select
SysSelectEnd2:
;TableReadPosition++
	lds	SysTemp1,TABLEREADPOSITION
	inc	SysTemp1
	sts	TABLEREADPOSITION,SysTemp1
	lds	SysTemp1,TABLEREADPOSITION_H
	brne	PC + 2
	inc	SysTemp1
	sts	TABLEREADPOSITION_H,SysTemp1
;TFTX=[Word]TFTXPos+XCount
	lds	SysTemp1,TFTXPOS
	lds	SysTemp2,XCOUNT
	add	SysTemp1,SysTemp2
	sts	TFTX,SysTemp1
	lds	SysTemp1,TFTXPOS_H
	lds	SysTemp2,XCOUNT_H
	adc	SysTemp1,SysTemp2
	sts	TFTX_H,SysTemp1
;TFTY=[Word]TFTYPos+YCount
	lds	SysTemp1,TFTYPOS
	lds	SysTemp2,YCOUNT
	add	SysTemp1,SysTemp2
	sts	TFTY,SysTemp1
	lds	SysTemp1,TFTYPOS_H
	lds	SysTemp2,YCOUNT_H
	adc	SysTemp1,SysTemp2
	sts	TFTY_H,SysTemp1
;PSet TFTX, TFTY, PixelRGB
	lds	SysValueCopy,TFTX
	sts	GLCDX,SysValueCopy
	lds	SysValueCopy,TFTX_H
	sts	GLCDX_H,SysValueCopy
	lds	SysValueCopy,TFTY
	sts	GLCDY,SysValueCopy
	lds	SysValueCopy,TFTY_H
	sts	GLCDY_H,SysValueCopy
	lds	SysValueCopy,PIXELRGB
	sts	GLCDCOLOUR,SysValueCopy
	lds	SysValueCopy,PIXELRGB_H
	sts	GLCDCOLOUR_H,SysValueCopy
	call	PSET_ILI9341
;Next
	lds	SysTemp2,OBJWIDTH
	ldi	SysTemp3,1
	sub	SysTemp2,SysTemp3
	mov	SysTemp1,SysTemp2
	lds	SysTemp2,OBJWIDTH_H
	ldi	SysTemp3,0
	sbc	SysTemp2,SysTemp3
	mov	SysTemp1_H,SysTemp2
	lds	SysWORDTempA,XCOUNT
	lds	SysWORDTempA_H,XCOUNT_H
	mov	SysWORDTempB,SysTemp1
	mov	SysWORDTempB_H,SysTemp1_H
	call	SysCompLessThan16
	sbrc	SysByteTempX,0
	rjmp	SysForLoop5
ENDIF12:
SysForLoopEnd5:
;Next
	lds	SysTemp2,OBJHEIGHT
	ldi	SysTemp3,1
	sub	SysTemp2,SysTemp3
	mov	SysTemp1,SysTemp2
	lds	SysTemp2,OBJHEIGHT_H
	ldi	SysTemp3,0
	sbc	SysTemp2,SysTemp3
	mov	SysTemp1_H,SysTemp2
	lds	SysWORDTempA,YCOUNT
	lds	SysWORDTempA_H,YCOUNT_H
	mov	SysWORDTempB,SysTemp1
	mov	SysWORDTempB_H,SysTemp1_H
	call	SysCompLessThan16
	sbrc	SysByteTempX,0
	rjmp	SysForLoop4
ENDIF13:
SysForLoopEnd4:
	ret

;********************************************************************************

Delay_MS:
	inc	SysWaitTempMS_H
DMS_START:
	ldi	DELAYTEMP2,254
DMS_OUTER:
	ldi	DELAYTEMP,20
DMS_INNER:
	dec	DELAYTEMP
	brne	DMS_INNER
	dec	DELAYTEMP2
	brne	DMS_OUTER
	dec	SysWaitTempMS
	brne	DMS_START
	dec	SysWaitTempMS_H
	brne	DMS_START
	ret

;********************************************************************************

GLCDCLS_ILI9341:
;dim ILI9341SendWord as word
;initialise global variable. Required variable for Circle in all DEVICE DRIVERS- DO NOT DELETE
;GLCD_yordinate = 0
	ldi	SysValueCopy,0
	sts	GLCD_YORDINATE,SysValueCopy
	sts	GLCD_YORDINATE_H,SysValueCopy
;SetAddressWindow_ILI9341 ( 0, 0, ILI9341_GLCD_WIDTH -1 , ILI9341_GLCD_HEIGHT-1 )
	ldi	SysValueCopy,0
	sts	_X1,SysValueCopy
	sts	_X1_H,SysValueCopy
	ldi	SysValueCopy,0
	sts	_Y1,SysValueCopy
	sts	_Y1_H,SysValueCopy
	lds	SysTemp4,GLCDDEVICEWIDTH
	ldi	SysTemp3,1
	sub	SysTemp4,SysTemp3
	sts	_X2,SysTemp4
	lds	SysTemp4,GLCDDEVICEWIDTH_H
	ldi	SysTemp3,0
	sbc	SysTemp4,SysTemp3
	sts	_X2_H,SysTemp4
	lds	SysTemp4,GLCDDEVICEHEIGHT
	ldi	SysTemp3,1
	sub	SysTemp4,SysTemp3
	sts	_Y2,SysTemp4
	lds	SysTemp4,GLCDDEVICEHEIGHT_H
	ldi	SysTemp3,0
	sbc	SysTemp4,SysTemp3
	sts	_Y2_H,SysTemp4
	call	SETADDRESSWINDOW_ILI9341
;ILI9341SendWord = GLCDBACKGROUND
	lds	SysValueCopy,GLCDBACKGROUND
	sts	ILI9341SENDWORD,SysValueCopy
	lds	SysValueCopy,GLCDBACKGROUND_H
	sts	ILI9341SENDWORD_H,SysValueCopy
;ILI9341_CS = 0
	cbi	PORTC,3
;8bit mode
;ILI9341_RS = 1
	sbi	PORTC,2
;ILI9341_RD = 1
	sbi	PORTC,0
;repeat 320*240 times... this is faster!
;repeat 2 ' ILI9341_GLCD_WIDTH
	ldi	SysValueCopy,2
	sts	SysRepeatTemp1,SysValueCopy
SysRepeatLoop1:
;repeat 38400  'ILI9341_GLCD_HEIGHT
	ldi	SysValueCopy,0
	sts	SysRepeatTemp2,SysValueCopy
	ldi	SysValueCopy,150
	sts	SysRepeatTemp2_H,SysValueCopy
SysRepeatLoop2:
;ILI9341_WR = 1
	sbi	PORTC,1
;PORTD = (PORTD & 0B00000011) | ((ILI9341SendWord_h) & 0B11111100)
	ldi	SysTemp3,3
	in	SysTemp1,PORTD
	and	SysTemp1,SysTemp3
	mov	SysTemp4,SysTemp1
	ldi	SysTemp3,252
	lds	SysTemp2,ILI9341SENDWORD_H
	and	SysTemp2,SysTemp3
	mov	SysTemp1,SysTemp2
	or	SysTemp1,SysTemp4
	out	PORTD,SysTemp1
;PORTB = (PORTB & 0B11111100) | ((ILI9341SendWord_h) & 0B00000011)
	ldi	SysTemp3,252
	in	SysTemp1,PORTB
	and	SysTemp1,SysTemp3
	mov	SysTemp4,SysTemp1
	ldi	SysTemp3,3
	lds	SysTemp2,ILI9341SENDWORD_H
	and	SysTemp2,SysTemp3
	mov	SysTemp1,SysTemp2
	or	SysTemp1,SysTemp4
	out	PORTB,SysTemp1
;ILI9341_WR = 0
	cbi	PORTC,1
;ILI9341_WR = 1
	sbi	PORTC,1
;PORTD = (PORTD & 0B00000011) | ((ILI9341SendWord) & 0B11111100)
	ldi	SysTemp3,3
	in	SysTemp1,PORTD
	and	SysTemp1,SysTemp3
	mov	SysTemp4,SysTemp1
	ldi	SysTemp3,252
	lds	SysTemp2,ILI9341SENDWORD
	and	SysTemp2,SysTemp3
	mov	SysTemp1,SysTemp2
	ldi	SysValueCopy,0
	mov	SysTemp1_H,SysValueCopy
	or	SysTemp1,SysTemp4
	out	PORTD,SysTemp1
;PORTB = (PORTB & 0B11111100) | ((ILI9341SendWord) & 0B00000011)
	ldi	SysTemp3,252
	in	SysTemp1,PORTB
	and	SysTemp1,SysTemp3
	mov	SysTemp4,SysTemp1
	ldi	SysTemp3,3
	lds	SysTemp2,ILI9341SENDWORD
	and	SysTemp2,SysTemp3
	mov	SysTemp1,SysTemp2
	ldi	SysValueCopy,0
	mov	SysTemp1_H,SysValueCopy
	or	SysTemp1,SysTemp4
	out	PORTB,SysTemp1
;ILI9341_WR = 0
	cbi	PORTC,1
;endif 8bit
;end repeat
	lds	SysTemp1,SysRepeatTemp2
	lds	SysTemp1_H,SysRepeatTemp2_H
	dec	SysTemp1
	sts	SysRepeatTemp2,SysTemp1
	brne	SysRepeatLoop2
	dec	SysTemp1_H
	sts	SysRepeatTemp2_H,SysTemp1_H
	breq	PC + 2
	rjmp	SysRepeatLoop2
SysRepeatLoopEnd2:
;end repeat
	lds	SysTemp4,SysRepeatTemp1
	dec	SysTemp4
	sts	SysRepeatTemp1,SysTemp4
	breq	PC + 2
	rjmp	SysRepeatLoop1
SysRepeatLoopEnd1:
;ILI9341_CS = 1
	sbi	PORTC,3
;8bit mode
;ILI9341_WR = 1
	sbi	PORTC,1
;PORTD = (PORTD & 0B00000011) | ((ILI9341SendWord_h) & 0B11111100)
	ldi	SysTemp3,3
	in	SysTemp1,PORTD
	and	SysTemp1,SysTemp3
	mov	SysTemp4,SysTemp1
	ldi	SysTemp3,252
	lds	SysTemp2,ILI9341SENDWORD_H
	and	SysTemp2,SysTemp3
	mov	SysTemp1,SysTemp2
	or	SysTemp1,SysTemp4
	out	PORTD,SysTemp1
;PORTB = (PORTB & 0B11111100) | ((ILI9341SendWord_h) & 0B00000011)
	ldi	SysTemp3,252
	in	SysTemp1,PORTB
	and	SysTemp1,SysTemp3
	mov	SysTemp4,SysTemp1
	ldi	SysTemp3,3
	lds	SysTemp2,ILI9341SENDWORD_H
	and	SysTemp2,SysTemp3
	mov	SysTemp1,SysTemp2
	or	SysTemp1,SysTemp4
	out	PORTB,SysTemp1
;ILI9341_WR = 0
	cbi	PORTC,1
;ILI9341_WR = 1
	sbi	PORTC,1
;PORTD = (PORTD & 0B00000011) | ((ILI9341SendWord) & 0B11111100)
	ldi	SysTemp3,3
	in	SysTemp1,PORTD
	and	SysTemp1,SysTemp3
	mov	SysTemp4,SysTemp1
	ldi	SysTemp3,252
	lds	SysTemp2,ILI9341SENDWORD
	and	SysTemp2,SysTemp3
	mov	SysTemp1,SysTemp2
	ldi	SysValueCopy,0
	mov	SysTemp1_H,SysValueCopy
	or	SysTemp1,SysTemp4
	out	PORTD,SysTemp1
;PORTB = (PORTB & 0B11111100) | ((ILI9341SendWord) & 0B00000011)
	ldi	SysTemp3,252
	in	SysTemp1,PORTB
	and	SysTemp1,SysTemp3
	mov	SysTemp4,SysTemp1
	ldi	SysTemp3,3
	lds	SysTemp2,ILI9341SENDWORD
	and	SysTemp2,SysTemp3
	mov	SysTemp1,SysTemp2
	ldi	SysValueCopy,0
	mov	SysTemp1_H,SysValueCopy
	or	SysTemp1,SysTemp4
	out	PORTB,SysTemp1
;ILI9341_WR = 0
	cbi	PORTC,1
;ILI9341_WR = 1
	sbi	PORTC,1
	ret

;********************************************************************************

GLCDDRAWCHAR_ILI9341:
;This has got a tad complex
;We have three major pieces
;1 The preamble - this just adjusted color and the input character
;2 The code that deals with GCB fontset
;3 The code that deals with OLED fontset
;
;You can make independent change to section 2 and 3 but they are mutual exclusive with many common pieces
;dim CharCol, CharRow, GLCDTemp as word
;CharCode -= 15
	lds	SysTemp1,CHARCODE
	ldi	SysTemp3,15
	sub	SysTemp1,SysTemp3
	sts	CHARCODE,SysTemp1
;CharCol=0
	ldi	SysValueCopy,0
	sts	CHARCOL,SysValueCopy
	sts	CHARCOL_H,SysValueCopy
;Calculate the pointer to the OLED fonts.
;These fonts are not multiple tables one is a straight list the other is a lookup table with data.
;Dim LocalCharCode as word
;Get key information and set up the fonts parameters
;Select case GLCDfntDefaultSize
;case 1 'This font is two font tables of an index and data
SysSelect3Case1:
	lds	SysCalcTempA,GLCDFNTDEFAULTSIZE
	cpi	SysCalcTempA,1
	brne	SysSelect3Case2
;CharCode = CharCode - 16
	lds	SysTemp1,CHARCODE
	ldi	SysTemp3,16
	sub	SysTemp1,SysTemp3
	sts	CHARCODE,SysTemp1
;ReadTable OLEDFont1Index, CharCode, LocalCharCode
	lds	SYSSTRINGA,CHARCODE
	rcall	OLEDFONT1INDEX
	sts	LOCALCHARCODE,SysByteTempX
	lds	SYSSTRINGA,CHARCODE
	rcall	OLEDFONT1INDEX_H
	sts	LOCALCHARCODE_H,SysByteTempX
;ReadTable OLEDFont1Data, LocalCharCode , COLSperfont
	lds	SYSSTRINGA,LOCALCHARCODE
	lds	SYSSTRINGA_H,LOCALCHARCODE_H
	rcall	OLEDFONT1DATA
	sts	COLSPERFONT,SysByteTempX
;GLCDFontWidth = COLSperfont + 1
	lds	SysTemp1,COLSPERFONT
	inc	SysTemp1
	sts	GLCDFONTWIDTH,SysTemp1
;ROWSperfont = 7  'which is really 8 as we start at 0
	ldi	SysValueCopy,7
	sts	ROWSPERFONT,SysValueCopy
;case 2 'This is one font table
	rjmp	SysSelectEnd3
SysSelect3Case2:
	lds	SysCalcTempA,GLCDFNTDEFAULTSIZE
	cpi	SysCalcTempA,2
	brne	SysSelectEnd3
;CharCode = CharCode - 17
	lds	SysTemp1,CHARCODE
	ldi	SysTemp3,17
	sub	SysTemp1,SysTemp3
	sts	CHARCODE,SysTemp1
;Pointer to table of font elements
;LocalCharCode = (CharCode * 20)
	lds	SysWORDTempA,CHARCODE
	ldi	SysWORDTempA_H,0
	ldi	SysWORDTempB,20
	ldi	SysWORDTempB_H,0
	call	SysMultSub16
	sts	LOCALCHARCODE,SysWORDTempX
	sts	LOCALCHARCODE_H,SysWORDTempX_H
;COLSperfont = 9  'which is really 10 as we start at 0
	ldi	SysValueCopy,9
	sts	COLSPERFONT,SysValueCopy
;ROWSperfont=15  'which is really 16 as we start at 0
	ldi	SysValueCopy,15
	sts	ROWSPERFONT,SysValueCopy
;End Select
SysSelectEnd3:
;The main loop - loop throught the number of columns
;For CurrCharCol = 0 to COLSperfont  'number of columns in the font , with two row of data
	ldi	SysValueCopy,255
	sts	CURRCHARCOL,SysValueCopy
	lds	SysCalcTempA,COLSPERFONT
	cpi	SysCalcTempA,0
	brsh	ENDIF14
	rjmp	SysForLoopEnd6
ENDIF14:
SysForLoop6:
	lds	SysTemp1,CURRCHARCOL
	inc	SysTemp1
	sts	CURRCHARCOL,SysTemp1
;Index the pointer to the code that we are looking for as we need to do this lookup many times getting more font data
;LocalCharCode++
	lds	SysTemp1,LOCALCHARCODE
	inc	SysTemp1
	sts	LOCALCHARCODE,SysTemp1
	lds	SysTemp1,LOCALCHARCODE_H
	brne	PC + 2
	inc	SysTemp1
	sts	LOCALCHARCODE_H,SysTemp1
;Select case GLCDfntDefaultSize
;case 1
SysSelect4Case1:
	lds	SysCalcTempA,GLCDFNTDEFAULTSIZE
	cpi	SysCalcTempA,1
	brne	SysSelect4Case2
;ReadTable OLEDFont1Data, LocalCharCode, CurrCharVal
	lds	SYSSTRINGA,LOCALCHARCODE
	lds	SYSSTRINGA_H,LOCALCHARCODE_H
	rcall	OLEDFONT1DATA
	sts	CURRCHARVAL,SysByteTempX
;case 2
	rjmp	SysSelectEnd4
SysSelect4Case2:
	lds	SysCalcTempA,GLCDFNTDEFAULTSIZE
	cpi	SysCalcTempA,2
	brne	SysSelectEnd4
;Read this 20 times... (0..COLSperfont) [ * 2 ]
;ReadTable OLEDFont2, LocalCharCode, CurrCharVal
	lds	SYSSTRINGA,LOCALCHARCODE
	lds	SYSSTRINGA_H,LOCALCHARCODE_H
	rcall	OLEDFONT2
	sts	CURRCHARVAL,SysByteTempX
;End Select
SysSelectEnd4:
;we handle 8 or 16 pixels of height
;For CurrCharRow = 0 to ROWSperfont
	ldi	SysValueCopy,255
	sts	CURRCHARROW,SysValueCopy
	lds	SysCalcTempA,ROWSPERFONT
	cpi	SysCalcTempA,0
	brsh	ENDIF15
	rjmp	SysForLoopEnd7
ENDIF15:
SysForLoop7:
	lds	SysTemp1,CURRCHARROW
	inc	SysTemp1
	sts	CURRCHARROW,SysTemp1
;Set the pixel
;If CurrCharVal.0 = 0 Then
	lds	SysBitTest,CURRCHARVAL
	sbrc	SysBitTest,0
	rjmp	ELSE16_1
;PSet CharLocX + CurrCharCol, CharLocY + CurrCharRow, GLCDBACKGROUND
	lds	SysTemp1,CHARLOCX
	lds	SysTemp2,CURRCHARCOL
	add	SysTemp1,SysTemp2
	sts	GLCDX,SysTemp1
	lds	SysTemp1,CHARLOCX_H
	ldi	SysTemp3,0
	adc	SysTemp1,SysTemp3
	sts	GLCDX_H,SysTemp1
	lds	SysTemp1,CHARLOCY
	lds	SysTemp2,CURRCHARROW
	add	SysTemp1,SysTemp2
	sts	GLCDY,SysTemp1
	lds	SysTemp1,CHARLOCY_H
	ldi	SysTemp3,0
	adc	SysTemp1,SysTemp3
	sts	GLCDY_H,SysTemp1
	lds	SysValueCopy,GLCDBACKGROUND
	sts	GLCDCOLOUR,SysValueCopy
	lds	SysValueCopy,GLCDBACKGROUND_H
	sts	GLCDCOLOUR_H,SysValueCopy
	rcall	PSET_ILI9341
;Else
	rjmp	ENDIF16
ELSE16_1:
;PSet CharLocX + CurrCharCol, CharLocY + CurrCharRow, LineColour
	lds	SysTemp1,CHARLOCX
	lds	SysTemp2,CURRCHARCOL
	add	SysTemp1,SysTemp2
	sts	GLCDX,SysTemp1
	lds	SysTemp1,CHARLOCX_H
	ldi	SysTemp3,0
	adc	SysTemp1,SysTemp3
	sts	GLCDX_H,SysTemp1
	lds	SysTemp1,CHARLOCY
	lds	SysTemp2,CURRCHARROW
	add	SysTemp1,SysTemp2
	sts	GLCDY,SysTemp1
	lds	SysTemp1,CHARLOCY_H
	ldi	SysTemp3,0
	adc	SysTemp1,SysTemp3
	sts	GLCDY_H,SysTemp1
	lds	SysValueCopy,LINECOLOUR
	sts	GLCDCOLOUR,SysValueCopy
	lds	SysValueCopy,LINECOLOUR_H
	sts	GLCDCOLOUR_H,SysValueCopy
	rcall	PSET_ILI9341
;End If
ENDIF16:
;Rotate CurrCharVal Right
	lds	SysValueCopy,CURRCHARVAL
	ror	SysValueCopy
	sts	CURRCHARVAL,SysValueCopy
;Set to next row of date, a second row
;if GLCDfntDefaultSize = 2 and CurrCharRow = 7 then
	lds	SysBYTETempA,GLCDFNTDEFAULTSIZE
	ldi	SysBYTETempB,2
	call	SysCompEqual
	mov	SysTemp1,SysByteTempX
	lds	SysBYTETempA,CURRCHARROW
	ldi	SysBYTETempB,7
	call	SysCompEqual
	mov	SysTemp3,SysByteTempX
	and	SysTemp3,SysTemp1
	mov	SysTemp2,SysTemp3
	sbrs	SysTemp2,0
	rjmp	ENDIF17
;LocalCharCode++
	lds	SysTemp1,LOCALCHARCODE
	inc	SysTemp1
	sts	LOCALCHARCODE,SysTemp1
	lds	SysTemp1,LOCALCHARCODE_H
	brne	PC + 2
	inc	SysTemp1
	sts	LOCALCHARCODE_H,SysTemp1
;ReadTable OLEDFont2, LocalCharCode, CurrCharVal
	lds	SYSSTRINGA,LOCALCHARCODE
	lds	SYSSTRINGA_H,LOCALCHARCODE_H
	rcall	OLEDFONT2
	sts	CURRCHARVAL,SysByteTempX
;end if
ENDIF17:
;It is the intercharacter space, put out one pixel row
;if CurrCharCol = COLSperfont then
	lds	SysCalcTempA,CURRCHARCOL
	lds	SysCalcTempB,COLSPERFONT
	cp	SysCalcTempA,SysCalcTempB
	brne	ENDIF18
;Put out a white intercharacter pixel/space
;GLCDTemp = CharLocX + CurrCharCol
	lds	SysTemp1,CHARLOCX
	lds	SysTemp2,CURRCHARCOL
	add	SysTemp1,SysTemp2
	sts	GLCDTEMP,SysTemp1
	lds	SysTemp1,CHARLOCX_H
	ldi	SysTemp3,0
	adc	SysTemp1,SysTemp3
	sts	GLCDTEMP_H,SysTemp1
;if GLCDfntDefaultSize = 2 then
	lds	SysCalcTempA,GLCDFNTDEFAULTSIZE
	cpi	SysCalcTempA,2
	brne	ENDIF21
;GLCDTemp++
	lds	SysTemp1,GLCDTEMP
	inc	SysTemp1
	sts	GLCDTEMP,SysTemp1
	lds	SysTemp1,GLCDTEMP_H
	brne	PC + 2
	inc	SysTemp1
	sts	GLCDTEMP_H,SysTemp1
;end if
ENDIF21:
;PSet GLCDTemp , CharLocY + CurrCharRow, GLCDBACKGROUND
	lds	SysValueCopy,GLCDTEMP
	sts	GLCDX,SysValueCopy
	lds	SysValueCopy,GLCDTEMP_H
	sts	GLCDX_H,SysValueCopy
	lds	SysTemp1,CHARLOCY
	lds	SysTemp2,CURRCHARROW
	add	SysTemp1,SysTemp2
	sts	GLCDY,SysTemp1
	lds	SysTemp1,CHARLOCY_H
	ldi	SysTemp3,0
	adc	SysTemp1,SysTemp3
	sts	GLCDY_H,SysTemp1
	lds	SysValueCopy,GLCDBACKGROUND
	sts	GLCDCOLOUR,SysValueCopy
	lds	SysValueCopy,GLCDBACKGROUND_H
	sts	GLCDCOLOUR_H,SysValueCopy
	rcall	PSET_ILI9341
;end if
ENDIF18:
;Next
	lds	SysCalcTempA,CURRCHARROW
	lds	SysCalcTempB,ROWSPERFONT
	cp	SysCalcTempA,SysCalcTempB
	brsh	ENDIF19
	rjmp	SysForLoop7
ENDIF19:
SysForLoopEnd7:
;Next
	lds	SysCalcTempA,CURRCHARCOL
	lds	SysCalcTempB,COLSPERFONT
	cp	SysCalcTempA,SysCalcTempB
	brsh	ENDIF20
	rjmp	SysForLoop6
ENDIF20:
SysForLoopEnd6:
	ret

;********************************************************************************

;Overloaded signature: WORD:WORD:STRING:WORD:
GLCDPRINT4:
;Dim GLCDPrintLoc as word
;GLCDPrintLen = LCDPrintData(0)
	lds	SysStringA,SysLCDPRINTDATAHandler
	lds	SysStringA_H,SysLCDPRINTDATAHandler_H
	ld	SysValueCopy,X
	sts	GLCDPRINTLEN,SysValueCopy
;If GLCDPrintLen = 0 Then Exit Sub
	lds	SysCalcTempA,GLCDPRINTLEN
	tst	SysCalcTempA
	brne	ENDIF1
	ret
ENDIF1:
;dim OldGLCDFontWidth as Byte
;OldGLCDFontWidth = GLCDFontWidth
	lds	SysValueCopy,GLCDFONTWIDTH
	sts	OLDGLCDFONTWIDTH,SysValueCopy
;GLCDPrintLoc = PrintLocX
	lds	SysValueCopy,PRINTLOCX
	sts	GLCDPRINTLOC,SysValueCopy
	lds	SysValueCopy,PRINTLOCX_H
	sts	GLCDPRINTLOC_H,SysValueCopy
;Write Data
;For GLCDPrint_String_Counter = 1 To GLCDPrintLen
	ldi	SysValueCopy,0
	sts	GLCDPRINT_STRING_COUNTER,SysValueCopy
	lds	SysCalcTempA,GLCDPRINTLEN
	cpi	SysCalcTempA,1
	brsh	ENDIF2
	rjmp	SysForLoopEnd1
ENDIF2:
SysForLoop1:
	lds	SysTemp1,GLCDPRINT_STRING_COUNTER
	inc	SysTemp1
	sts	GLCDPRINT_STRING_COUNTER,SysTemp1
;GLCDDrawChar GLCDPrintLoc, PrintLocY, LCDPrintData(GLCDPrint_String_Counter), LineColour
	lds	SysValueCopy,GLCDPRINTLOC
	sts	CHARLOCX,SysValueCopy
	lds	SysValueCopy,GLCDPRINTLOC_H
	sts	CHARLOCX_H,SysValueCopy
	lds	SysValueCopy,PRINTLOCY
	sts	CHARLOCY,SysValueCopy
	lds	SysValueCopy,PRINTLOCY_H
	sts	CHARLOCY_H,SysValueCopy
	lds	SysTemp1,SysLCDPRINTDATAHandler
	lds	SysTemp2,GLCDPRINT_STRING_COUNTER
	add	SysTemp1,SysTemp2
	mov	SysStringA,SysTemp1
	lds	SysTemp1,SysLCDPRINTDATAHandler_H
	ldi	SysTemp3,0
	adc	SysTemp1,SysTemp3
	mov	SysStringA_H,SysTemp1
	ld	SysValueCopy,X
	sts	CHARCODE,SysValueCopy
	rcall	GLCDDRAWCHAR_ILI9341
;GLCDPrintIncrementPixelPositionMacro
;GLCDPrintLoc = GLCDPrintLoc + ( GLCDFontWidth * GLCDfntDefaultsize ) + GLCDfntDefaultsize - 1
	lds	SysBYTETempA,GLCDFONTWIDTH
	lds	SysBYTETempB,GLCDFNTDEFAULTSIZE
	mul	SysByteTempA,SysByteTempB
	mov	SysTemp1,SysByteTempX
	lds	SysTemp3,GLCDPRINTLOC
	add	SysTemp3,SysTemp1
	mov	SysTemp2,SysTemp3
	lds	SysTemp1,GLCDPRINTLOC_H
	ldi	SysTemp3,0
	adc	SysTemp1,SysTemp3
	mov	SysTemp2_H,SysTemp1
	lds	SysTemp3,GLCDFNTDEFAULTSIZE
	add	SysTemp2,SysTemp3
	mov	SysTemp1,SysTemp2
	ldi	SysTemp3,0
	adc	SysTemp2_H,SysTemp3
	mov	SysTemp1_H,SysTemp2_H
	ldi	SysTemp3,1
	sub	SysTemp1,SysTemp3
	sts	GLCDPRINTLOC,SysTemp1
	ldi	SysTemp3,0
	sbc	SysTemp1_H,SysTemp3
	sts	GLCDPRINTLOC_H,SysTemp1_H
;Next
	lds	SysCalcTempA,GLCDPRINT_STRING_COUNTER
	lds	SysCalcTempB,GLCDPRINTLEN
	cp	SysCalcTempA,SysCalcTempB
	brsh	ENDIF3
	rjmp	SysForLoop1
ENDIF3:
SysForLoopEnd1:
;GLCDFontWidth = OldGLCDFontWidth
	lds	SysValueCopy,OLDGLCDFONTWIDTH
	sts	GLCDFONTWIDTH,SysValueCopy
	ret

;********************************************************************************

INITGLCD_ILI9341:
;Mapped to global variables to same RAM
;dim ILI9341_GLCD_HEIGHT, ILI9341_GLCD_WIDTH as word
;Setup code for ILI9341 controllers
;asm showdebug  SPI
;spi
;asm showdebug  ILI9341_SPI_MODE_SCRIPT
;0
;asm showdebug  8BIT mode
;8bit mode
;asm showdebug  ILI9341_8BIT_MODE_SCRIPT
;1
;8bit bus mode !!
;dir  ILI9341_DB7 OUT
	sbi	DDRD,7
;dir  ILI9341_DB6 OUT
	sbi	DDRD,6
;dir  ILI9341_DB5 OUT
	sbi	DDRD,5
;dir  ILI9341_DB4 OUT
	sbi	DDRD,4
;dir  ILI9341_DB3 OUT
	sbi	DDRD,3
;dir  ILI9341_DB2 OUT
	sbi	DDRD,2
;dir  ILI9341_DB1 OUT
	sbi	DDRB,1
;dir  ILI9341_DB0 OUT
	sbi	DDRB,0
;Set pin directions
;Dir ILI9341_RD  Out
	sbi	DDRC,0
;Dir ILI9341_WR  Out
	sbi	DDRC,1
;Dir ILI9341_RS  Out
	sbi	DDRC,2
;Dir ILI9341_CS  Out
	sbi	DDRC,3
;Dir ILI9341_RST Out
	sbi	DDRC,4
;Set ILI9341_RD On
	sbi	PORTC,0
;Set ILI9341_WR On
	sbi	PORTC,1
;Set ILI9341_RS On
	sbi	PORTC,2
;set ILI9341_CS ON
	sbi	PORTC,3
;Set ILI9341_RST On
	sbi	PORTC,4
;Reset display
;Wait 50 ms
	ldi	SysWaitTempMS,50
	ldi	SysWaitTempMS_H,0
	rcall	Delay_MS
;Set ILI9341_RST On
	sbi	PORTC,4
;Wait 15 ms
	ldi	SysWaitTempMS,15
	ldi	SysWaitTempMS_H,0
	rcall	Delay_MS
;Reset sequence (lower line for at least 10 us)
;Set ILI9341_RST Off
	cbi	PORTC,4
;Wait 15 us
	ldi	DELAYTEMP,80
DelayUS2:
	dec	DELAYTEMP
	brne	DelayUS2
;Set ILI9341_RST On
	sbi	PORTC,4
;Wait 15 ms
	ldi	SysWaitTempMS,15
	ldi	SysWaitTempMS_H,0
	rcall	Delay_MS
;SendCommand_ILI9341(0xEF)
	ldi	SysValueCopy,239
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDCOMMAND_ILI9341
;SendData_ILI9341(0x03)
	ldi	SysValueCopy,3
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x80)
	ldi	SysValueCopy,128
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x02)
	ldi	SysValueCopy,2
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendCommand_ILI9341(0xCF)
	ldi	SysValueCopy,207
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDCOMMAND_ILI9341
;SendData_ILI9341(0x00)
	ldi	SysValueCopy,0
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0XC1)
	ldi	SysValueCopy,193
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0X30)
	ldi	SysValueCopy,48
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendCommand_ILI9341(0xED)
	ldi	SysValueCopy,237
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDCOMMAND_ILI9341
;SendData_ILI9341(0x64)
	ldi	SysValueCopy,100
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x03)
	ldi	SysValueCopy,3
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0X12)
	ldi	SysValueCopy,18
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0X81)
	ldi	SysValueCopy,129
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendCommand_ILI9341(0xE8)
	ldi	SysValueCopy,232
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDCOMMAND_ILI9341
;SendData_ILI9341(0x85)
	ldi	SysValueCopy,133
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x00)
	ldi	SysValueCopy,0
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x78)
	ldi	SysValueCopy,120
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendCommand_ILI9341(0xCB)
	ldi	SysValueCopy,203
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDCOMMAND_ILI9341
;SendData_ILI9341(0x39)
	ldi	SysValueCopy,57
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x2C)
	ldi	SysValueCopy,44
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x00)
	ldi	SysValueCopy,0
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x34)
	ldi	SysValueCopy,52
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x02)
	ldi	SysValueCopy,2
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendCommand_ILI9341(0xF7)
	ldi	SysValueCopy,247
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDCOMMAND_ILI9341
;SendData_ILI9341(0x20)
	ldi	SysValueCopy,32
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendCommand_ILI9341(0xEA)
	ldi	SysValueCopy,234
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDCOMMAND_ILI9341
;SendData_ILI9341(0x00)
	ldi	SysValueCopy,0
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x00)
	ldi	SysValueCopy,0
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendCommand_ILI9341(ILI9341_PWCTR1)    'Power control
	ldi	SysValueCopy,192
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDCOMMAND_ILI9341
;SendData_ILI9341(0x2B)   'VRH[5:0]
	ldi	SysValueCopy,43
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendCommand_ILI9341(ILI9341_PWCTR2)    'Power control
	ldi	SysValueCopy,193
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDCOMMAND_ILI9341
;SendData_ILI9341(0x10)   'SAP[2:0];BT[3:0]
	ldi	SysValueCopy,16
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendCommand_ILI9341(ILI9341_VMCTR1)    'VCM control
	ldi	SysValueCopy,197
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDCOMMAND_ILI9341
;SendData_ILI9341(0x3e) '???????
	ldi	SysValueCopy,62
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x28)
	ldi	SysValueCopy,40
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendCommand_ILI9341(ILI9341_VMCTR2)    'VCM control2
	ldi	SysValueCopy,199
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDCOMMAND_ILI9341
;SendData_ILI9341(0x86)  '--
	ldi	SysValueCopy,134
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendCommand_ILI9341(ILI9341_MADCTL)    ' Memory Access Control
	ldi	SysValueCopy,54
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDCOMMAND_ILI9341
;SendData_ILI9341(ILI9341_MADCTL_MX | ILI9341_MADCTL_BGR)
	ldi	SysValueCopy,72
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendCommand_ILI9341(ILI9341_PIXFMT)
	ldi	SysValueCopy,58
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDCOMMAND_ILI9341
;SendData_ILI9341(0x55)
	ldi	SysValueCopy,85
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendCommand_ILI9341(ILI9341_FRMCTR1)
	ldi	SysValueCopy,177
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDCOMMAND_ILI9341
;SendData_ILI9341(0x00)
	ldi	SysValueCopy,0
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x18)
	ldi	SysValueCopy,24
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendCommand_ILI9341(ILI9341_DFUNCTR)    ' Display Function Control
	ldi	SysValueCopy,182
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDCOMMAND_ILI9341
;SendData_ILI9341(0x08)
	ldi	SysValueCopy,8
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x82)
	ldi	SysValueCopy,130
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x27)
	ldi	SysValueCopy,39
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendCommand_ILI9341(0xF2)    ' 3Gamma Function Disable
	ldi	SysValueCopy,242
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDCOMMAND_ILI9341
;SendData_ILI9341(0x00)
	ldi	SysValueCopy,0
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendCommand_ILI9341(ILI9341_GAMMASET)    'Gamma curve selected
	ldi	SysValueCopy,38
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDCOMMAND_ILI9341
;SendData_ILI9341(0x01)
	ldi	SysValueCopy,1
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendCommand_ILI9341(ILI9341_GMCTRP1)    'Set Gamma
	ldi	SysValueCopy,224
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDCOMMAND_ILI9341
;SendData_ILI9341(0x0F)
	ldi	SysValueCopy,15
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x31)
	ldi	SysValueCopy,49
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x2B)
	ldi	SysValueCopy,43
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x0C)
	ldi	SysValueCopy,12
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x0E)
	ldi	SysValueCopy,14
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x08)
	ldi	SysValueCopy,8
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x4E)
	ldi	SysValueCopy,78
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0xF1)
	ldi	SysValueCopy,241
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x37)
	ldi	SysValueCopy,55
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x07)
	ldi	SysValueCopy,7
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x10)
	ldi	SysValueCopy,16
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x03)
	ldi	SysValueCopy,3
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x0E)
	ldi	SysValueCopy,14
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x09)
	ldi	SysValueCopy,9
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x00)
	ldi	SysValueCopy,0
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendCommand_ILI9341(ILI9341_GMCTRN1)    'Set Gamma
	ldi	SysValueCopy,225
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDCOMMAND_ILI9341
;SendData_ILI9341(0x00)
	ldi	SysValueCopy,0
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x0E)
	ldi	SysValueCopy,14
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x14)
	ldi	SysValueCopy,20
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x03)
	ldi	SysValueCopy,3
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x11)
	ldi	SysValueCopy,17
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x07)
	ldi	SysValueCopy,7
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x31)
	ldi	SysValueCopy,49
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0xC1)
	ldi	SysValueCopy,193
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x48)
	ldi	SysValueCopy,72
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x08)
	ldi	SysValueCopy,8
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x0F)
	ldi	SysValueCopy,15
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x0C)
	ldi	SysValueCopy,12
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x31)
	ldi	SysValueCopy,49
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x36)
	ldi	SysValueCopy,54
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341(0x0F)
	ldi	SysValueCopy,15
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendCommand_ILI9341(ILI9341_SLPOUT)    'Exit Sleep
	ldi	SysValueCopy,17
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDCOMMAND_ILI9341
;wait 150 ms
	ldi	SysWaitTempMS,150
	ldi	SysWaitTempMS_H,0
	rcall	Delay_MS
;SendCommand_ILI9341(ILI9341_DISPON)    'Display on
	ldi	SysValueCopy,41
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDCOMMAND_ILI9341
;Default Colours
;GLCDBACKGROUND = DEFAULT_GLCDBACKGROUND
	ldi	SysValueCopy,255
	sts	GLCDBACKGROUND,SysValueCopy
	sts	GLCDBACKGROUND_H,SysValueCopy
;GLCDForeground = ILI9341_WHITE
	ldi	SysValueCopy,255
	sts	GLCDFOREGROUND,SysValueCopy
	sts	GLCDFOREGROUND_H,SysValueCopy
;Variables required for device
;ILI9341_GLCD_WIDTH = GLCD_WIDTH
	ldi	SysValueCopy,240
	sts	GLCDDEVICEWIDTH,SysValueCopy
	ldi	SysValueCopy,0
	sts	GLCDDEVICEWIDTH_H,SysValueCopy
;ILI9341_GLCD_HEIGHT = GLCD_HEIGHT
	ldi	SysValueCopy,64
	sts	GLCDDEVICEHEIGHT,SysValueCopy
	ldi	SysValueCopy,1
	sts	GLCDDEVICEHEIGHT_H,SysValueCopy
;GLCDFontWidth = 5
	ldi	SysValueCopy,5
	sts	GLCDFONTWIDTH,SysValueCopy
;GLCDfntDefault = 0
	ldi	SysValueCopy,0
	sts	GLCDFNTDEFAULT,SysValueCopy
;GLCDfntDefaultsize = 1
	ldi	SysValueCopy,1
	sts	GLCDFNTDEFAULTSIZE,SysValueCopy
;GLCDRotateState = Portrait
	ldi	SysValueCopy,4
	sts	GLCDROTATESTATE,SysValueCopy
;Clear screen
;GLCDCLS
	rjmp	GLCDCLS_ILI9341

;********************************************************************************

INITGLCD_SSD1289:
;Dim Orientation_SSD1289 as Byte
	ret

;********************************************************************************

INITSYS:
;Turn off all ports
;PORTB = 0
	ldi	SysValueCopy,0
	out	PORTB,SysValueCopy
;PORTC = 0
	ldi	SysValueCopy,0
	out	PORTC,SysValueCopy
;PORTD = 0
	ldi	SysValueCopy,0
	out	PORTD,SysValueCopy
	ret

;********************************************************************************

INITUNO:
;Set UART pin directions
;Dir PORTD.0 In
	cbi	DDRD,0
;Dir PORTD.1 Out
	sbi	DDRD,1
	ret

;********************************************************************************

OLEDFONT1DATA:
	mov	SysWORDTempA,SYSSTRINGA
	mov	SysWORDTempA_H,SYSSTRINGA_H
	ldi	SysWORDTempB,165
	ldi	SysWORDTempB_H,1
	rcall	SysCompLessThan16
	sbrs	SysByteTempX,0
	ret
	ldi	SysReadA, low(TableOLEDFONT1DATA<<1)
	ldi	SysReadA_H, high(TableOLEDFONT1DATA<<1)
	add	SysReadA, SysStringA
	adc	SysReadA_H, SysStringA_H
	lpm
	ret
TableOLEDFONT1DATA:
	.DB	165,1,0,1,94,3,6,0,6,5,40,124,40,124,40,5,36,42,127,42,16,3,98,24,70,5,48,76,90,36
	.DB	80,1,6,2,60,66,2,66,60,5,40,16,124,16,40,3,16,56,16,1,192,3,16,16,16,1,64,3,96,24
	.DB	6,4,60,66,66,60,3,68,126,64,4,68,98,82,76,3,74,74,52,4,30,16,124,16,3,78,74,50
	.DB	4,60,74,74,48,3,98,18,14,4,52,74,74,52,4,12,82,82,60,1,72,2,128,104,3,16,40,68
	.DB	3,40,40,40,3,68,40,16,3,2,82,12,5,56,68,84,84,88,4,124,18,18,124,4,126,74,74,52
	.DB	4,60,66,66,36,4,126,66,66,60,3,126,74,74,3,126,10,10,4,60,66,82,52,4,126,8,8,126
	.DB	3,66,126,66,3,66,66,62,4,126,8,20,98,3,126,64,64,5,126,4,8,4,126,5,126,4,24,32
	.DB	126,4,60,66,66,60,4,126,18,18,12,4,60,66,66,188,4,126,18,18,108,4,68,74,74,48,3,2
	.DB	126,2,4,62,64,64,62,5,6,24,96,24,6,5,62,64,62,64,62,5,66,36,24,36,66,4,158,160
	.DB	160,126,4,98,82,74,70,2,126,66,3,6,24,96,2,66,126,3,32,16,32,4,128,128,128,128
	.DB	2,4,8,4,32,84,84,120,4,126,68,68,56,4,56,68,68,40,4,56,68,68,126,4,56,84,84,88
	.DB	2,124,10,4,152,164,164,124,4,126,4,4,120,1,122,2,64,58,4,126,16,40,68,1,126,5
	.DB	124,4,120,4,120,4,124,4,4,120,4,56,68,68,56,4,252,36,36,24,4,24,36,36,252,2,124,4
	.DB	4,72,84,84,32,3,4,62,68,4,60,64,64,60,5,12,48,64,48,12,5,60,64,60,64,60,5,68,40,16
	.DB	40,68,4,156,160,160,124,3,100,84,76,3,8,54,65,1,255,3,65,54,8,4,32,16,32,16,1

;********************************************************************************

OLEDFONT1DATA_H:
	mov	SysWORDTempA,SYSSTRINGA
	mov	SysWORDTempA_H,SYSSTRINGA_H
	ldi	SysWORDTempB,1
	ldi	SysWORDTempB_H,0
	rcall	SysCompLessThan16
	sbrs	SysByteTempX,0
	ret
	ldi	SysReadA, low(TableOLEDFONT1DATA_H<<1)
	ldi	SysReadA_H, high(TableOLEDFONT1DATA_H<<1)
	add	SysReadA, SysStringA
	adc	SysReadA_H, SysStringA_H
	lpm
	ret
TableOLEDFONT1DATA_H:
	.DB	1

;********************************************************************************

OLEDFONT1INDEX:
	cpi	SysStringA, 97
	brlo	PC + 3
	clr	SysByteTempX
	ret
	ldi	SysReadA, low(TableOLEDFONT1INDEX<<1)
	ldi	SysReadA_H, high(TableOLEDFONT1INDEX<<1)
	add	SysReadA, SysStringA
	brcc	PC + 2
	inc	SysReadA_H
	lpm
	ret
TableOLEDFONT1INDEX:
	.DB	96,1,3,5,9,15,21,25,31,33,36,39,45,49,51,55,57,61,66,70,75,79,84,88,93,97,102,107
	.DB	109,112,116,120,124,128,134,139,144,149,154,158,162,167,172,176,180,185,189,195
	.DB	201,206,211,216,221,226,230,235,241,247,253,2,7,10,14,17,21,26,29,34,39,44,49,54
	.DB	57,62,67,69,72,77,79,85,90,95,100,105,108,113,117,122,128,134,140,145,149,153
	.DB	155,159,164

;********************************************************************************

OLEDFONT1INDEX_H:
	cpi	SysStringA, 97
	brlo	PC + 3
	clr	SysByteTempX
	ret
	ldi	SysReadA, low(TableOLEDFONT1INDEX_H<<1)
	ldi	SysReadA_H, high(TableOLEDFONT1INDEX_H<<1)
	add	SysReadA, SysStringA
	brcc	PC + 2
	inc	SysReadA_H
	lpm
	ret
TableOLEDFONT1INDEX_H:
	.DB	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.DB	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	.DB	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1

;********************************************************************************

OLEDFONT2:
	mov	SysWORDTempA,SYSSTRINGA
	mov	SysWORDTempA_H,SYSSTRINGA_H
	ldi	SysWORDTempB,145
	ldi	SysWORDTempB_H,7
	rcall	SysCompLessThan16
	sbrs	SysByteTempX,0
	ret
	ldi	SysReadA, low(TableOLEDFONT2<<1)
	ldi	SysReadA_H, high(TableOLEDFONT2<<1)
	add	SysReadA, SysStringA
	adc	SysReadA_H, SysStringA_H
	lpm
	ret
TableOLEDFONT2:
	.DB	147,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,254,27,0,0,0,0,0,0,0
	.DB	0,0,0,0,0,0,0,30,0,0,0,0,0,0,0,30,0,0,0,0,0,0,0,0,1,32,25,160,7,120,1,38,25,160
	.DB	7,120,1,38,1,32,1,0,0,0,0,0,0,28,24,38,16,66,16,255,63,130,17,2,15,0,0,0,0,28
	.DB	16,34,8,34,4,34,3,156,0,64,14,48,17,8,17,4,17,2,14,0,7,128,8,92,16,98,16,162,17,50
	.DB	19,28,28,0,24,0,22,128,1,0,0,0,0,0,0,0,0,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,224
	.DB	7,24,24,12,48,4,32,2,64,2,64,0,0,0,0,2,64,2,64,4,32,12,48,24,24,224,7,0,0,0,0,0
	.DB	0,0,0,8,0,24,0,240,0,78,0,240,0,24,0,8,0,0,0,0,0,0,2,0,2,0,2,0,2,224,31,0,2,0,2,0
	.DB	2,0,2,0,0,0,0,0,0,0,0,0,152,0,120,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1,0,1,0
	.DB	1,0,1,0,0,0,0,0,0,0,0,0,0,0,24,0,24,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,48,0,12,0,3,192
	.DB	0,48,0,12,0,2,0,0,0,0,0,240,3,12,12,2,16,2,16,2,16,12,12,240,3,0,0,0,0,0,0,4,16,4
	.DB	16,4,16,254,31,0,16,0,16,0,16,0,0,0,0,0,0,6,24,2,20,2,18,2,17,194,16,60,16,0,0,0
	.DB	0,0,0,0,0,0,0,2,16,66,16,66,16,66,16,188,15,0,0,0,0,0,0,0,3,192,2,32,2,24,2,4,2,254
	.DB	31,0,2,0,2,0,0,0,0,0,0,0,0,62,16,34,16,34,16,66,8,130,7,0,0,0,0,0,0,0,0,240,7,76
	.DB	8,34,16,34,16,34,16,66,8,128,7,0,0,0,0,0,0,2,0,2,24,2,7,194,0,50,0,10,0,6,0,0,0,0
	.DB	0,0,0,28,15,162,16,66,16,66,16,162,16,162,9,28,6,0,0,0,0,0,0,120,0,132,16,2,17,2
	.DB	17,2,17,132,12,248,3,0,0,0,0,0,0,0,0,0,0,96,24,96,24,0,0,0,0,0,0,0,0,0,0,0,0,0
	.DB	0,0,0,96,152,96,120,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,3,128,4,128,4,64,8,64,8,32
	.DB	16,0,0,0,0,128,4,128,4,128,4,128,4,128,4,128,4,128,4,128,4,0,0,0,0,32,16,64,8,64
	.DB	8,128,4,128,4,0,3,0,3,0,0,0,0,0,0,14,0,2,0,2,27,130,0,66,0,38,0,28,0,0,0,0,0,240
	.DB	3,24,12,4,24,226,19,18,20,10,22,138,27,252,7,0,4,0,4,0,16,0,14,128,3,112,2,24,2,48
	.DB	2,192,2,0,3,0,12,0,16,0,0,248,31,136,16,136,16,136,16,136,16,72,17,48,14,0,0,0
	.DB	0,192,3,48,12,16,8,8,16,8,16,8,16,8,16,24,16,0,0,0,0,0,0,248,31,8,16,8,16,8,16,8
	.DB	16,16,8,224,7,0,0,0,0,0,0,248,31,8,17,8,17,8,17,8,17,8,17,8,16,0,0,0,0,0,0,248
	.DB	31,8,1,8,1,8,1,8,1,8,1,8,0,0,0,0,0,0,0,192,3,48,12,16,8,8,16,8,16,8,17,8,17,24
	.DB	31,0,0,0,0,248,31,0,1,0,1,0,1,0,1,0,1,248,31,0,0,0,0,0,0,8,16,8,16,8,16,248,31,8
	.DB	16,8,16,8,16,0,0,0,0,0,0,0,0,0,16,8,16,8,16,8,16,248,15,0,0,0,0,0,0,0,0,248,31,128
	.DB	0,128,1,64,2,32,4,16,4,8,8,0,16,0,0,0,0,248,31,0,16,0,16,0,16,0,16,0,16,0,16,0
	.DB	0,0,0,248,31,56,0,224,1,0,7,0,6,192,1,56,0,248,31,0,0,0,0,0,0,248,31,16,0,96,0,128
	.DB	1,0,6,0,8,248,31,0,0,0,0,0,0,224,7,16,8,8,16,8,16,8,16,8,16,16,8,224,7,0,0,0,0,248
	.DB	31,8,1,8,1,8,1,8,1,136,0,112,0,0,0,0,0,0,0,224,7,16,8,8,16,8,16,8,16,8,48,16,72,224
	.DB	71,0,0,0,0,248,31,8,1,8,1,8,3,136,4,112,8,0,16,0,0,0,0,0,0,112,24,72,16,136,16,136
	.DB	16,8,17,8,9,24,14,0,0,0,0,8,0,8,0,8,0,8,0,248,31,8,0,8,0,8,0,8,0,0,0,0,0,248,7,0
	.DB	24,0,16,0,16,0,16,0,8,248,7,0,0,0,0,8,0,48,0,192,1,0,6,0,24,0,24,0,7,192,0,48,0,8
	.DB	0,24,0,224,3,0,28,0,15,224,0,192,1,0,14,0,28,224,3,24,0,8,16,16,8,32,4,64,2,128
	.DB	1,128,1,64,2,32,4,16,8,8,16,8,0,16,0,96,0,128,0,0,31,128,0,64,0,32,0,16,0,8,0,0
	.DB	0,8,24,8,20,8,18,8,17,136,16,72,16,40,16,24,16,0,0,0,0,0,0,0,0,254,127,2,64,2
	.DB	64,2,64,2,64,0,0,0,0,0,0,2,0,12,0,48,0,192,0,0,3,0,12,0,48,0,64,0,0,0,0,2,64,2
	.DB	64,2,64,2,64,254,127,0,0,0,0,0,0,0,0,0,0,0,4,0,3,224,0,56,0,14,0,112,0,128,3,0
	.DB	4,0,0,0,32,0,32,0,32,0,32,0,32,0,32,0,32,0,32,0,32,0,32,0,0,0,0,0,0,0,0,1,0,2,0,0
	.DB	0,0,0,0,0,0,0,0,0,0,12,32,18,32,17,32,17,32,9,192,31,0,16,0,0,0,0,0,0,254,31,64
	.DB	8,32,16,32,16,32,16,96,8,128,7,0,0,0,0,0,0,128,7,64,8,32,16,32,16,32,16,32,16,32
	.DB	16,0,0,0,0,0,0,128,7,64,24,32,16,32,16,32,16,64,8,254,31,0,0,0,0,0,0,128,7,64,9,32
	.DB	17,32,17,32,17,32,17,192,17,0,0,0,0,0,0,32,0,32,0,252,31,36,0,34,0,34,0,34,0,34
	.DB	0,0,0,0,0,128,7,64,152,32,144,32,144,32,144,64,72,224,63,0,0,0,0,0,0,254,31,128
	.DB	0,64,0,32,0,32,0,32,0,192,31,0,0,0,0,0,0,32,0,32,0,38,0,230,31,0,0,0,0,0,0,0,0,0
	.DB	0,0,0,0,128,32,128,32,128,38,128,230,127,0,0,0,0,0,0,0,0,0,0,254,31,0,1,0,3,128
	.DB	4,64,4,64,8,32,16,0,0,0,0,0,0,0,0,2,0,2,0,2,0,254,31,0,0,0,0,0,0,0,0,224,31,64
	.DB	0,32,0,32,0,192,31,64,0,32,0,32,0,192,31,0,0,0,0,224,31,192,0,64,0,32,0,32,0,32
	.DB	0,192,31,0,0,0,0,0,0,128,7,64,8,32,16,32,16,32,16,64,8,128,7,0,0,0,0,0,0,224
	.DB	255,64,8,32,16,32,16,32,16,96,8,128,7,0,0,0,0,0,0,128,7,64,24,32,16,32,16,32,16,64
	.DB	8,224,255,0,0,0,0,0,0,0,0,224,31,128,0,64,0,32,0,32,0,224,0,0,0,0,0,0,0,192,24,32
	.DB	17,32,17,32,18,32,18,32,12,0,0,0,0,0,0,0,0,32,0,32,0,248,15,32,16,32,16,32,16,32
	.DB	16,0,0,0,0,0,0,224,15,0,16,0,16,0,16,0,8,224,31,0,0,0,0,0,0,32,0,192,1,0,6,0,24,0
	.DB	16,0,12,0,3,192,0,32,0,0,0,96,0,128,7,0,24,0,14,192,1,128,1,0,14,0,24,128,7,96
	.DB	0,0,0,32,16,64,8,128,4,0,3,0,3,128,4,64,8,32,16,0,0,32,128,192,128,0,131,0,70,0
	.DB	56,0,24,0,6,0,1,192,0,32,0,0,0,32,16,32,24,32,20,32,18,32,17,160,16,96,16,32,16,0
	.DB	0,0,0,0,0,0,1,0,1,252,62,2,64,2,64,2,64,0,0,0,0,0,0,0,0,0,0,0,0,254,127,0,0,0,0,0
	.DB	0,0,0,0,0,0,0,0,0,2,64,2,64,2,64,252,62,0,1,0,1,0,0,0,0,0,3,128,0,128,0,128,0,0
	.DB	1,0,1,0,2,0,2,0,2,128,1,0,0,128,31,192,16,32,16,16,16,32,16,192,16,128,31,0,0,0
	.DB	0,192,3,48,12,16,8,8,16,8,16,8,144,8,176,24,208

;********************************************************************************

OLEDFONT2_H:
	mov	SysWORDTempA,SYSSTRINGA
	mov	SysWORDTempA_H,SYSSTRINGA_H
	ldi	SysWORDTempB,1
	ldi	SysWORDTempB_H,0
	rcall	SysCompLessThan16
	sbrs	SysByteTempX,0
	ret
	ldi	SysReadA, low(TableOLEDFONT2_H<<1)
	ldi	SysReadA_H, high(TableOLEDFONT2_H<<1)
	add	SysReadA, SysStringA
	adc	SysReadA_H, SysStringA_H
	lpm
	ret
TableOLEDFONT2_H:
	.DB	7

;********************************************************************************

PSET_ILI9341:
;SetAddressWindow_ILI9341 ( GLCDX, GLCDY, GLCDX, GLCDY )
	lds	SysValueCopy,GLCDX
	sts	_X1,SysValueCopy
	lds	SysValueCopy,GLCDX_H
	sts	_X1_H,SysValueCopy
	lds	SysValueCopy,GLCDY
	sts	_Y1,SysValueCopy
	lds	SysValueCopy,GLCDY_H
	sts	_Y1_H,SysValueCopy
	lds	SysValueCopy,GLCDX
	sts	_X2,SysValueCopy
	lds	SysValueCopy,GLCDX_H
	sts	_X2_H,SysValueCopy
	lds	SysValueCopy,GLCDY
	sts	_Y2,SysValueCopy
	lds	SysValueCopy,GLCDY_H
	sts	_Y2_H,SysValueCopy
	rcall	SETADDRESSWINDOW_ILI9341
;SendWord_ILI9341 GLCDColour
	lds	SysValueCopy,GLCDCOLOUR
	sts	ILI9341SENDWORD,SysValueCopy
	lds	SysValueCopy,GLCDCOLOUR_H
	sts	ILI9341SENDWORD_H,SysValueCopy
	rjmp	SENDWORD_ILI9341

;********************************************************************************

SENDCOMMAND_ILI9341:
;8bit mode
;ILI9341_CS = 0
	cbi	PORTC,3
;ILI9341_RS = 0
	cbi	PORTC,2
;ILI9341_RD = 1
	sbi	PORTC,0
;ILI9341_WR = 1
	sbi	PORTC,1
;PORTD = (PORTD & 0B00000011) | ((ILI9341SendByte) & 0B11111100);
	ldi	SysTemp3,3
	in	SysTemp1,PORTD
	and	SysTemp1,SysTemp3
	mov	SysTemp4,SysTemp1
	ldi	SysTemp3,252
	lds	SysTemp2,ILI9341SENDBYTE
	and	SysTemp2,SysTemp3
	mov	SysTemp1,SysTemp2
	or	SysTemp1,SysTemp4
	out	PORTD,SysTemp1
;PORTB = (PORTB & 0B11111100) | ((ILI9341SendByte) & 0B00000011);
	ldi	SysTemp3,252
	in	SysTemp1,PORTB
	and	SysTemp1,SysTemp3
	mov	SysTemp4,SysTemp1
	ldi	SysTemp3,3
	lds	SysTemp2,ILI9341SENDBYTE
	and	SysTemp2,SysTemp3
	mov	SysTemp1,SysTemp2
	or	SysTemp1,SysTemp4
	out	PORTB,SysTemp1
;ILI9341_WR  = 0
	cbi	PORTC,1
;ILI9341_WR = 1
	sbi	PORTC,1
;ILI9341_CS = 1
	sbi	PORTC,3
;endif 8bit
	ret

;********************************************************************************

SENDDATA_ILI9341:
;8bit mode
;ILI9341_CS = 0
	cbi	PORTC,3
;ILI9341_RS = 1
	sbi	PORTC,2
;ILI9341_RD = 1
	sbi	PORTC,0
;ILI9341_WR = 1
	sbi	PORTC,1
;PORTD = (PORTD & 0B00000011) | ((ILI9341SendByte) & 0B11111100);
	ldi	SysTemp3,3
	in	SysTemp1,PORTD
	and	SysTemp1,SysTemp3
	mov	SysTemp4,SysTemp1
	ldi	SysTemp3,252
	lds	SysTemp2,ILI9341SENDBYTE
	and	SysTemp2,SysTemp3
	mov	SysTemp1,SysTemp2
	or	SysTemp1,SysTemp4
	out	PORTD,SysTemp1
;PORTB = (PORTB & 0B11111100) | ((ILI9341SendByte) & 0B00000011);
	ldi	SysTemp3,252
	in	SysTemp1,PORTB
	and	SysTemp1,SysTemp3
	mov	SysTemp4,SysTemp1
	ldi	SysTemp3,3
	lds	SysTemp2,ILI9341SENDBYTE
	and	SysTemp2,SysTemp3
	mov	SysTemp1,SysTemp2
	or	SysTemp1,SysTemp4
	out	PORTB,SysTemp1
;ILI9341_WR = 0
	cbi	PORTC,1
;ILI9341_WR = 1
	sbi	PORTC,1
;ILI9341_CS = 1
	sbi	PORTC,3
;endif 8bit
	ret

;********************************************************************************

SENDWORD_ILI9341:
;dim ILI9341SendWord as word
;8bit mode
;ILI9341_CS = 0
	cbi	PORTC,3
;ILI9341_RS = 1
	sbi	PORTC,2
;ILI9341_RD = 1
	sbi	PORTC,0
;ILI9341_WR = 1
	sbi	PORTC,1
;PORTD = (PORTD & 0B00000011) | ((ILI9341SendWord_h) & 0B11111100);
	ldi	SysTemp3,3
	in	SysTemp2,PORTD
	and	SysTemp2,SysTemp3
	mov	SysTemp1,SysTemp2
	ldi	SysTemp3,252
	lds	SysTemp4,ILI9341SENDWORD_H
	and	SysTemp4,SysTemp3
	mov	SysTemp2,SysTemp4
	or	SysTemp2,SysTemp1
	out	PORTD,SysTemp2
;PORTB = (PORTB & 0B11111100) | ((ILI9341SendWord_h) & 0B00000011);
	ldi	SysTemp3,252
	in	SysTemp1,PORTB
	and	SysTemp1,SysTemp3
	mov	SysTemp4,SysTemp1
	ldi	SysTemp3,3
	lds	SysTemp2,ILI9341SENDWORD_H
	and	SysTemp2,SysTemp3
	mov	SysTemp1,SysTemp2
	or	SysTemp1,SysTemp4
	out	PORTB,SysTemp1
;ILI9341_WR = 0
	cbi	PORTC,1
;ILI9341_WR = 1
	sbi	PORTC,1
;PORTD = (PORTD & 0B00000011) | ((ILI9341SendWord) & 0B11111100);
	ldi	SysTemp3,3
	in	SysTemp1,PORTD
	and	SysTemp1,SysTemp3
	mov	SysTemp4,SysTemp1
	ldi	SysTemp3,252
	lds	SysTemp2,ILI9341SENDWORD
	and	SysTemp2,SysTemp3
	mov	SysTemp1,SysTemp2
	ldi	SysValueCopy,0
	mov	SysTemp1_H,SysValueCopy
	or	SysTemp1,SysTemp4
	out	PORTD,SysTemp1
;PORTB = (PORTB & 0B11111100) | ((ILI9341SendWord) & 0B00000011);
	ldi	SysTemp3,252
	in	SysTemp1,PORTB
	and	SysTemp1,SysTemp3
	mov	SysTemp4,SysTemp1
	ldi	SysTemp3,3
	lds	SysTemp2,ILI9341SENDWORD
	and	SysTemp2,SysTemp3
	mov	SysTemp1,SysTemp2
	ldi	SysValueCopy,0
	mov	SysTemp1_H,SysValueCopy
	or	SysTemp1,SysTemp4
	out	PORTB,SysTemp1
;ILI9341_WR = 0
	cbi	PORTC,1
;ILI9341_WR = 1
	sbi	PORTC,1
;ILI9341_CS = 1
	sbi	PORTC,3
;endif 8bit
	ret

;********************************************************************************

SETADDRESSWINDOW_ILI9341:
;SendCommand_ILI9341(ILI9341_CASET); // Column addr set
	ldi	SysValueCopy,42
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDCOMMAND_ILI9341
;SendData_ILI9341 _x1_H
	lds	SysValueCopy,_X1_H
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341 _x1
	lds	SysValueCopy,_X1
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341 _x2_H
	lds	SysValueCopy,_X2_H
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341 _x2
	lds	SysValueCopy,_X2
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendCommand_ILI9341(ILI9341_PASET); // Row addr set
	ldi	SysValueCopy,43
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDCOMMAND_ILI9341
;SendData_ILI9341 _y1_H
	lds	SysValueCopy,_Y1_H
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341 _y1
	lds	SysValueCopy,_Y1
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341 _y2_H
	lds	SysValueCopy,_Y2_H
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendData_ILI9341 _y2
	lds	SysValueCopy,_Y2
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;SendCommand_ILI9341(ILI9341_RAMWR); // write to RAM
	ldi	SysValueCopy,44
	sts	ILI9341SENDBYTE,SysValueCopy
	rjmp	SENDCOMMAND_ILI9341

;********************************************************************************

SYSCOMPEQUAL:
;Dim SysByteTempA, SysByteTempB, SysByteTempX as byte
;clr SysByteTempX
	clr	SYSBYTETEMPX
;cpse SysByteTempA, SysByteTempB
	cpse	SYSBYTETEMPA, SYSBYTETEMPB
;return
	ret
;com SysByteTempX
	com	SYSBYTETEMPX
	ret

;********************************************************************************

SYSCOMPEQUAL16:
;dim SysWordTempA as word
;dim SysWordTempB as word
;dim SysByteTempX as byte
;clr SysByteTempX
	clr	SYSBYTETEMPX
;cp SysWordTempA, SysWordTempB
	cp	SYSWORDTEMPA, SYSWORDTEMPB
;brne SCE16False
	brne	SCE16FALSE
;cp SysWordTempA_H, SysWordTempB_H
	cp	SYSWORDTEMPA_H, SYSWORDTEMPB_H
;brne SCE16False
	brne	SCE16FALSE
;com SysByteTempX
	com	SYSBYTETEMPX
SCE16FALSE:
	ret

;********************************************************************************

SYSCOMPLESSTHAN16:
;clr SysByteTempX
	clr	SYSBYTETEMPX
;Test High, exit false if more
;cp SysWordTempB_H,SysWordTempA_H
	cp	SYSWORDTEMPB_H,SYSWORDTEMPA_H
;brlo SCLT16False
	brlo	SCLT16FALSE
;Test high, exit true if less
;cp SysWordTempA_H,SysWordTempB_H
	cp	SYSWORDTEMPA_H,SYSWORDTEMPB_H
;brlo SCLT16True
	brlo	SCLT16TRUE
;Test Low, exit if more or equal
;cp SysWordTempA,SysWordTempB
	cp	SYSWORDTEMPA,SYSWORDTEMPB
;brlo SCLT16True
	brlo	SCLT16TRUE
;ret
	ret
SCLT16TRUE:
;com SysByteTempX
	com	SYSBYTETEMPX
SCLT16FALSE:
	ret

;********************************************************************************

SYSMULTSUB16:
;dim SysWordTempA as word
;dim SysWordTempB as word
;dim SysWordTempX as word
;Need to keep result in here because SysWordTempX[_H] gets overwritten by mul
;dim SysDivMultX as word ' alias SysWordTempX_U, SysWordTempX_H
;X = LowA * LowB
;mul SysWordTempA, SysWordTempB
	mul	SYSWORDTEMPA, SYSWORDTEMPB
;movff PRODL, SysWordTempX
;movff PRODH, SysWordTempX_H
;SysDivMultX = SysWordTempX
	mov	SYSDIVMULTX,SYSWORDTEMPX
	mov	SYSDIVMULTX_H,SYSWORDTEMPX_H
;HighX += LowA * HighB
;mul SysWordTempA, SysWordTempB_H
	mul	SYSWORDTEMPA, SYSWORDTEMPB_H
;add SysDivMultX_H, SysWordTempX
	add	SYSDIVMULTX_H, SYSWORDTEMPX
;HighX += HighA * LowB
;mul SysWordTempA_H, SysWordTempB
	mul	SYSWORDTEMPA_H, SYSWORDTEMPB
;add SysDivMultX_H, SysWordTempX
	add	SYSDIVMULTX_H, SYSWORDTEMPX
;Copy result back
;SysWordTempX = SysDivMultX
	mov	SYSWORDTEMPX,SYSDIVMULTX
	mov	SYSWORDTEMPX_H,SYSDIVMULTX_H
	ret

;********************************************************************************

SYSREADSTRING:
;Dim SysCalcTempA As Byte
;Dim SysStringLength As Byte
;Dim SysCalcTempX As Byte
;Get length
;lpm SysCalcTempA, Z+
;lpm
	lpm
;mov SysCalcTempA, SysCalcTempX
	mov	SYSCALCTEMPA, SYSCALCTEMPX
;SysReadA += 1
	inc	SYSREADA
	brne	PC + 2
	inc	SYSREADA_H
;st Y+, SysCalcTempA
	st	Y+, SYSCALCTEMPA
;rjmp SysStringReadCheck
	rjmp	SYSSTRINGREADCHECK
SYSREADSTRINGPART:
;lpm SysCalcTempA, Z+
;lpm
	lpm
;mov SysCalcTempA, SysCalcTempX
	mov	SYSCALCTEMPA, SYSCALCTEMPX
;SysReadA += 1
	inc	SYSREADA
	brne	PC + 2
	inc	SYSREADA_H
;add SysStringLength, SysCalcTempA
	add	SYSSTRINGLENGTH, SYSCALCTEMPA
;Check length
SYSSTRINGREADCHECK:
;If length is 0, exit
;cpi SysCalcTempA, 0
	cpi	SYSCALCTEMPA, 0
;brne SysStringRead
	brne	SYSSTRINGREAD
;ret
	ret
;Copy
SYSSTRINGREAD:
;Copy char
;lpm SysCalcTempX, Z+
;lpm
	lpm
;SysReadA += 1
	inc	SYSREADA
	brne	PC + 2
	inc	SYSREADA_H
;st Y+, SysCalcTempX
	st	Y+, SYSCALCTEMPX
;dec SysCalcTempA
	dec	SYSCALCTEMPA
;brne SysStringRead
	brne	SYSSTRINGREAD
	ret

;********************************************************************************

SysStringTables:

StringTable2:
.DB	7,73,76,73,57,51,52,49


StringTable3:
.DB	28,85,78,79,32,65,86,82,32,71,114,97,112,104,105,99,97,108,32,76,67,68,32,83,104,105,101,108,100,0


StringTable4:
.DB	50,71,114,101,97,116,32,67,111,119,32,66,65,83,73,67,32,97,32,99,111,109,112,105,108,101,114,32,102,111,114,32,77,105,99,114,111,99,104,105,112,32,65,86,82,32,38,32,80,73,67,0


StringTable5:
.DB	10,65,112,114,105,108,32,50,48,49,57,0


;********************************************************************************

TABLEIMAGE1:
	mov	SysWORDTempA,SYSSTRINGA
	mov	SysWORDTempA_H,SYSSTRINGA_H
	ldi	SysWORDTempB,99
	ldi	SysWORDTempB_H,34
	rcall	SysCompLessThan16
	sbrs	SysByteTempX,0
	ret
	ldi	SysReadA, low(TableTABLEIMAGE1<<1)
	ldi	SysReadA_H, high(TableTABLEIMAGE1<<1)
	add	SysReadA, SysStringA
	adc	SysReadA_H, SysStringA_H
	lpm
	ret
TableTABLEIMAGE1:
	.DB	98,176,50,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,222,255,255,255,255,255,255,255,255,255,223,223,191,190
	.DB	158,158,125,61,28,28,28,252,219,154,121,57,247,150,85,20,211,146,146,176,17,78
	.DB	143,78,139,45,171,9,106,106,200,102,103,102,37,228,228,228,196,228,37,71,103,135
	.DB	200,107,9,74,237,172,78,79,208,17,82,212,53,118,215,57,155,252,61,93,93,126,158,223
	.DB	223,223,223,223,223,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,223,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,222,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,190,125,187,57,183,20,146,48,77,203,73,199,102,69,69,37,37,4,228
	.DB	228,228,228,228,196,163,131,163,131,131,163,99,131,98,98,66,66,34,34,34,1,1,1,33
	.DB	1,1,1,34,34,34,34,66,34,99,99,34,66,99,99,131,131,131,163,164,131,196,37,135,41,236
	.DB	175,114,244,183,89,252,93,126,125,158,190,191,223,223,223,223,255,255,255,255
	.DB	222,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,222,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,190,158,28,251,186,89,57,215,215,150,118,85,20,211,146
	.DB	81,240,175,78,236,139,41,167,102,4,227,227,195,195,195,98,98,99,66,34,34,2,2,2
	.DB	2,2,1,1,2,2,34,2,1,1,34,2,2,1,2,34,34,34,34,34,34,1,34,67,66,66,67,66,67,66,66,98
	.DB	131,163,131,196,134,106,174,211,182,219,60,126,158,222,222,255,255,255,255,255
	.DB	223,223,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,222,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,223,223,223,190,191,190,191,190,190,190,190,158,158
	.DB	126,126,126,94,93,93,61,61,28,154,121,215,150,20,114,16,142,204,74,168,5,132
	.DB	131,131,99,99,66,99,99,66,34,66,67,34,34,1,1,1,1,34,1,1,2,1,1,34,2,1,1,2,1,1,1,2
	.DB	2,1,1,1,1,1,1,66,98,130,163,196,232,78,212,89,93,157,157,190,223,223,255,223
	.DB	223,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,222,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,223,223,223,223,223,223,223,223,223,223,223,223,223
	.DB	223,223,222,222,222,223,190,191,158,191,190,158,158,158,126,158,126,126,61,220
	.DB	122,216,53,146,240,45,73,102,196,131,131,99,34,34,66,1,1,1,1,1,2,1,1,2,2,1,34,2
	.DB	2,2,2,1,2,1,2,2,2,2,2,2,2,34,66,66,34,34,67,99,228,203,211,154,125,190,191,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,222,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,223,255,255,255,255,255,255,255,255,255,255,255
	.DB	223,223,191,190,158,126,125,61,155,216,53,17,204,167,196,98,131,131,98,99,66,66
	.DB	67,34,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,34,66,130,227,40,244,60,158
	.DB	158,222,255,255,255,255,255,255,255,255,254,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,222,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,223,223,223,223,223,190,190,158,158,126,126,252,90,151,115,111,9,37,163
	.DB	99,66,66,34,1,2,1,1,1,1,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,34,34,66,98,196,45
	.DB	57,93,190,223,255,255,255,255,255,255,254,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,222,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,223,223,191,191,158,93
	.DB	251,24,244,175,41,228,131,98,98,66,66,66,34,2,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	.DB	1,34,34,66,131,106,248,126,191,223,255,255,255,255,254,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,222,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,223
	.DB	223,223,191,191,159,159,126,29,90,212,110,167,163,131,67,2,2,1,34,2,1,2,2,2,34,2
	.DB	34,1,2,2,2,2,2,1,1,2,34,34,66,98,162,138,187,158,223,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,222,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	222,255,255,255,255,255,255,255,255,223,255,223,158,190,158,93,122,179,172,38
	.DB	99,98,66,34,34,34,2,1,1,1,1,2,2,1,2,2,2,1,1,2,2,2,1,1,33,130,163,86,126,223,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,222,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,222,255,255,255,255,255,255,255,255,255,255,255,223,222,222
	.DB	190,158,126,61,57,82,232,131,99,1,1,66,1,34,1,2,2,1,34,2,1,2,2,2,2,1,1,1,1,66
	.DB	98,164,78,126,223,255,223,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,222,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,222,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,223,255,223,158,61,216,111,70,99,66,66,34,2,2,2,2
	.DB	2,1,1,2,3,2,2,2,1,2,2,2,1,34,98,77,126,191,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,222,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,222,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,222,190,190,158,126
	.DB	248,13,228,99,1,34,1,1,1,1,2,3,2,2,2,2,2,2,2,1,34,2,34,131,179,126,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,222
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,222,255,255,255,255,255,255,255,255,255,255,255,255,223,255,255,255
	.DB	223,255,255,255,255,223,191,126,187,49,70,66,66,66,34,2,2,2,2,1,1,2,2,3,2,35,1,1
	.DB	2,2,131,121,189,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,222,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,222,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,223,223,190,158,60,147,70,67,35,34
	.DB	1,34,1,1,1,2,2,2,3,1,2,1,1,67,34,203,60,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,222,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,222,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,223,158,29,114,164,67,66,34,33,1,1,1,2,2,2,2,2,1,1,1,99,163,182,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,223,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,223,255,223,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,223,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,222,223,157,61,172,132,67,1,2,2,2,2,2
	.DB	2,2,2,2,2,1,33,130,174,223,255,254,255,255,223,158,158,158,158,158,158,223,255,255
	.DB	255,255,255,255,255,255,255,255,255,223,191,191,191,191,255,255,255,255,223,158
	.DB	159,158,158,158,190,190,222,255,255,255,222,255,223,255,255,255,255,255,223,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,223,255,223,223,255
	.DB	255,255,255,223,255,255,255,255,255,255,255,255,255,255,255,255,223,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,190,94,83,131,99,2,2,2,2,1,1,2,2,3,2,1,33,65,41,255,255,255,255,222,218,174
	.DB	175,175,175,16,52,28,190,223,255,255,255,255,255,255,255,255,255,125,113,180
	.DB	220,190,222,255,255,255,59,239,175,207,175,17,211,27,157,223,223,255,255,60,174,48
	.DB	48,15,146,117,125,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,125,174,239,48,16,145,117,190,255,255,223,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,223,255,255,255,255,222,157,57,4,99,2,2,2,1,1,2,2,2,2,1,33,2
	.DB	229,255,255,255,223,190,211,98,98,99,98,98,163,36,24,191,255,255,255,255,255,255
	.DB	255,255,222,23,4,164,196,149,189,222,255,255,56,4,130,98,131,132,163,227,182,191
	.DB	255,255,223,19,0,162,162,162,130,130,65,24,223,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,222,117,64,129,194,162,65,97,32,89,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,254,255,254,157,28,199,98,1,1,34,2,2,2,2
	.DB	2,1,1,34,165,255,255,255,191,93,138,99,34,34,35,67,66,66,37,61,255,255,255,255
	.DB	223,255,255,255,190,81,130,98,131,228,89,191,255,255,28,228,98,66,34,34,34,66
	.DB	196,219,223,255,255,202,64,195,162,194,194,194,97,162,93,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,11,64,227,130,195,195
	.DB	227,97,129,60,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,223,255,255,191,255,255,255,255,255
	.DB	158,251,199,34,1,33,1,2,2,2,2,2,2,34,38,255,255,255,191,56,163,66,2,2,3,2,2,1
	.DB	163,154,255,255,255,255,223,255,255,255,158,8,33,1,66,130,244,191,255,223,159,215
	.DB	163,164,67,99,132,99,196,215,190,255,60,97,194,129,227,195,194,195,227,97,24,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,223,255,59,162,162
	.DB	194,194,195,162,162,227,65,121,223,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	223,255,255,255,255,190,153,98,2,33,34,2,2,2,2,2,35,66,41,223,255,255,158,146
	.DB	130,65,34,35,2,2,34,33,4,28,255,255,255,255,223,255,255,223,90,163,1,33,65,228
	.DB	25,190,223,223,191,158,125,248,244,146,82,82,49,60,255,255,246,64,194,3,129,195
	.DB	194,194,194,162,28,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,223,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,117,32,194,194,194,194,162,195,162,162,28,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,191,255,255,255,255,223,125,211,98,33,1,2,2,2,2,2,35,98
	.DB	207,255,255,255,125,106,65,33,2,2,2,1,34,65,12,158,255,255,255,255,223,255,223,159
	.DB	179,66,1,1,65,200,61,158,223,29,187,219,60,61,60,93,93,125,158,223,255,255,108,64
	.DB	194,162,194,195,194,162,97,138,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,190,125,92,93,93,60,93,93,93,60,92,125,190,255,255
	.DB	223,255,255,255,255,109,64,194,194,162,226,162,162,65,203,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,93,93,93,93,93,93,93,93,92,60,92
	.DB	125,190,255,255,255,255,255,190,93,60,92,93,93,93,93,93,125,125,93,61,61,92,125,125
	.DB	93,61,61,158,255,255,255,255,190,60,8,65,1,2,2,2,2,2,2,163,84,254,254,223,154,131
	.DB	2,2,35,3,2,2,33,129,52,158,223,255,255,255,255,255,222,93,138,98,0,1,98,49,158,223
	.DB	93,134,163,196,163,163,37,203,88,157,222,255,255,190,36,130,163,195,162,194,194,162
	.DB	64,243,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,149
	.DB	170,68,194,195,227,227,3,227,4,227,227,195,194,4,243,255,255,255,255,255,158,3
	.DB	130,194,194,194,226,162,195,64,85,255,255,223,255,255,255,255,255,255,255,255
	.DB	255,190,211,138,68,194,227,227,227,227,4,195,227,195,3,227,162,4,142,223,255,255
	.DB	255,113,65,227,227,227,227,227,195,227,195,227,195,195,195,227,227,227,227,227
	.DB	163,195,105,93,255,255,223,158,85,97,33,1,2,3,2,1,98,101,218,254,222,190,118,66
	.DB	2,3,2,2,2,1,65,194,185,191,255,255,255,255,255,255,190,121,195,33,34,1,99,89
	.DB	223,190,215,131,1,1,2,34,66,97,227,218,254,255,255,23,97,195,195,194,194,194
	.DB	194,195,65,219,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,52,3,65
	.DB	162,162,162,227,162,195,162,162,130,97,195,194,194,98,97,121,255,255,93,174,170,129
	.DB	194,226,129,226,194,194,129,162,76,15,141,142,174,12,203,190,255,255,255,255
	.DB	243,162,65,97,162,162,227,227,162,195,162,130,32,0,162,195,194,130,32,211,255,255
	.DB	255,199,97,194,162,162,195,162,195,130,195,162,129,0,0,0,0,0,129,195,163,195,0,109
	.DB	255,255,223,223,28,4,1,2,2,2,1,34,98,48,124,255,254,125,44,65,1,2,2,2,2,1,98,12
	.DB	157,223,255,223,255,255,223,255,190,212,131,34,34,1,103,126,223,157,239,66,34,1
	.DB	1,1,1,66,162,239,190,255,255,80,32,98,196,162,194,194,194,97,231,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,222,203,65,162,195,162,130,194,162
	.DB	194,162,97,69,44,145,69,130,227,162,129,52,223,190,162,0,97,162,195,162,194,194
	.DB	194,195,227,162,64,32,32,64,32,0,174,255,255,255,60,40,64,130,227,194,227,194
	.DB	162,195,162,65,134,109,146,117,72,129,162,194,130,174,255,223,89,64,195,195,162,194
	.DB	194,162,130,227,97,227,15,19,178,242,210,182,44,129,195,162,162,72,255,255,255,255
	.DB	126,171,66,35,2,2,2,1,130,121,222,255,223,252,37,98,1,1,2,2,2,1,66,113,60,126
	.DB	158,94,126,93,158,158,28,204,34,2,2,66,143,158,223,60,231,67,2,1,1,2,2,2,131,239
	.DB	157,255,255,198,97,228,130,195,162,162,227,0,113,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,157,36,97,162,162,162,194,227,162,227,65,195,117,223
	.DB	255,92,195,130,162,162,97,186,255,174,32,133,227,195,130,194,162,194,194,194
	.DB	162,194,36,3,36,3,162,113,255,255,255,121,130,65,227,195,162,195,162,194,227,65
	.DB	69,24,255,255,255,255,72,65,195,195,0,85,223,255,16,65,194,162,195,195,194,194
	.DB	194,97,138,158,255,255,255,255,255,255,48,32,194,227,32,141,255,255,255,255,158,114
	.DB	98,2,3,34,33,65,77,157,254,255,191,151,131,34,1,2,2,2,2,2,34,70,167,135,135,167
	.DB	167,135,168,135,134,98,34,1,34,99,118,158,158,23,163,34,2,1,1,2,3,2,99,24,190,223
	.DB	186,97,194,194,194,194,194,162,162,64,88,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,199,32,194,162,227,162,194,162,194,65,36,28,255,255,255,84,32,162
	.DB	227,97,166,223,255,93,255,88,97,194,194,162,194,194,162,194,129,247,255,190,157,125
	.DB	223,223,255,223,125,65,97,162,195,194,195,162,195,227,32,72,255,255,255,255,255,218
	.DB	97,162,195,194,97,28,255,223,40,97,194,194,194,162,162,194,64,105,255,255,255,255
	.DB	255,255,255,190,68,162,162,227,65,117,255,255,255,255,158,211,131,35,2,1,66,195
	.DB	89,190,255,223,159,143,99,34,1,2,1,2,2,2,34,131,99,66,99,99,99,99,99,99,98,1,1,34
	.DB	66,4,219,158,158,114,66,34,2,1,1,2,3,35,229,28,222,255,211,32,194,194,194,194
	.DB	162,195,97,68,157,255,255,255,255,255,255,255,255,255,255,255,255,138,0,227,194,162
	.DB	162,194,194,162,130,65,60,255,255,255,222,11,64,162,162,65,206,255,222,255,255,52
	.DB	32,162,162,162,227,162,194,129,36,222,255,255,255,255,255,255,255,255,231,32
	.DB	227,227,162,194,162,162,194,97,231,222,255,255,255,255,255,178,65,162,162,97,40,223
	.DB	255,219,130,162,194,227,194,194,194,162,64,88,255,255,255,255,255,255,255,121
	.DB	64,194,194,130,97,92,255,255,255,255,126,211,131,34,2,33,130,48,157,222,255,223
	.DB	93,167,33,34,2,1,34,1,67,67,135,203,203,236,172,172,204,204,204,236,70,2,2,2,66,76
	.DB	157,223,94,74,34,2,2,1,1,1,1,98,45,157,255,255,138,65,162,226,194,194,162,195
	.DB	65,142,255,255,255,255,255,255,255,255,255,255,255,255,149,32,195,194,162,194
	.DB	194,227,162,194,0,149,255,255,255,255,247,129,162,195,194,32,23,255,255,223,255,72
	.DB	129,162,194,195,130,195,227,32,206,255,255,255,255,255,223,255,255,211,0,227
	.DB	194,162,194,194,226,162,227,32,88,222,255,255,255,255,255,198,129,194,162,65
	.DB	146,255,223,20,32,227,194,162,162,194,194,129,227,157,255,255,223,255,255,255
	.DB	255,80,0,195,195,97,203,223,255,255,255,255,159,179,66,34,34,65,69,60,223,255
	.DB	255,190,88,163,0,2,2,1,1,34,2,132,119,61,93,94,94,94,61,126,61,219,167,35,2,34
	.DB	98,149,157,191,155,131,34,2,2,34,1,34,66,98,20,190,255,187,98,195,162,162,194,194
	.DB	195,194,64,247,255,255,255,255,255,255,255,255,255,255,255,255,199,97,195,162
	.DB	162,194,194,162,194,129,133,190,255,255,255,145,32,162,194,162,65,69,222,255
	.DB	255,255,251,129,194,162,195,162,227,130,227,64,247,255,255,255,255,255,255,223
	.DB	190,227,130,194,162,194,194,194,194,194,65,105,255,255,255,255,255,255,186,97
	.DB	161,194,227,64,186,255,255,138,129,162,227,194,195,162,194,65,44,255,255,255
	.DB	255,255,255,255,255,231,130,162,162,32,243,255,255,255,255,255,158,207,66,33,65,162
	.DB	215,158,255,255,255,125,113,130,33,1,2,1,34,1,34,70,220,158,191,223,223,222,222,223
	.DB	126,247,131,34,2,1,163,187,223,158,20,99,2,2,2,2,1,33,33,195,154,158,255,210,32,195
	.DB	162,194,162,194,162,130,68,190,255,255,255,255,255,255,255,255,255,255,255,154
	.DB	64,162,194,195,162,195,194,194,194,162,133,44,170,170,68,97,194,194,227,129,0,150
	.DB	255,255,255,255,20,64,194,162,162,195,162,162,162,227,125,255,255,255,255,255
	.DB	255,255,56,32,194,162,194,194,194,162,195,194,32,243,255,255,255,255,255,255
	.DB	211,32,226,162,97,40,223,255,60,162,162,194,194,194,194,162,194,33,118,255,255,255
	.DB	255,255,255,255,186,97,162,162,162,97,218,255,255,255,255,255,125,41,33,33,130,179
	.DB	126,223,255,255,255,60,105,97,33,2,3,2,1,0,99,78,126,223,255,255,255,255,255,255
	.DB	158,240,98,34,34,33,73,126,223,125,77,66,2,2,2,2,1,1,98,171,93,191,255,137,64,195
	.DB	162,130,227,195,194,65,109,255,255,255,255,255,255,255,255,255,255,255,255,146
	.DB	65,195,162,162,194,194,162,194,162,227,129,64,32,32,162,162,194,129,129,97,239,255
	.DB	255,255,255,255,77,64,194,162,194,162,162,195,65,235,255,255,255,255,255,255
	.DB	255,255,44,65,162,162,162,162,194,162,162,195,130,182,223,255,255,255,255,255
	.DB	138,97,194,195,32,146,255,255,182,64,194,194,194,194,194,194,162,130,28,223,255,255
	.DB	255,255,255,223,52,32,195,162,129,198,255,255,255,255,255,254,250,163,1,97,105,125
	.DB	223,223,255,255,255,24,4,66,2,3,2,2,1,1,66,117,190,223,255,255,255,255,255,255
	.DB	126,9,66,2,34,66,81,158,190,218,37,67,2,2,2,1,1,2,99,211,158,223,93,162,162,195
	.DB	227,162,162,194,162,64,149,255,223,255,255,255,255,255,255,255,255,255,255,105
	.DB	97,162,227,162,195,162,162,194,162,162,198,7,198,40,231,231,199,7,11,24,223,255
	.DB	255,223,255,125,162,162,162,194,162,162,162,227,32,20,255,255,255,255,255,223
	.DB	255,158,36,129,194,194,162,162,194,162,162,194,129,24,255,255,255,223,255,93
	.DB	162,162,130,194,64,121,223,255,142,64,194,162,194,194,162,194,97,73,255,255,255,255
	.DB	255,255,255,255,202,64,162,194,97,80,255,255,255,255,255,222,117,98,66,227,186,222
	.DB	255,255,255,255,255,179,66,34,2,2,3,1,0,1,130,251,255,255,255,255,255,255,255,223
	.DB	187,98,1,34,34,196,24,157,189,84,163,67,2,2,2,2,34,2,164,154,223,223,86,65,194,162
	.DB	130,195,194,195,130,129,60,255,255,255,255,255,255,255,255,223,255,255,60,162
	.DB	194,162,194,194,130,195,194,194,194,97,81,223,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,222,247,97,195,194,195,162,194,194,130,130,219,255,255,255,255
	.DB	255,255,255,24,97,194,194,194,194,162,162,162,194,162,64,20,255,190,255,255,255,150
	.DB	32,162,227,97,166,190,255,190,4,97,194,195,194,162,227,194,0,243,255,255,255,223
	.DB	255,255,255,251,129,162,227,162,32,88,255,255,255,255,223,125,202,163,65,88,190,222
	.DB	255,255,255,255,255,41,99,2,2,3,3,33,32,97,170,126,255,255,255,255,255,255,255,191
	.DB	212,131,1,1,99,200,93,189,157,235,98,34,2,1,1,1,34,66,106,157,255,255,77,65,226,162
	.DB	194,227,162,162,64,77,223,223,255,190,255,255,255,255,255,255,255,223,251,98
	.DB	162,194,194,162,195,162,194,194,194,129,227,154,255,190,255,255,223,255,255,255
	.DB	255,255,255,255,255,44,65,194,162,194,194,162,162,32,77,255,223,255,255,255,255,223
	.DB	255,150,97,194,194,162,194,162,162,162,195,162,97,69,251,255,222,255,255,44,65,162
	.DB	162,64,239,255,255,24,97,227,194,194,194,194,194,130,130,252,255,223,255,255
	.DB	223,255,251,68,130,195,162,129,68,190,255,255,255,255,190,88,227,195,150,126
	.DB	223,255,255,255,255,255,255,37,98,2,2,3,2,1,65,130,84,158,223,255,255,255,255,255
	.DB	255,158,114,98,33,1,67,82,158,222,157,138,130,34,2,2,1,2,34,98,179,189,254,223
	.DB	73,97,161,194,194,161,194,227,97,174,27,24,24,56,56,24,24,24,56,150,28,255,190,69
	.DB	97,227,195,130,162,195,194,162,162,195,130,32,174,182,24,88,121,56,24,24,190,255
	.DB	255,255,255,8,130,194,227,162,195,162,195,97,174,219,56,150,187,255,223,255,255,251
	.DB	32,194,162,194,194,162,194,194,162,195,195,130,64,15,210,157,223,195,129,194
	.DB	227,32,247,255,255,85,32,195,194,194,162,195,162,97,69,56,121,24,24,89,24,16
	.DB	130,97,195,162,162,32,206,255,255,255,255,223,158,44,226,178,125,223,255,255
	.DB	255,255,255,255,255,80,130,34,2,2,2,1,66,195,186,190,255,255,255,255,255,255
	.DB	255,222,56,194,97,66,98,183,223,222,157,145,162,66,2,2,2,35,35,196,24,125,255,255
	.DB	211,0,194,162,194,194,162,162,194,162,32,65,97,32,33,32,97,65,32,0,28,223,255,117
	.DB	0,130,194,194,194,195,162,195,194,162,227,194,65,97,97,97,64,65,0,105,255,255
	.DB	255,255,255,52,0,129,194,162,162,195,130,194,227,65,64,0,154,255,255,255,190,255
	.DB	81,0,194,194,194,162,194,162,130,162,227,162,227,97,0,157,186,32,194,194,129,227
	.DB	190,223,255,28,130,97,194,227,162,194,195,162,227,97,64,97,32,32,97,130,162,162
	.DB	162,162,162,65,150,223,255,255,223,158,248,4,239,125,190,223,223,255,255,255
	.DB	255,223,255,59,76,195,66,131,67,99,164,203,125,223,255,255,255,255,255,255,223,255
	.DB	157,210,195,130,69,93,255,255,223,125,239,131,99,99,131,67,164,41,93,191,223,255
	.DB	255,109,162,129,97,129,130,130,194,129,162,129,97,130,130,130,130,65,0,215,255,255
	.DB	255,255,48,97,97,162,130,130,162,130,130,162,130,129,162,130,130,97,130,65,97,60
	.DB	255,255,255,255,255,223,207,227,97,129,162,129,162,129,129,97,0,20,255,255,223,255
	.DB	255,255,255,203,129,129,162,130,130,162,130,130,129,129,97,64,149,255,16,32,195,194
	.DB	97,11,255,255,255,255,247,227,129,129,162,130,130,162,130,129,129,162,129,162
	.DB	130,129,130,130,130,130,97,97,60,255,255,255,223,61,102,236,93,157,255,255,255,255
	.DB	255,255,255,255,255,191,158,219,215,53,85,53,244,187,190,255,255,255,255,255
	.DB	255,255,255,255,223,158,60,150,56,191,255,255,255,223,190,187,215,117,85,85,52,57
	.DB	223,255,223,255,255,255,93,24,117,118,118,150,150,150,150,150,150,150,150,150
	.DB	85,117,251,255,255,255,255,255,255,251,150,117,149,117,150,149,149,150,150,150
	.DB	150,150,150,149,117,247,93,255,255,255,255,255,223,255,255,93,56,150,117,150
	.DB	117,150,117,117,186,255,255,255,255,255,255,255,255,255,186,117,117,149,150,150
	.DB	150,150,149,150,149,27,255,223,101,129,194,194,32,150,255,223,255,255,255,190
	.DB	89,150,149,149,149,182,149,149,149,149,149,149,149,150,150,150,150,117,52,56
	.DB	255,255,255,223,158,110,232,126,223,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,222,190,190,190,223,191,255,255,223,255,255,255,255,255,255,255,255,255
	.DB	255,158,223,255,255,255,255,255,255,223,222,222,190,190,190,223,255,223,255,255
	.DB	223,255,255,223,255,255,223,255,255,255,255,255,255,255,255,223,255,255,255,255
	.DB	223,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,223
	.DB	255,255,255,255,223,255,255,255,255,223,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,121,162,194,194,162,162,60,223,255,255,255,255,255,255,255,255,223
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,223
	.DB	182,8,60,158,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,254,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,223,255
	.DB	255,255,255,255,255,255,255,255,223,223,223,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,222,255,255,255,255,255
	.DB	255,255,255,255,223,255,255,255,255,255,255,255,255,255,255,255,255,255,255,113
	.DB	64,194,194,97,137,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,223,255,255,255,255,255,219,142,92,189,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,223,255,223,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,223,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,222,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,223,255,223,255,72,97,195,195,32,52,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,158,150,93,222,255,222,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,222,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,223,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,251,97,194,162,195,97,251,255,223,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,223
	.DB	223,255,255,223,251,157,222,255,223,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,223,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,222,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,223,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,222,255,211,64,227,195,65,198,222,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,223,223
	.DB	190,255,255,255,255,255,223,255,255,255,254,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,223,255,255,255
	.DB	255,255,254,255,255,255,255,255,255,255,255,255,255,255,255,255,223,255,255,255
	.DB	255,255,255,255,223,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,223,255,255,255,223,49,228,138,170,202,235,203,170,105,72,72,137,73,3,194
	.DB	194,162,0,243,255,255,255,255,255,255,255,223,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,223,255,255,255,223
	.DB	255,255,223,255,254,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,223,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,222,255,255,255
	.DB	255,20,0,97,65,32,32,32,97,162,227,194,194,194,162,195,162,0,235,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	222,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,222,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,44,0,129,130
	.DB	129,97,130,129,129,129,129,129,130,97,129,77,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,222,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,222
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,239,36,4,101,69,101,101,101,69
	.DB	69,166,105,15,218,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255

;********************************************************************************

TABLEIMAGE1_H:
	mov	SysWORDTempA,SYSSTRINGA
	mov	SysWORDTempA_H,SYSSTRINGA_H
	ldi	SysWORDTempB,99
	ldi	SysWORDTempB_H,34
	call	SysCompLessThan16
	sbrs	SysByteTempX,0
	ret
	ldi	SysReadA, low(TableTABLEIMAGE1_H<<1)
	ldi	SysReadA_H, high(TableTABLEIMAGE1_H<<1)
	add	SysReadA, SysStringA
	adc	SysReadA_H, SysStringA_H
	lpm
	ret
TableTABLEIMAGE1_H:
	.DB	34,0,0,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,247,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,254,254,254,254,254,253,253,253,253,252,252,252,251,252,251
	.DB	251,251,250,251,250,250,250,250,249,249,249,249,249,240,240,240,240,240,249,249
	.DB	249,249,249,250,250,250,250,250,251,251,251,252,252,252,253,253,253,254,254,254
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,247,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,238,230,221,205,196,188,171,170,154
	.DB	137,137,129,137,137,145,145,152,152,160,160,160,168,176,176,176,176,184,192,184
	.DB	192,192,200,208,208,208,216,216,216,216,216,216,216,216,216,216,216,216,208,208
	.DB	200,208,208,192,200,192,192,192,192,184,184,184,168,168,177,185,194,202,219,236
	.DB	244,253,254,254,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,247,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,247,246,246,238,238,229,229,229,229,229,221,220,220
	.DB	220,211,211,203,202,194,178,169,161,161,160,168,168,176,184,184,192,200,200,208
	.DB	216,216,216,224,224,224,224,224,224,224,224,224,216,216,224,224,216,216,216,224
	.DB	216,216,216,216,216,208,208,216,208,208,208,200,200,200,192,192,192,184,184,192
	.DB	209,226,251,252,253,254,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,247,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,254,254,253,253,253,252,252,243,234,226,209,193,184,184,192
	.DB	192,192,192,200,200,200,200,208,216,216,216,216,224,224,224,232,224,224,232,224
	.DB	224,232,232,224,224,224,224,224,224,224,224,224,224,224,216,216,216,208,200,184
	.DB	176,168,193,219,252,254,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,247,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,254,254,253,245,236,227,203
	.DB	186,177,168,176,192,200,200,216,224,224,224,224,224,224,224,224,224,232,224,224
	.DB	232,224,224,224,224,224,232,232,232,232,224,224,216,216,216,208,208,208,200,200
	.DB	192,184,184,226,252,254,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,247,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,254,253
	.DB	253,252,234,209,184,184,192,192,192,208,200,208,216,216,216,224,224,224,224,224
	.DB	232,232,232,232,232,232,224,224,224,224,224,224,224,224,224,232,232,224,216,200
	.DB	192,168,186,244,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	247,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	254,254,253,236,211,186,177,176,184,192,208,216,224,224,232,224,224,224,224,224
	.DB	224,232,232,224,224,224,224,224,224,224,224,224,224,224,224,216,216,208,200,184
	.DB	184,235,254,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,247,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,254,254,252,251,218,192,192,192,200,200,208,216,216,216,224,232,232,224
	.DB	224,224,224,224,232,224,224,224,224,232,224,224,224,232,224,224,216,200,176,202
	.DB	253,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,247,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,254,244,219,177,176,192,208,216,224,216,224,224,224,224,224,224
	.DB	224,224,224,224,224,232,224,224,224,232,232,224,216,216,208,200,184,218,254,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,247,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,247,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,254,252,234,201,184,192,192,208,216,224,224,224,216,224,224,224
	.DB	224,224,224,224,224,232,232,224,224,224,224,224,216,200,160,253,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,247,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,247,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,254,244,193,176,200,208,224,232,224,224,224,224,224,224,232,232
	.DB	224,232,232,224,224,224,224,224,224,208,200,192,235,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	247,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,247,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,253,243,201,184,192,208,216,216,224,224,224,232,232,232,232,224,224
	.DB	224,224,224,224,224,224,216,216,184,211,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,247,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,247
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,253,211,168,192,208,224,224,224,224,224,232,232,224,224,224,224,224,224
	.DB	224,216,224,224,208,184,252,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,247,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,247,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	254,252,193,192,208,216,224,224,232,232,224,224,224,224,224,224,224,232,224,224
	.DB	224,208,176,254,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,247,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,247,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,252
	.DB	177,184,208,224,216,224,224,224,232,224,224,224,224,216,224,224,224,224,192,202
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,247,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,247,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,252,176,192
	.DB	208,216,224,232,232,224,224,224,224,224,224,224,224,224,216,168,253,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,247,255,255,255,210,184,208,224,232
	.DB	232,224,224,224,224,224,224,232,232,232,216,192,251,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,247,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,252,176,208,216,224,224,224,224
	.DB	224,224,224,232,232,232,224,200,250,255,255,255,255,255,254,227,251,251,251,252
	.DB	253,255,255,255,255,255,255,255,255,255,255,255,255,255,220,252,254,255,255,255
	.DB	255,255,255,219,243,251,251,252,252,255,255,255,255,255,255,239,123,140,140,132
	.DB	148,181,247,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,239,123,131,140,132,148,181,247,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,254,161,208,224,224,224,224,224,232,224,224
	.DB	224,224,224,208,232,255,255,255,255,255,236,168,208,208,192,192,176,161,254,255
	.DB	255,255,255,255,255,255,255,255,255,254,161,168,160,253,255,255,255,255,254,169
	.DB	192,192,200,192,176,152,253,255,255,255,255,173,8,24,24,24,16,16,8,198,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,173,8
	.DB	24,24,24,16,16,8,206,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,247,255
	.DB	255,255,255,201,200,216,224,232,224,232,224,224,224,224,216,216,224,255,255,255
	.DB	255,255,202,192,216,216,216,216,208,200,177,255,255,255,255,255,255,255,255,247
	.DB	255,252,184,200,192,160,254,255,255,255,255,160,200,208,216,216,208,200,168,254
	.DB	255,255,255,98,16,32,24,32,24,24,16,16,239,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,99,8,32,24,32,32,32,16,16,239,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,254,185,208,232,224
	.DB	216,224,224,224,224,224,216,216,241,255,255,255,255,254,168,208,224,224,224,224
	.DB	224,224,184,254,255,255,255,255,255,255,255,255,255,210,208,216,208,176,252,255
	.DB	255,255,255,253,168,192,192,192,200,192,168,253,255,255,239,16,32,24,32,32,32,32
	.DB	32,16,198,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,231,16,24,32,32,32,24,24,32,16,214,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,254,184,224,216,224,224,224,224,224,224,216,208
	.DB	250,255,255,255,255,252,192,216,224,224,224,232,224,216,185,255,255,255,255,255
	.DB	255,255,255,255,254,184,216,224,208,176,254,255,255,255,255,255,255,253,244,236
	.DB	236,244,220,255,255,255,189,16,32,41,24,32,32,24,24,24,231,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,173,8,32,32,32,32,32,32,24
	.DB	24,239,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,252,184,208,224,224,224,224,224,224,216,192,251,255,255,255,255,226,208,216
	.DB	224,216,224,224,224,200,235,255,255,255,255,255,255,255,255,255,244,192,224,232
	.DB	200,185,255,255,255,255,254,254,255,255,255,255,255,255,255,255,255,255,107,16
	.DB	32,32,32,32,32,24,16,82,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,247,239,239,239,239,239,239,239,239,239,247,255,255,255
	.DB	255,255,255,255,255,115,8,32,32,24,32,32,32,16,98,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,239,239,239,239,239,239,239,239,239,239,239
	.DB	247,255,255,255,255,255,255,247,239,239,239,239,239,239,239,239,231,231,239,247
	.DB	247,239,239,231,239,247,247,255,255,255,255,255,255,255,202,200,224,224,224,224
	.DB	224,224,208,176,253,255,255,255,254,192,224,224,224,224,224,232,216,184,253,255
	.DB	255,255,255,255,255,255,255,255,202,200,224,232,200,236,255,255,255,169,184,192
	.DB	184,192,193,226,254,255,255,255,255,255,41,24,32,32,24,32,32,24,8,164,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,181,90,49,32,32,32,32
	.DB	33,32,33,32,32,32,24,33,164,255,255,255,255,255,247,33,24,32,32,32,32,24,32,16
	.DB	181,255,255,255,255,255,255,255,255,255,255,255,255,255,156,82,41,24,32,32,32,32
	.DB	33,24,32,32,33,32,24,33,115,255,255,255,255,148,8,32,32,32,32,32,32,40,32,32,32,40
	.DB	40,40,32,32,32,40,32,24,74,231,255,255,255,255,253,184,224,216,224,224,224,224
	.DB	208,177,254,255,255,255,253,200,232,224,216,224,224,224,208,168,254,255,255,255
	.DB	255,255,255,255,255,254,168,200,232,224,192,254,255,255,253,184,216,216,224,232
	.DB	216,184,152,254,255,255,255,198,16,32,32,32,32,32,32,32,16,222,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,173,41,16,24,24,32,32,32,32,24,24
	.DB	16,16,32,32,32,24,16,214,255,255,239,123,90,24,32,32,24,32,32,32,24,32,115,140
	.DB	115,115,123,99,90,247,255,255,255,255,164,24,16,16,24,24,32,32,24,24,24,24,8,8
	.DB	24,32,24,24,8,164,255,255,255,65,16,24,24,24,32,32,40,24,32,24,16,8,8,0,8,0,24,32
	.DB	32,24,0,107,255,255,255,255,255,193,216,224,224,224,224,232,192,236,255,255,255,255
	.DB	211,200,224,224,224,224,232,232,208,211,255,255,255,255,255,255,255,255,255,252
	.DB	192,216,232,216,209,255,255,255,227,192,232,232,232,224,216,216,176,203,255,255
	.DB	255,140,8,32,40,32,32,32,32,16,65,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,98,16,32,32,32,24,32,32,32,24,16,49,107,156,49,24,32,32,24,173
	.DB	255,255,24,0,16,24,32,32,32,32,32,32,32,24,8,8,8,8,8,0,115,255,255,255,239,74
	.DB	16,24,32,32,32,32,24,32,24,16,57,115,156,181,82,24,24,32,24,123,255,255,214,16
	.DB	32,32,32,32,32,32,32,32,16,32,132,165,148,156,156,181,107,16,32,16,16,74,255,255
	.DB	255,255,255,226,208,224,224,224,224,216,184,254,255,255,255,254,169,208,224,224
	.DB	232,232,224,232,200,252,255,255,255,255,255,255,255,255,255,242,208,224,216,208
	.DB	251,255,255,255,193,208,232,232,232,232,232,224,192,219,255,255,255,57,16,40,32,32
	.DB	32,32,32,8,148,255,255,255,255,255,255,255,255,255,255,255,255,255,247,41,16,24
	.DB	24,32,32,40,32,32,16,32,181,255,255,247,32,24,32,24,16,222,255,123,8,49,32,32
	.DB	24,32,32,32,32,32,24,24,41,33,41,33,24,148,255,255,255,214,24,16,32,32,24,32,32,32
	.DB	32,16,49,198,255,255,255,255,82,16,32,32,8,181,255,255,140,16,32,32,32,32,32,32
	.DB	32,16,82,247,255,255,255,255,255,255,140,0,24,32,8,115,255,255,255,255,255,252
	.DB	192,216,232,232,216,200,243,255,255,255,255,253,176,216,232,224,224,224,232,224
	.DB	216,225,217,209,201,209,209,201,209,201,209,208,224,224,216,184,253,255,255,254
	.DB	176,208,224,232,224,224,232,224,184,254,255,255,214,16,32,32,32,32,32,32,24,16
	.DB	206,255,255,255,255,255,255,255,255,255,255,255,255,255,57,8,32,32,32,32,32,32
	.DB	32,16,41,231,255,255,255,181,16,32,40,16,57,255,255,239,255,206,16,32,32,32,32,32
	.DB	32,32,24,197,255,255,247,247,255,255,255,255,247,16,16,32,32,32,32,32,32,32,8,82
	.DB	255,255,255,255,255,230,16,24,32,32,16,231,255,255,74,16,32,32,32,32,32,32,16,82
	.DB	255,255,255,255,255,255,255,255,49,24,24,32,16,181,255,255,255,255,255,252,192,216
	.DB	232,224,208,168,254,255,255,255,255,243,200,224,232,232,224,232,224,216,208,200
	.DB	192,184,192,192,192,184,192,192,200,216,232,232,208,177,254,255,255,252,192,216
	.DB	224,224,224,224,224,216,192,255,255,255,156,8,32,24,24,32,32,32,16,41,247,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,82,0,32,32,32,32,32,32,32,24,16,239,255
	.DB	255,255,255,99,16,32,32,16,131,255,255,255,255,173,8,24,32,32,32,24,32,16,41,255
	.DB	255,255,255,255,255,255,255,255,65,8,32,32,24,32,32,32,32,16,65,255,255,255,255,255
	.DB	255,156,16,32,24,16,74,255,255,230,16,24,32,32,32,32,32,32,8,198,255,255,255,255
	.DB	255,255,255,214,16,32,32,24,24,239,255,255,255,255,255,252,192,216,224,216,192,236
	.DB	255,255,255,255,255,201,208,224,232,224,232,216,216,200,217,218,202,210,202,202
	.DB	210,202,210,234,209,216,224,224,192,203,255,255,255,226,208,224,224,224,224,224
	.DB	216,200,243,255,255,255,82,16,32,32,32,32,24,32,16,115,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,181,8,32,32,32,32,32,32,24,24,0,181,255,255,255,255,197,16
	.DB	24,32,32,16,198,255,255,255,255,74,24,32,32,32,24,32,32,8,123,255,255,255,255,255
	.DB	255,255,255,164,0,32,32,32,32,32,32,24,32,8,206,255,255,255,255,255,255,57,24,32
	.DB	24,16,156,255,255,165,8,32,24,24,24,32,32,32,32,247,255,255,255,255,255,255,255,148
	.DB	8,32,32,16,98,255,255,255,255,255,255,252,192,216,224,200,185,255,255,255,255,255
	.DB	254,184,216,232,224,224,224,224,208,184,253,255,255,255,255,255,255,255,255,254
	.DB	217,216,224,224,184,253,255,255,254,184,224,224,224,224,224,224,216,184,253,255
	.DB	255,222,16,32,32,32,32,32,32,32,8,197,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,65,16,32,32,32,32,32,32,32,16,49,247,255,255,255,148,8,24,32,32,16,49
	.DB	255,255,255,255,222,16,32,32,32,32,32,24,32,8,189,255,255,255,255,255,255,255
	.DB	255,32,24,32,32,32,32,32,32,32,16,82,255,255,255,255,255,255,214,16,24,32,32,8
	.DB	222,255,255,82,16,24,32,32,32,32,32,24,107,255,255,255,255,255,255,255,255,65
	.DB	24,32,32,16,164,255,255,255,255,255,255,251,200,216,208,176,253,255,255,255,255,255
	.DB	236,192,224,224,224,216,224,232,208,185,254,255,255,255,255,255,255,255,255,253
	.DB	184,216,224,216,184,254,255,255,253,192,224,224,224,232,224,224,200,168,254,255
	.DB	255,156,8,32,32,32,32,32,32,24,41,247,255,255,255,255,255,255,255,255,255,255
	.DB	255,222,16,24,32,32,24,32,32,32,32,24,57,107,90,90,41,16,24,24,32,16,0,181,255,255
	.DB	255,255,165,16,32,32,32,32,32,32,24,32,239,255,255,255,255,255,255,255,206,8,32,32
	.DB	32,32,32,32,32,32,8,164,255,255,255,255,255,255,156,8,32,24,16,74,255,255,239,24
	.DB	24,32,32,32,32,32,32,16,181,255,255,255,255,255,255,255,222,24,32,32,32,24,222,255
	.DB	255,255,255,255,255,226,208,216,192,252,255,255,255,255,255,255,194,200,224,232
	.DB	224,224,216,224,208,227,255,255,255,255,255,255,255,255,255,251,192,216,224,208
	.DB	226,255,255,255,219,200,224,232,224,224,224,224,200,202,255,255,255,90,16,32,24,32
	.DB	40,32,32,16,115,255,255,255,255,255,255,255,255,255,255,255,255,156,16,32,24,32
	.DB	32,32,32,32,32,40,24,16,8,8,24,24,32,16,16,16,123,255,255,255,255,255,107,16,32,32
	.DB	32,32,32,32,16,98,255,255,255,255,255,255,255,255,107,16,24,32,32,32,32,32,32,32
	.DB	24,189,255,255,255,255,255,255,82,16,32,32,8,148,255,255,189,8,32,32,32,32,32,32
	.DB	32,24,239,255,255,255,255,255,255,255,173,8,32,32,24,65,255,255,255,255,255,255
	.DB	254,192,208,192,210,255,255,255,255,255,255,254,177,200,224,224,224,224,224,232
	.DB	192,253,255,255,255,255,255,255,255,255,255,218,208,216,216,192,252,255,255,254
	.DB	177,208,224,224,224,224,224,224,192,252,255,255,239,24,24,32,40,24,24,32,24,16
	.DB	181,255,255,255,255,255,255,255,255,255,255,255,255,82,24,32,40,32,32,32,32,32
	.DB	32,32,65,74,65,74,65,65,65,66,99,198,255,255,255,255,255,247,24,24,24,32,32,32
	.DB	32,32,8,173,255,255,255,255,255,255,255,247,41,24,32,32,32,32,32,32,32,32,24,198
	.DB	255,255,255,255,255,239,24,32,24,32,8,214,255,255,115,8,32,32,32,32,32,32,24,82
	.DB	255,255,255,255,255,255,255,255,90,16,24,32,16,140,255,255,255,255,255,255,253,192
	.DB	208,160,254,255,255,255,255,255,255,252,176,208,224,224,232,224,224,216,184,254
	.DB	255,255,255,255,255,255,255,255,254,184,216,224,200,176,254,255,255,253,184,208
	.DB	224,224,232,224,224,216,184,254,255,255,173,8,32,32,24,32,32,32,24,24,239,255
	.DB	255,255,255,255,255,255,255,255,255,255,231,24,32,32,32,32,24,32,32,32,32,16
	.DB	148,255,255,255,255,255,255,255,255,255,255,255,255,255,255,197,16,32,32,32,32,32
	.DB	32,24,24,230,255,255,255,255,255,255,255,206,16,32,32,32,32,32,32,32,32,32,16,173
	.DB	255,255,255,255,255,189,8,32,40,24,57,255,255,255,41,16,32,32,32,32,32,32,8,164
	.DB	255,255,255,255,255,255,255,230,16,24,32,24,8,206,255,255,255,255,255,255,194,184
	.DB	168,254,255,255,247,255,255,255,255,250,208,216,224,232,232,224,216,200,218,255
	.DB	255,255,255,255,255,255,255,255,244,192,216,224,200,177,255,255,255,226,192,208
	.DB	216,224,224,224,216,200,218,255,255,255,107,16,32,32,32,32,24,24,16,115,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,230,24,24,32,32,32,32,32,32,32,32,24,32,222
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,107,8,32,24,32,32,32,32,16
	.DB	115,255,255,255,255,255,255,255,255,181,16,32,32,32,32,32,32,32,32,32,16,49,230,255
	.DB	255,255,255,107,16,32,32,16,131,255,255,198,16,32,32,32,32,32,32,24,24,238,255,255
	.DB	255,255,255,255,230,49,24,32,32,24,49,255,255,255,255,255,255,254,152,152,253,255
	.DB	255,255,255,255,255,255,255,209,200,216,224,232,224,224,208,176,253,255,255,255
	.DB	255,255,255,255,255,255,228,184,216,216,192,236,255,255,255,210,192,208,224,224
	.DB	224,224,208,184,252,255,255,255,74,16,24,32,32,24,32,32,16,123,239,206,206,206
	.DB	206,206,206,206,206,181,231,255,255,49,16,32,32,24,32,32,32,32,24,32,24,8,123,189
	.DB	206,206,214,206,198,198,255,255,255,255,255,66,16,24,32,32,32,32,32,16,123,230
	.DB	206,181,222,255,255,255,255,230,8,32,24,32,32,32,32,32,32,32,32,24,16,132,156,255
	.DB	255,32,24,32,40,16,197,255,255,181,8,32,32,32,24,32,24,24,49,206,214,206,206,214
	.DB	206,140,24,24,32,32,32,16,131,255,255,255,255,255,255,219,152,244,255,255,255,255
	.DB	255,255,255,255,255,252,176,208,232,224,232,224,208,168,254,255,255,255,255,255
	.DB	255,255,255,255,254,176,208,224,184,253,255,255,255,252,176,216,232,224,232,224
	.DB	208,176,254,255,255,255,156,0,32,32,32,32,32,24,24,24,8,16,16,8,16,8,16,16,8,0
	.DB	231,255,255,181,0,24,32,32,32,32,24,32,32,24,32,32,16,16,16,16,8,8,0,74,255,255
	.DB	255,255,255,173,0,16,24,24,24,32,24,32,32,8,8,0,214,255,255,255,255,255,140,0
	.DB	24,32,32,32,32,32,24,32,32,24,32,16,0,255,222,16,32,32,24,32,255,255,255,231,16,16
	.DB	24,32,24,32,32,24,32,16,16,16,8,8,16,24,24,32,32,32,32,16,189,255,255,255,255,255
	.DB	253,145,235,255,255,255,255,255,255,255,255,255,255,255,211,176,184,200,192,200
	.DB	176,194,255,255,255,255,255,255,255,255,255,255,255,252,168,184,177,255,255,255
	.DB	255,255,235,176,192,192,192,184,176,178,255,255,255,255,255,115,24,24,24,24,24,24
	.DB	24,16,24,16,16,24,24,24,16,16,0,189,255,255,255,255,140,16,16,24,24,24,24,24,24,24
	.DB	24,16,24,24,16,16,16,8,16,239,255,255,255,255,255,255,123,32,16,16,24,24,32,24
	.DB	16,16,0,165,255,255,255,255,255,255,255,90,16,16,24,24,24,24,24,24,16,16,16,8
	.DB	181,255,140,8,32,32,16,99,255,255,255,255,197,32,16,16,24,24,24,24,24,16,16,24
	.DB	16,24,24,24,24,24,24,24,16,16,239,255,255,255,255,255,137,186,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,254,253,253,253,253,228,254,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,253,254,255,255,255,255,255,255,254,253,253
	.DB	253,253,237,246,255,255,255,255,255,255,239,206,181,189,181,181,181,181,181,181
	.DB	181,181,181,189,181,181,222,255,255,255,255,255,255,230,181,181,181,181,181,181
	.DB	181,181,181,181,181,181,181,181,173,189,239,255,255,255,255,255,255,255,255,239
	.DB	206,181,181,189,181,181,181,181,214,255,255,255,255,255,255,255,255,255,214,173
	.DB	181,181,181,181,181,181,181,181,181,231,255,255,49,24,24,32,8,181,255,255,255,255
	.DB	255,247,206,181,181,181,181,189,181,181,181,181,181,181,181,181,181,181,181,181
	.DB	173,198,255,255,255,255,255,211,169,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,247,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,206,24,24,32,24,24,231,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	229,154,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,247,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,140
	.DB	8,24,24,16,82,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,254,163,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,247,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,247,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,74,16,32,32,8,165,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,213,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,247,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,222,16,24,24,32,16,222,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	230,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,247
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,247,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	156,16,32,32,16,57,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,140,32,82,90,90,98,98,90,82,74,74,82,82,41,32,32,32,8,164,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,247,255,255,255,255,165,0,16,16,8,8,8,16,24,32,32
	.DB	32,32,24,32,24,8,106,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,247,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,247,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,107,8,24,24,24,24,24,24,24,24,24,24,24,16,24,115,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,247
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,247,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,131,41,41
	.DB	57,49,57,49,57,49,49,57,82,132,222,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
	.DB	255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255

;********************************************************************************

TABLEIMAGE2:
	cpi	SysStringA, 0
	brlo	PC + 3
	clr	SysByteTempX
	ret
	ldi	SysReadA, low(TableTABLEIMAGE2<<1)
	ldi	SysReadA_H, high(TableTABLEIMAGE2<<1)
	add	SysReadA, SysStringA
	brcc	PC + 2
	inc	SysReadA_H
	lpm
	ret
TableTABLEIMAGE2:

;********************************************************************************

TABLEIMAGE3:
	cpi	SysStringA, 0
	brlo	PC + 3
	clr	SysByteTempX
	ret
	ldi	SysReadA, low(TableTABLEIMAGE3<<1)
	ldi	SysReadA_H, high(TableTABLEIMAGE3<<1)
	add	SysReadA, SysStringA
	brcc	PC + 2
	inc	SysReadA_H
	lpm
	ret
TableTABLEIMAGE3:

;********************************************************************************

TABLEIMAGE4:
	cpi	SysStringA, 0
	brlo	PC + 3
	clr	SysByteTempX
	ret
	ldi	SysReadA, low(TableTABLEIMAGE4<<1)
	ldi	SysReadA_H, high(TableTABLEIMAGE4<<1)
	add	SysReadA, SysStringA
	brcc	PC + 2
	inc	SysReadA_H
	lpm
	ret
TableTABLEIMAGE4:

;********************************************************************************

TABLEIMAGE5:
	cpi	SysStringA, 0
	brlo	PC + 3
	clr	SysByteTempX
	ret
	ldi	SysReadA, low(TableTABLEIMAGE5<<1)
	ldi	SysReadA_H, high(TableTABLEIMAGE5<<1)
	add	SysReadA, SysStringA
	brcc	PC + 2
	inc	SysReadA_H
	lpm
	ret
TableTABLEIMAGE5:

;********************************************************************************


