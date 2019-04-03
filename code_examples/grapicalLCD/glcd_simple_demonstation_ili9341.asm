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
.EQU	BYTENUMBER=348
.EQU	CCOUNT=349
.EQU	CHARCODE=350
.EQU	CHARCOL=351
.EQU	CHARCOLS=353
.EQU	CHARCOL_H=352
.EQU	CHARLOCX=354
.EQU	CHARLOCX_H=355
.EQU	CHARLOCY=356
.EQU	CHARLOCY_H=357
.EQU	CHARROW=358
.EQU	CHARROWS=360
.EQU	CHARROW_H=359
.EQU	COL=361
.EQU	COLOR=362
.EQU	COLOR_H=363
.EQU	CURRCHARCOL=364
.EQU	CURRCHARROW=365
.EQU	CURRCHARVAL=366
.EQU	CURRCOL=367
.EQU	CURRCOL_H=368
.EQU	DDF_X=369
.EQU	DDF_X_H=370
.EQU	DDF_Y=371
.EQU	DDF_Y_H=372
.EQU	DRAWLINE=373
.EQU	DRAWLINE_H=374
.EQU	FF=375
.EQU	FF_H=376
.EQU	FILLCIRCLEXX=377
.EQU	FILLCIRCLEYY=378
.EQU	GLCDBACKGROUND=379
.EQU	GLCDBACKGROUND_H=380
.EQU	GLCDCOLOUR=381
.EQU	GLCDCOLOUR_H=382
.EQU	GLCDDEVICEHEIGHT=383
.EQU	GLCDDEVICEHEIGHT_H=384
.EQU	GLCDDEVICEWIDTH=385
.EQU	GLCDDEVICEWIDTH_H=386
.EQU	GLCDFNTDEFAULT=387
.EQU	GLCDFNTDEFAULTSIZE=388
.EQU	GLCDFONTWIDTH=389
.EQU	GLCDFOREGROUND=390
.EQU	GLCDFOREGROUND_H=391
.EQU	GLCDPIXELCOUNT=392
.EQU	GLCDPIXELCOUNT_H=393
.EQU	GLCDPRINTLEN=394
.EQU	GLCDPRINTLOC=395
.EQU	GLCDPRINTLOC_H=396
.EQU	GLCDPRINT_STRING_COUNTER=397
.EQU	GLCDROTATESTATE=398
.EQU	GLCDTEMP=399
.EQU	GLCDTEMP_H=400
.EQU	GLCDX=401
.EQU	GLCDX_H=402
.EQU	GLCDY=403
.EQU	GLCDY_H=404
.EQU	GLCD_YORDINATE=405
.EQU	GLCD_YORDINATE_H=406
.EQU	ILI9341SENDBYTE=407
.EQU	ILI9341SENDWORD=408
.EQU	ILI9341SENDWORD_H=409
.EQU	INXRADIUS=410
.EQU	INXRADIUS_H=411
.EQU	LCDVALUE=412
.EQU	LCDVALUE_E=415
.EQU	LCDVALUE_H=413
.EQU	LCDVALUE_U=414
.EQU	LINECOLOUR=416
.EQU	LINECOLOUR_H=417
.EQU	LINEDIFFX=418
.EQU	LINEDIFFX_H=419
.EQU	LINEDIFFX_X2=420
.EQU	LINEDIFFX_X2_H=421
.EQU	LINEDIFFY=422
.EQU	LINEDIFFY_H=423
.EQU	LINEDIFFY_X2=424
.EQU	LINEDIFFY_X2_H=425
.EQU	LINEERR=426
.EQU	LINEERR_H=427
.EQU	LINESTEPX=428
.EQU	LINESTEPX_H=429
.EQU	LINESTEPY=430
.EQU	LINESTEPY_H=431
.EQU	LINEX1=432
.EQU	LINEX1_H=433
.EQU	LINEX2=434
.EQU	LINEX2_H=435
.EQU	LINEY1=436
.EQU	LINEY1_H=437
.EQU	LINEY2=438
.EQU	LINEY2_H=439
.EQU	LOCX=440
.EQU	LOCX_H=441
.EQU	LOCY=442
.EQU	LOCY_H=443
.EQU	LONGNUMBER=444
.EQU	LONGNUMBER_E=447
.EQU	LONGNUMBER_H=445
.EQU	LONGNUMBER_U=446
.EQU	OLDFONT=448
.EQU	PAD=256
.EQU	PRINTLEN=449
.EQU	PRINTLOCX=450
.EQU	PRINTLOCX_H=451
.EQU	PRINTLOCY=452
.EQU	PRINTLOCY_H=453
.EQU	RADIUSERR=454
.EQU	RADIUSERR_H=455
.EQU	ROW=456
.EQU	STR=342
.EQU	STRINGLOCX=457
.EQU	STRINGLOCX_H=458
.EQU	STRINGPOINTER=459
.EQU	SYSARRAYTEMP1=460
.EQU	SYSARRAYTEMP2=461
.EQU	SYSCHARCOUNT=462
.EQU	SYSCHARSHANDLER=463
.EQU	SYSCHARSHANDLER_H=464
.EQU	SYSLCDPRINTDATAHANDLER=465
.EQU	SYSLCDPRINTDATAHANDLER_H=466
.EQU	SYSLONGDIVMULTA=467
.EQU	SYSLONGDIVMULTA_E=470
.EQU	SYSLONGDIVMULTA_H=468
.EQU	SYSLONGDIVMULTA_U=469
.EQU	SYSLONGDIVMULTB=471
.EQU	SYSLONGDIVMULTB_E=474
.EQU	SYSLONGDIVMULTB_H=472
.EQU	SYSLONGDIVMULTB_U=473
.EQU	SYSLONGDIVMULTX=475
.EQU	SYSLONGDIVMULTX_E=478
.EQU	SYSLONGDIVMULTX_H=476
.EQU	SYSLONGDIVMULTX_U=477
.EQU	SYSPRINTBUFFER=331
.EQU	SYSPRINTBUFFLEN=479
.EQU	SYSPRINTDATAHANDLER=480
.EQU	SYSPRINTDATAHANDLER_H=481
.EQU	SYSPRINTTEMP=482
.EQU	SYSREPEATTEMP1=483
.EQU	SYSREPEATTEMP2=484
.EQU	SYSREPEATTEMP3=485
.EQU	SYSREPEATTEMP3_H=486
.EQU	SYSREPEATTEMP4=487
.EQU	SYSREPEATTEMP4_H=488
.EQU	SYSSTRDATA=489
.EQU	SYSSTRINGPARAM1=297
.EQU	SYSSTRINGPARAM2=314
.EQU	SYSSTRINGTEMP=490
.EQU	SYSSTRLEN=491
.EQU	SYSSYSINSTRING3HANDLER=492
.EQU	SYSSYSINSTRING3HANDLER_H=493
.EQU	SYSSYSINSTRINGHANDLER=494
.EQU	SYSSYSINSTRINGHANDLER_H=495
.EQU	SYSVALTEMP=496
.EQU	SYSVALTEMP_H=497
.EQU	WORDNUMBER=498
.EQU	WORDNUMBER_H=499
.EQU	XCHAR=500
.EQU	XOFFSET=501
.EQU	XOFFSET_H=502
.EQU	XRADIUS=503
.EQU	XRADIUS_H=504
.EQU	YCALC1=505
.EQU	YCALC1_H=506
.EQU	YCALC2=507
.EQU	YCALC2_H=508
.EQU	YOFFSET=509
.EQU	YOFFSET_H=510
.EQU	YORDINATE=511
.EQU	_X1=512
.EQU	_X1_H=513
.EQU	_X2=514
.EQU	_X2_H=515
.EQU	_Y1=516
.EQU	_Y1_H=517
.EQU	_Y2=518
.EQU	_Y2_H=519

;********************************************************************************

;Register variables
.DEF	DELAYTEMP=r25
.DEF	DELAYTEMP2=r26
.DEF	SYSBITTEST=r5
.DEF	SYSBYTETEMPA=r22
.DEF	SYSBYTETEMPB=r28
.DEF	SYSBYTETEMPX=r0
.DEF	SYSCALCTEMPA=r22
.DEF	SYSCALCTEMPA_H=r23
.DEF	SYSCALCTEMPA_U=r24
.DEF	SYSCALCTEMPA_E=r25
.DEF	SYSCALCTEMPB=r28
.DEF	SYSCALCTEMPX=r0
.DEF	SYSCALCTEMPX_H=r1
.DEF	SYSDIVLOOP=r5
.DEF	SYSDIVMULTA=r24
.DEF	SYSDIVMULTA_H=r25
.DEF	SYSDIVMULTB=r30
.DEF	SYSDIVMULTB_H=r31
.DEF	SYSDIVMULTX=r2
.DEF	SYSDIVMULTX_H=r3
.DEF	SYSINTEGERTEMPA=r22
.DEF	SYSINTEGERTEMPA_H=r23
.DEF	SYSINTEGERTEMPB=r28
.DEF	SYSINTEGERTEMPB_H=r29
.DEF	SYSINTEGERTEMPX=r0
.DEF	SYSINTEGERTEMPX_H=r1
.DEF	SYSLONGTEMPA=r22
.DEF	SYSLONGTEMPA_H=r23
.DEF	SYSLONGTEMPA_U=r24
.DEF	SYSLONGTEMPA_E=r25
.DEF	SYSLONGTEMPB=r28
.DEF	SYSLONGTEMPB_H=r29
.DEF	SYSLONGTEMPB_U=r30
.DEF	SYSLONGTEMPB_E=r31
.DEF	SYSLONGTEMPX=r0
.DEF	SYSLONGTEMPX_H=r1
.DEF	SYSLONGTEMPX_U=r2
.DEF	SYSLONGTEMPX_E=r3
.DEF	SYSREADA=r30
.DEF	SYSREADA_H=r31
.DEF	SYSSIGNBYTE=r4
.DEF	SYSSTRINGA=r26
.DEF	SYSSTRINGA_H=r27
.DEF	SYSSTRINGB=r28
.DEF	SYSSTRINGB_H=r29
.DEF	SYSSTRINGLENGTH=r25
.DEF	SYSVALUECOPY=r21
.DEF	SYSWAITTEMPMS=r29
.DEF	SYSWAITTEMPMS_H=r30
.DEF	SYSWAITTEMPS=r31
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
.DEF	SYSTEMP1_U=r8
.DEF	SYSTEMP1_E=r9
.DEF	SYSTEMP2=r16
.DEF	SYSTEMP2_H=r17
.DEF	SYSTEMP3=r10
.DEF	SYSTEMP3_H=r11
.DEF	SYSTEMP4=r18

;********************************************************************************

;Alias variables
#define	SYSPAD_0	256
#define	SYSSTR_0	342

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
	call	INITGLCD_ILI9341

;Start of the main program
;''A demonstration program for GCGB and GCB.
;''--------------------------------------------------------------------------------------------------------------------------------
;''This program is a simple GLCD demonstration of the ILI9341 GLCD capabilities.
;''It is a nice graphical LCD, suitable for a lot of various projects.
;''This program draws lines, boxes, circles and prints strings and numbers.
;''The GLCD is connected to the microprocessor as shown in the hardware section of this code.
;'':
;''This is a demo for the 8bit BUS option.
;'':
;'':
;''@author  EvanV
;''@licence GPL
;''@version 1.0a
;''@date    31.03.2019
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
;GLCD selected extension font set. ASCII characters 31-254, the extended font uses 1358 bytes of program memory
;#define GLCD_EXTENDEDFONTSET1
;GLCDfntDefaultsize = 1
	ldi	SysValueCopy,1
	sts	GLCDFNTDEFAULTSIZE,SysValueCopy
;GLCDCLS  supports GLCDBackground as default
;GLCDCLS  also support passing color parameter.
;GLCDCLS [color]
;GLCDRotate ( Landscape_rev )     ' optionally you can rotate the screen.
	ldi	SysValueCopy,3
	sts	GLCDROTATESTATE,SysValueCopy
	call	GLCDROTATE_ILI9341
;Available colors
;ILI9341_BLACK
;ILI9341_RED
;ILI9341_GREEN
;ILI9341_BLUE
;ILI9341_WHITE
;ILI9341_PURPLE
;ILI9341_YELLOW
;ILI9341_CYAN
;ILI9341_D_GRAY
;ILI9341_L_GRAY
;ILI9341_SILVER
;ILI9341_MAROON
;ILI9341_OLIVE
;ILI9341_LIME
;ILI9341_AQUA
;ILI9341_TEAL
;ILI9341_NAVY
;ILI9341_FUCHSIA
;Dim CCOUNT, BYTENUMBER, OLDFONT, OLDFONT as Byte
;CCount = 31
	ldi	SysValueCopy,31
	sts	CCOUNT,SysValueCopy
;dim longNumber as long
;longNumber = 0 ' max value = 4294967290
	ldi	SysValueCopy,0
	sts	LONGNUMBER,SysValueCopy
	sts	LONGNUMBER_H,SysValueCopy
	sts	LONGNUMBER_U,SysValueCopy
	sts	LONGNUMBER_E,SysValueCopy
;dim wordNumber as Word
;wordNumber = 0
	ldi	SysValueCopy,0
	sts	WORDNUMBER,SysValueCopy
	sts	WORDNUMBER_H,SysValueCopy
;byteNumber = 0
	ldi	SysValueCopy,0
	sts	BYTENUMBER,SysValueCopy
;repeat 2
	ldi	SysValueCopy,2
	sts	SysRepeatTemp1,SysValueCopy
SysRepeatLoop1:
;GLCDRotate ( Landscape_rev )
	ldi	SysValueCopy,3
	sts	GLCDROTATESTATE,SysValueCopy
	call	GLCDROTATE_ILI9341
;GLCDCLS ILI9341_BLUE
	ldi	SysValueCopy,31
	sts	GLCDBACKGROUND,SysValueCopy
	ldi	SysValueCopy,0
	sts	GLCDBACKGROUND_H,SysValueCopy
	call	GLCDCLS_ILI9341
;GLCDForeground = ILI9341_MAROON
	ldi	SysValueCopy,0
	sts	GLCDFOREGROUND,SysValueCopy
	ldi	SysValueCopy,128
	sts	GLCDFOREGROUND_H,SysValueCopy
;GLCDfntDefaultsize = 1
	ldi	SysValueCopy,1
	sts	GLCDFNTDEFAULTSIZE,SysValueCopy
;GLCDPrint ( 2, 2, "GLCDPrint String" )
	ldi	SysValueCopy,2
	sts	PRINTLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCX_H,SysValueCopy
	ldi	SysValueCopy,2
	sts	PRINTLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM1)
	ldi	SysStringB_H,high(SYSSTRINGPARAM1)
	ldi	SysReadA,low(StringTable1<<1)
	ldi	SysReadA_H,high(StringTable1<<1)
	call	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM1)
	sts	SysLCDPRINTDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM1)
	sts	SysLCDPRINTDATAHandler_H,SysValueCopy
	call	GLCDPRINT5
;GLCDForeground = ILI9341_WHITE
	ldi	SysValueCopy,255
	sts	GLCDFOREGROUND,SysValueCopy
	sts	GLCDFOREGROUND_H,SysValueCopy
;GLCDfntDefaultsize = 2
	ldi	SysValueCopy,2
	sts	GLCDFNTDEFAULTSIZE,SysValueCopy
;GLCDPrint ( 2, 12, "GLCDPrint String" )
	ldi	SysValueCopy,2
	sts	PRINTLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCX_H,SysValueCopy
	ldi	SysValueCopy,12
	sts	PRINTLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM1)
	ldi	SysStringB_H,high(SYSSTRINGPARAM1)
	ldi	SysReadA,low(StringTable1<<1)
	ldi	SysReadA_H,high(StringTable1<<1)
	call	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM1)
	sts	SysLCDPRINTDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM1)
	sts	SysLCDPRINTDATAHandler_H,SysValueCopy
	call	GLCDPRINT5
;GLCDForeground = ILI9341_YELLOW
	ldi	SysValueCopy,224
	sts	GLCDFOREGROUND,SysValueCopy
	ldi	SysValueCopy,255
	sts	GLCDFOREGROUND_H,SysValueCopy
;GLCDfntDefaultsize = 3
	ldi	SysValueCopy,3
	sts	GLCDFNTDEFAULTSIZE,SysValueCopy
;GLCDPrint ( 2,30, "GLCDPrint String" )
	ldi	SysValueCopy,2
	sts	PRINTLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCX_H,SysValueCopy
	ldi	SysValueCopy,30
	sts	PRINTLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM1)
	ldi	SysStringB_H,high(SYSSTRINGPARAM1)
	ldi	SysReadA,low(StringTable1<<1)
	ldi	SysReadA_H,high(StringTable1<<1)
	call	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM1)
	sts	SysLCDPRINTDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM1)
	sts	SysLCDPRINTDATAHandler_H,SysValueCopy
	call	GLCDPRINT5
;longNumber = 0xFFFFFFFF
	ldi	SysValueCopy,255
	sts	LONGNUMBER,SysValueCopy
	sts	LONGNUMBER_H,SysValueCopy
	sts	LONGNUMBER_U,SysValueCopy
	sts	LONGNUMBER_E,SysValueCopy
;wordNumber = 0xFFFF
	ldi	SysValueCopy,255
	sts	WORDNUMBER,SysValueCopy
	sts	WORDNUMBER_H,SysValueCopy
;byteNumber = 0xFF
	ldi	SysValueCopy,255
	sts	BYTENUMBER,SysValueCopy
;GLCDRotate ( Portrait )
	ldi	SysValueCopy,4
	sts	GLCDROTATESTATE,SysValueCopy
	call	GLCDROTATE_ILI9341
;GLCDCLS ILI9341_WHITE
	ldi	SysValueCopy,255
	sts	GLCDBACKGROUND,SysValueCopy
	sts	GLCDBACKGROUND_H,SysValueCopy
	call	GLCDCLS_ILI9341
;GLCDForeground = ILI9341_MAROON
	ldi	SysValueCopy,0
	sts	GLCDFOREGROUND,SysValueCopy
	ldi	SysValueCopy,128
	sts	GLCDFOREGROUND_H,SysValueCopy
;GLCDfntDefaultsize = 1
	ldi	SysValueCopy,1
	sts	GLCDFNTDEFAULTSIZE,SysValueCopy
;GLCDPrint ( 2, 2, bytenumber )
	ldi	SysValueCopy,2
	sts	PRINTLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCX_H,SysValueCopy
	ldi	SysValueCopy,2
	sts	PRINTLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCY_H,SysValueCopy
	lds	SysValueCopy,BYTENUMBER
	sts	LCDVALUE,SysValueCopy
	ldi	SysValueCopy,0
	sts	LCDVALUE_H,SysValueCopy
	sts	LCDVALUE_U,SysValueCopy
	sts	LCDVALUE_E,SysValueCopy
	call	GLCDPRINT7
;GLCDForeground = ILI9341_BLACK
	ldi	SysValueCopy,0
	sts	GLCDFOREGROUND,SysValueCopy
	sts	GLCDFOREGROUND_H,SysValueCopy
;GLCDfntDefaultsize = 2
	ldi	SysValueCopy,2
	sts	GLCDFNTDEFAULTSIZE,SysValueCopy
;GLCDPrint ( 2, 12, wordNumber )
	ldi	SysValueCopy,2
	sts	PRINTLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCX_H,SysValueCopy
	ldi	SysValueCopy,12
	sts	PRINTLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCY_H,SysValueCopy
	lds	SysValueCopy,WORDNUMBER
	sts	LCDVALUE,SysValueCopy
	lds	SysValueCopy,WORDNUMBER_H
	sts	LCDVALUE_H,SysValueCopy
	ldi	SysValueCopy,0
	sts	LCDVALUE_U,SysValueCopy
	sts	LCDVALUE_E,SysValueCopy
	call	GLCDPRINT7
;GLCDForeground = ILI9341_CYAN
	ldi	SysValueCopy,255
	sts	GLCDFOREGROUND,SysValueCopy
	ldi	SysValueCopy,7
	sts	GLCDFOREGROUND_H,SysValueCopy
;GLCDfntDefaultsize = 3
	ldi	SysValueCopy,3
	sts	GLCDFNTDEFAULTSIZE,SysValueCopy
;GLCDPrint ( 2,30, longnumber )
	ldi	SysValueCopy,2
	sts	PRINTLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCX_H,SysValueCopy
	ldi	SysValueCopy,30
	sts	PRINTLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCY_H,SysValueCopy
	lds	SysValueCopy,LONGNUMBER
	sts	LCDVALUE,SysValueCopy
	lds	SysValueCopy,LONGNUMBER_H
	sts	LCDVALUE_H,SysValueCopy
	lds	SysValueCopy,LONGNUMBER_U
	sts	LCDVALUE_U,SysValueCopy
	lds	SysValueCopy,LONGNUMBER_E
	sts	LCDVALUE_E,SysValueCopy
	call	GLCDPRINT7
;wait 2 s
	ldi	SysWaitTempS,2
	call	Delay_S
;end Repeat
	lds	SysTemp1,SysRepeatTemp1
	dec	SysTemp1
	sts	SysRepeatTemp1,SysTemp1
	breq	PC + 2
	rjmp	SysRepeatLoop1
SysRepeatLoopEnd1:
;GLCDCLS ILI9341_BLUE
	ldi	SysValueCopy,31
	sts	GLCDBACKGROUND,SysValueCopy
	ldi	SysValueCopy,0
	sts	GLCDBACKGROUND_H,SysValueCopy
	call	GLCDCLS_ILI9341
;Set font size.
;GLCDfntDefaultsize = 1
	ldi	SysValueCopy,1
	sts	GLCDFNTDEFAULTSIZE,SysValueCopy
;longNumber = 0 ' max value = 4294967290
	ldi	SysValueCopy,0
	sts	LONGNUMBER,SysValueCopy
	sts	LONGNUMBER_H,SysValueCopy
	sts	LONGNUMBER_U,SysValueCopy
	sts	LONGNUMBER_E,SysValueCopy
;wordNumber = 0
	ldi	SysValueCopy,0
	sts	WORDNUMBER,SysValueCopy
	sts	WORDNUMBER_H,SysValueCopy
;byteNumber = 0
	ldi	SysValueCopy,0
	sts	BYTENUMBER,SysValueCopy
;Using the global variable GLCDfntDefaultsize to show the different capabilities
;Select Case GLCDfntDefaultsize
;Case 1
SysSelect1Case1:
	lds	SysCalcTempA,GLCDFNTDEFAULTSIZE
	cpi	SysCalcTempA,1
	brne	SysSelect1Case2
;ShowCase1
	call	SHOWCASE1
;Case 2
	rjmp	SysSelectEnd1
SysSelect1Case2:
	lds	SysCalcTempA,GLCDFNTDEFAULTSIZE
	cpi	SysCalcTempA,2
	brne	SysSelect1Case3
;ShowCase2
	call	SHOWCASE2
;Case 3
	rjmp	SysSelectEnd1
SysSelect1Case3:
	lds	SysCalcTempA,GLCDFNTDEFAULTSIZE
	cpi	SysCalcTempA,3
	breq	PC + 2
	rjmp	SysSelectEnd1
;GLCDDrawString (2, 1, "GLCD font")
	ldi	SysValueCopy,2
	sts	STRINGLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	STRINGLOCX_H,SysValueCopy
	ldi	SysValueCopy,1
	sts	CHARLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM1)
	ldi	SysStringB_H,high(SYSSTRINGPARAM1)
	ldi	SysReadA,low(StringTable2<<1)
	ldi	SysReadA_H,high(StringTable2<<1)
	call	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM1)
	sts	SysCHARSHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM1)
	sts	SysCHARSHandler_H,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND
	sts	LINECOLOUR,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND_H
	sts	LINECOLOUR_H,SysValueCopy
	call	GLCDDRAWSTRING_ILI9341
;GLCDDrawString (2, 25, "size = 3")
	ldi	SysValueCopy,2
	sts	STRINGLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	STRINGLOCX_H,SysValueCopy
	ldi	SysValueCopy,25
	sts	CHARLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM1)
	ldi	SysStringB_H,high(SYSSTRINGPARAM1)
	ldi	SysReadA,low(StringTable3<<1)
	ldi	SysReadA_H,high(StringTable3<<1)
	call	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM1)
	sts	SysCHARSHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM1)
	sts	SysCHARSHandler_H,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND
	sts	LINECOLOUR,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND_H
	sts	LINECOLOUR_H,SysValueCopy
	call	GLCDDRAWSTRING_ILI9341
;box 0,0,ILI9341_GLCD_WIDTH-1, ILI9341_GLCD_HEIGHT-1, ILI9341_BLUE
	ldi	SysValueCopy,0
	sts	LINEX1,SysValueCopy
	sts	LINEX1_H,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINEY1,SysValueCopy
	sts	LINEY1_H,SysValueCopy
	lds	SysTemp1,GLCDDEVICEWIDTH
	ldi	SysTemp2,1
	sub	SysTemp1,SysTemp2
	sts	LINEX2,SysTemp1
	lds	SysTemp1,GLCDDEVICEWIDTH_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	LINEX2_H,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT
	ldi	SysTemp2,1
	sub	SysTemp1,SysTemp2
	sts	LINEY2,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	LINEY2_H,SysTemp1
	ldi	SysValueCopy,31
	sts	LINECOLOUR,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINECOLOUR_H,SysValueCopy
	rcall	BOX
;box ILI9341_GLCD_WIDTH-5, ILI9341_GLCD_HEIGHT-5,ILI9341_GLCD_WIDTH-1, ILI9341_GLCD_HEIGHT-1, ILI9341_WHITE
	lds	SysTemp1,GLCDDEVICEWIDTH
	ldi	SysTemp2,5
	sub	SysTemp1,SysTemp2
	sts	LINEX1,SysTemp1
	lds	SysTemp1,GLCDDEVICEWIDTH_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	LINEX1_H,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT
	ldi	SysTemp2,5
	sub	SysTemp1,SysTemp2
	sts	LINEY1,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	LINEY1_H,SysTemp1
	lds	SysTemp1,GLCDDEVICEWIDTH
	ldi	SysTemp2,1
	sub	SysTemp1,SysTemp2
	sts	LINEX2,SysTemp1
	lds	SysTemp1,GLCDDEVICEWIDTH_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	LINEX2_H,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT
	ldi	SysTemp2,1
	sub	SysTemp1,SysTemp2
	sts	LINEY2,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	LINEY2_H,SysTemp1
	ldi	SysValueCopy,255
	sts	LINECOLOUR,SysValueCopy
	sts	LINECOLOUR_H,SysValueCopy
	rcall	BOX
;End Select
SysSelectEnd1:
;end
	rjmp	BASPROGRAMEND
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

BIGFONT102_111:
	cpi	SysStringA, 239
	brlo	PC + 3
	clr	SysByteTempX
	ret
	ldi	SysReadA, low(TableBIGFONT102_111<<1)
	ldi	SysReadA_H, high(TableBIGFONT102_111<<1)
	add	SysReadA, SysStringA
	brcc	PC + 2
	inc	SysReadA_H
	lpm
	ret
TableBIGFONT102_111:
	.DB	240,0,128,128,248,252,252,132,156,156,24,0,0,0,33,33,63,63,63,33,33,1,0,0,0,0
	.DB	128,192,192,64,64,64,192,128,192,64,0,0,71,207,223,152,152,152,255,255,127,0,0,0
	.DB	4,252,252,252,128,64,64,192,192,128,0,0,32,63,63,63,1,0,0,63,63,63,0,0,0,64,64,64
	.DB	220,220,220,0,0,0,0,0,0,32,32,32,63,63,63,32,32,32,0,0,0,0,0,64,64,64,220,220
	.DB	220,0,0,0,32,96,224,128,128,192,255,255,127,0,0,0,4,252,252,252,0,0,128,192,192,64
	.DB	0,0,32,63,63,63,2,7,15,61,56,48,0,0,0,4,4,4,252,252,252,0,0,0,0,0,0,32,32,32,63,63
	.DB	63,32,32,32,0,0,192,192,192,64,64,192,64,64,192,192,128,0,63,63,63,0,0,63,0,0
	.DB	63,63,63,0,192,192,192,64,64,64,192,192,128,0,0,0,63,63,63,0,0,0,63,63,63,0,0,0
	.DB	128,192,192,64,64,64,192,192,128,0,0,0,31,63,63,32,32,32,63,63,31

;********************************************************************************

BIGFONT112_121:
	cpi	SysStringA, 240
	brlo	PC + 3
	clr	SysByteTempX
	ret
	ldi	SysReadA, low(TableBIGFONT112_121<<1)
	ldi	SysReadA_H, high(TableBIGFONT112_121<<1)
	add	SysReadA, SysStringA
	brcc	PC + 2
	inc	SysReadA_H
	lpm
	ret
TableBIGFONT112_121:
	.DB	240,0,64,192,128,192,64,64,64,192,192,128,0,0,128,255,255,255,144,16,16,31,31,15
	.DB	0,128,192,192,64,64,64,192,128,192,64,0,0,15,31,31,16,16,144,255,255,255,128,0
	.DB	0,0,64,192,192,192,128,192,192,192,192,128,0,0,32,63,63,63,33,0,0,1,1,1,0,0,128,192
	.DB	192,64,64,64,64,192,128,0,0,0,25,59,35,38,38,38,60,61,25,0,0,0,64,64,224,240
	.DB	248,64,64,64,64,0,0,0,0,0,31,63,63,32,56,56,24,0,0,0,192,192,192,0,0,0,192,192
	.DB	192,0,0,0,31,63,63,32,32,32,63,31,63,32,0,0,192,192,192,0,0,0,192,192,192,0,0,0
	.DB	7,15,31,56,48,56,31,15,7,0,0,0,192,192,192,0,0,0,0,0,192,192,192,0,7,15,63,56
	.DB	56,14,56,56,63,15,7,0,192,192,192,0,0,192,192,192,0,0,0,0,48,57,63,15,15,63,57,48
	.DB	0,0,0,0,0,192,192,192,0,0,0,192,192,192,0,0,128,135,143,159,216,248,120,63,15,7

;********************************************************************************

BIGFONT122_126:
	cpi	SysStringA, 109
	brlo	PC + 3
	clr	SysByteTempX
	ret
	ldi	SysReadA, low(TableBIGFONT122_126<<1)
	ldi	SysReadA_H, high(TableBIGFONT122_126<<1)
	add	SysReadA, SysStringA
	brcc	PC + 2
	inc	SysReadA_H
	lpm
	ret
TableBIGFONT122_126:
	.DB	120,0,192,192,64,64,64,192,192,192,0,0,0,0,49,56,60,46,39,35,49,56,0,0,0,0,128,128
	.DB	192,120,124,60,4,4,4,4,0,0,1,1,3,30,62,60,32,32,32,32,0,0,0,0,0,0,254,254,254,0
	.DB	0,0,0,0,0,0,0,0,127,127,127,0,0,0,0,0,4,4,4,4,60,124,120,192,128,128,0,0,32,32
	.DB	32,32,60,62,30,3,1,1,0,56,60,60,4,12,28,56,48,32,60,60,28

;********************************************************************************

BIGFONT193_202:
	cpi	SysStringA, 240
	brlo	PC + 3
	clr	SysByteTempX
	ret
	ldi	SysReadA, low(TableBIGFONT193_202<<1)
	ldi	SysReadA_H, high(TableBIGFONT193_202<<1)
	add	SysReadA, SysStringA
	brcc	PC + 2
	inc	SysReadA_H
	lpm
	ret
TableBIGFONT193_202:
	.DB	240,0,224,240,248,28,12,12,28,248,240,224,0,0,63,63,63,2,2,2,2,63,63,63,0,0,4,252
	.DB	252,252,132,132,132,252,252,120,0,0,32,63,63,63,36,36,36,63,63,30,0,0,0,252,252,252
	.DB	12,12,12,12,12,0,0,0,0,63,63,63,0,0,0,0,0,0,0,0,224,240,248,28,12,12,28,248,240,224
	.DB	0,0,63,63,63,48,48,48,48,63,63,63,0,0,4,252,252,252,132,132,132,196,204,28,0,0
	.DB	32,63,63,63,36,36,36,35,51,56,0,0,60,28,12,4,132,196,228,124,60,28,0,0,56,60,62,39
	.DB	35,36,32,48,56,60,0,0,252,252,252,128,128,128,252,252,252,0,0,0,63,63,63,1,1,1
	.DB	63,63,63,0,0,0,224,240,248,156,140,140,140,156,248,240,224,0,7,15,31,57,49,49
	.DB	49,57,31,15,7,0,0,4,4,252,252,252,4,4,0,0,0,0,0,32,32,63,63,63,32,32,0,0,0,0,4,252
	.DB	252,252,192,224,112,60,28,12,0,0,32,63,63,63,3,7,14,60,56,48

;********************************************************************************

BIGFONT203_212:
	cpi	SysStringA, 238
	brlo	PC + 3
	clr	SysByteTempX
	ret
	ldi	SysReadA, low(TableBIGFONT203_212<<1)
	ldi	SysReadA_H, high(TableBIGFONT203_212<<1)
	add	SysReadA, SysStringA
	brcc	PC + 2
	inc	SysReadA_H
	lpm
	ret
TableBIGFONT203_212:
	.DB	240,0,224,240,248,28,12,12,28,248,240,224,0,0,63,63,63,0,0,0,0,63,63,63,0,0,252,252
	.DB	252,120,240,224,240,120,252,252,252,0,63,63,63,0,0,1,0,0,63,63,63,0,252,252,252,112
	.DB	224,192,128,0,252,252,252,0,63,63,63,0,0,1,3,7,63,63,63,0,0,28,28,156,156,156
	.DB	156,156,28,28,0,0,0,56,56,57,57,57,57,57,56,56,0,0,224,240,248,28,12,12,12,28
	.DB	248,240,224,0,7,15,31,56,48,48,48,56,31,15,7,0,252,252,252,28,28,28,28,252,252,252
	.DB	0,0,63,63,63,0,0,0,0,63,63,63,0,0,4,252,252,252,132,132,132,252,252,120,0,0,32,63
	.DB	63,63,36,1,1,1,1,0,0,0,0,60,124,252,220,156,156,28,28,28,0,0,0,60,62,63,59,57
	.DB	57,56,56,56,0,0,28,12,4,4,252,252,252,4,4,12,28,0,0,0,32,32,63,63,63,32,32,0,0,0
	.DB	124,252,252,128,0,128,252,252,124,0,0,0,0,32,36,63,63,63,36,32

;********************************************************************************

BIGFONT213_216:
	cpi	SysStringA, 95
	brlo	PC + 3
	clr	SysByteTempX
	ret
	ldi	SysReadA, low(TableBIGFONT213_216<<1)
	ldi	SysReadA_H, high(TableBIGFONT213_216<<1)
	add	SysReadA, SysStringA
	brcc	PC + 2
	inc	SysReadA_H
	lpm
	ret
TableBIGFONT213_216:
	.DB	96,224,240,248,56,24,252,252,24,56,248,240,224,7,15,31,28,24,63,63,24,28,31,15
	.DB	7,0,28,60,124,224,192,224,124,60,28,0,0,0,56,60,62,7,3,7,62,60,56,0,0,0,252,252
	.DB	252,128,248,248,248,128,252,252,252,0,0,1,3,35,63,63,63,35,3,1,0,0,0,112,252,252
	.DB	140,140,140,252,252,112,0,0,0,0,49,51,51,51,51,51,49

;********************************************************************************

BIGFONT32_41:
	cpi	SysStringA, 239
	brlo	PC + 3
	clr	SysByteTempX
	ret
	ldi	SysReadA, low(TableBIGFONT32_41<<1)
	ldi	SysReadA_H, high(TableBIGFONT32_41<<1)
	add	SysReadA, SysStringA
	brcc	PC + 2
	inc	SysReadA_H
	lpm
	ret
TableBIGFONT32_41:
	.DB	240,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,248,252,252,252,248,0,0
	.DB	0,0,0,0,0,0,115,115,115,0,0,0,0,0,0,0,0,30,62,62,0,0,0,62,62,30,0,0,0,0,0,0,0,0
	.DB	0,0,0,0,0,48,48,254,254,48,48,48,48,254,254,48,48,12,12,127,127,12,12,12,12,127
	.DB	127,12,12,0,240,248,152,254,152,152,254,152,152,24,0,0,24,25,25,127,25,25,127,25
	.DB	31,15,0,0,0,56,56,56,128,192,224,112,56,0,0,0,0,28,14,7,3,1,28,28,28,0,0,0,56,252
	.DB	196,196,252,56,0,0,0,128,0,0,30,63,33,33,51,63,30,30,55,35,0,0,0,32,60,60,28,0
	.DB	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,192,224,240,56,28,12,4,4,0,0,0,0,3,7,15
	.DB	28,56,48,32,32,0,0,0,0,4,4,12,28,56,240,224,192,0,0,0,0,32,32,48,56,28,15,7,3

;********************************************************************************

BIGFONT42_51:
	cpi	SysStringA, 240
	brlo	PC + 3
	clr	SysByteTempX
	ret
	ldi	SysReadA, low(TableBIGFONT42_51<<1)
	ldi	SysReadA_H, high(TableBIGFONT42_51<<1)
	add	SysReadA, SysStringA
	brcc	PC + 2
	inc	SysReadA_H
	lpm
	ret
TableBIGFONT42_51:
	.DB	240,128,136,144,224,224,252,252,224,224,144,136,128,1,17,9,7,7,63,63,7,7,9,17,1,0
	.DB	0,128,128,128,240,240,128,128,128,0,0,0,0,1,1,1,15,15,1,1,1,0,0,0,0,0,0,0,0,0,0,0
	.DB	0,0,0,0,0,64,120,120,56,0,0,0,0,0,0,0,128,128,128,128,128,128,128,128,128,128,0,0
	.DB	1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,56,56,56,0,0,0,0,0,0,0,0,0
	.DB	0,0,0,0,128,192,224,112,56,0,32,48,56,28,14,7,3,1,0,0,0,0,248,252,252,4,4,4,4,252
	.DB	252,248,0,0,31,63,63,32,32,32,32,63,63,31,0,0,96,96,96,240,252,252,0,0,0,0,0,0
	.DB	32,32,32,63,63,63,32,32,32,0,0,0,24,28,28,4,4,132,204,252,120,48,0,0,48,56,60,46
	.DB	39,35,33,56,56,56,0,0,24,28,28,132,132,132,204,124,120,48,0,0,24,56,56,36,33,33
	.DB	51,62,30,12

;********************************************************************************

BIGFONT52_61:
	cpi	SysStringA, 241
	brlo	PC + 3
	clr	SysByteTempX
	ret
	ldi	SysReadA, low(TableBIGFONT52_61<<1)
	ldi	SysReadA_H, high(TableBIGFONT52_61<<1)
	add	SysReadA, SysStringA
	brcc	PC + 2
	inc	SysReadA_H
	lpm
	ret
TableBIGFONT52_61:
	.DB	240,0,128,192,96,48,24,252,252,252,0,0,0,0,3,3,3,35,35,63,63,63,35,35,0,0,252,252
	.DB	252,132,132,132,132,132,4,4,0,0,25,57,57,36,33,33,51,63,31,14,0,0,224,240,248,156
	.DB	140,132,132,132,128,0,0,0,31,63,63,36,36,33,33,63,63,31,0,0,60,60,60,4,4,4,4,132
	.DB	252,252,124,0,0,0,0,56,60,62,7,3,1,0,0,0,120,124,252,196,196,132,132,252,124,120
	.DB	0,0,30,62,63,33,33,35,35,63,62,30,0,0,248,252,252,132,132,132,132,252,252,248,0,0
	.DB	0,1,36,33,33,49,57,31,15,7,0,0,0,0,0,112,112,112,0,0,0,0,0,0,0,0,0,14,14,14,0,0
	.DB	0,0,0,0,0,0,0,112,112,112,0,0,0,0,0,0,0,0,16,30,30,14,0,0,0,0,0,0,128,192,224,112
	.DB	56,28,14,6,2,0,0,0,1,3,7,14,28,56,112,96,64,0,0,96,96,96,96,96,96,96,96,96,96,96
	.DB	96,6,6,6,6,6,6,6,6,6,6,6,6

;********************************************************************************

BIGFONT62_71:
	cpi	SysStringA, 240
	brlo	PC + 3
	clr	SysByteTempX
	ret
	ldi	SysReadA, low(TableBIGFONT62_71<<1)
	ldi	SysReadA_H, high(TableBIGFONT62_71<<1)
	add	SysReadA, SysStringA
	brcc	PC + 2
	inc	SysReadA_H
	lpm
	ret
TableBIGFONT62_71:
	.DB	240,0,2,6,14,28,56,112,224,192,128,0,0,0,64,96,112,56,28,14,7,3,1,0,0,0,24,28
	.DB	12,14,6,134,206,252,124,56,0,0,0,0,0,0,115,115,115,0,0,0,0,0,252,254,254,2,2,194
	.DB	194,194,254,254,252,0,63,63,127,96,96,99,99,99,99,67,3,0,224,240,248,28,12,12
	.DB	28,248,240,224,0,0,63,63,63,2,2,2,2,63,63,63,0,0,4,252,252,252,132,132,132,252
	.DB	252,120,0,0,32,63,63,63,36,33,33,63,63,30,0,0,240,248,252,12,4,4,4,28,28,24,0,0
	.DB	15,31,63,48,32,32,32,56,56,24,0,0,4,252,252,252,4,4,12,252,248,240,0,0,32,63,63,63
	.DB	32,32,48,63,31,15,0,0,4,252,252,252,132,132,132,196,204,28,0,0,32,63,63,63,36,33
	.DB	33,35,51,56,0,0,4,252,252,252,132,132,132,196,204,28,0,0,32,63,63,63,33,1,1,3,3,0
	.DB	0,0,240,248,252,12,4,4,4,60,60,56,0,0,15,31,63,48,32,34,34,62,62,62

;********************************************************************************

BIGFONT72_81:
	cpi	SysStringA, 241
	brlo	PC + 3
	clr	SysByteTempX
	ret
	ldi	SysReadA, low(TableBIGFONT72_81<<1)
	ldi	SysReadA_H, high(TableBIGFONT72_81<<1)
	add	SysReadA, SysStringA
	brcc	PC + 2
	inc	SysReadA_H
	lpm
	ret
TableBIGFONT72_81:
	.DB	240,0,252,252,252,128,128,128,252,252,252,0,0,0,63,63,63,1,1,1,63,63,63,0,0,0,0,4
	.DB	4,252,252,252,4,4,0,0,0,0,0,32,32,63,63,63,32,32,0,0,0,0,0,0,0,0,4,4,252,252
	.DB	252,4,4,30,30,62,32,32,32,32,63,63,31,0,0,0,4,252,252,252,192,224,112,60,28,12
	.DB	0,0,32,63,63,63,3,7,14,60,56,48,0,0,4,252,252,252,4,0,0,0,0,0,0,0,32,63,63,63
	.DB	32,32,32,48,56,60,0,0,252,252,252,120,240,224,240,120,252,252,252,0,63,63,63,0
	.DB	0,1,0,0,63,63,63,0,252,252,252,112,224,192,128,0,252,252,252,0,63,63,63,0,0,1,3,7
	.DB	63,63,63,0,224,240,248,28,12,12,12,28,248,240,224,0,7,15,31,56,48,48,48,56,31,15
	.DB	7,0,4,252,252,252,132,132,132,252,252,120,0,0,32,63,63,63,33,1,1,1,1,0,0,0,224,248
	.DB	248,28,12,4,12,28,248,248,224,0,7,31,31,24,24,92,94,126,127,127,71

;********************************************************************************

BIGFONT82_91:
	cpi	SysStringA, 239
	brlo	PC + 3
	clr	SysByteTempX
	ret
	ldi	SysReadA, low(TableBIGFONT82_91<<1)
	ldi	SysReadA_H, high(TableBIGFONT82_91<<1)
	add	SysReadA, SysStringA
	brcc	PC + 2
	inc	SysReadA_H
	lpm
	ret
TableBIGFONT82_91:
	.DB	240,0,4,252,252,252,132,132,132,252,252,120,0,0,32,63,63,63,1,1,3,63,63,60,0,0
	.DB	120,252,252,132,132,132,132,188,60,56,0,0,28,60,61,36,36,33,33,63,63,30,0,0,28,12
	.DB	4,4,252,252,252,4,4,12,28,0,0,0,32,32,63,63,63,32,32,0,0,0,252,252,252,0,0,0
	.DB	252,252,252,0,0,0,31,63,63,32,32,32,63,63,31,0,0,0,252,252,252,0,0,0,252,252
	.DB	252,0,0,0,7,15,31,56,48,56,31,15,7,0,0,0,252,252,252,0,0,128,0,0,252,252,252,0
	.DB	3,15,63,60,60,15,60,60,63,15,3,0,28,60,124,224,192,224,124,60,28,0,0,0,56,60,62,7
	.DB	3,7,62,60,56,0,0,0,124,252,252,128,0,128,252,252,124,0,0,0,0,32,33,63,63,63,33,32
	.DB	0,0,0,0,60,28,12,4,132,196,228,124,60,28,0,0,56,60,62,39,35,33,32,48,56,60,0,0
	.DB	0,0,252,252,252,4,4,4,4,0,0,0,0,0,63,63,63,32,32,32,32

;********************************************************************************

BIGFONT92_101:
	cpi	SysStringA, 239
	brlo	PC + 3
	clr	SysByteTempX
	ret
	ldi	SysReadA, low(TableBIGFONT92_101<<1)
	ldi	SysReadA_H, high(TableBIGFONT92_101<<1)
	add	SysReadA, SysStringA
	brcc	PC + 2
	inc	SysReadA_H
	lpm
	ret
TableBIGFONT92_101:
	.DB	240,0,28,56,112,224,192,128,0,0,0,0,0,0,0,0,0,0,1,3,7,14,28,24,48,0,0,0,4,4,4,4
	.DB	252,252,252,0,0,0,0,0,32,32,32,32,63,63,63,0,0,0,32,48,56,28,14,14,28,56,48,32
	.DB	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,192,192,192,192,192,192,192
	.DB	192,192,192,192,192,0,12,12,60,48,48,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64
	.DB	64,64,64,64,192,192,128,0,0,0,28,62,62,34,34,34,63,31,63,32,0,0,4,252,252,252
	.DB	64,64,64,192,192,128,0,0,32,63,31,63,32,32,32,63,63,31,0,0,128,192,192,64,64,64
	.DB	192,192,128,0,0,0,31,63,63,32,32,32,57,57,25,0,0,0,128,192,192,64,64,68,252,252
	.DB	252,4,0,0,31,63,63,32,32,32,63,31,63,32,0,0,128,192,192,64,64,64,192,192,128,0
	.DB	0,0,31,63,63,34,34,34,59,59,27

;********************************************************************************

BIGPRINT_ILI9341:
;Dim GLCDPrintLoc as word
;PrintLen = PrintData(0)
	lds	SysStringA,SysPRINTDATAHandler
	lds	SysStringA_H,SysPRINTDATAHandler_H
	ld	SysValueCopy,X
	sts	PRINTLEN,SysValueCopy
;If PrintLen = 0 Then Exit Sub
	lds	SysCalcTempA,PRINTLEN
	tst	SysCalcTempA
	brne	ENDIF36
	ret
ENDIF36:
;GLCDPrintLoc = PrintLocX
	lds	SysValueCopy,PRINTLOCX
	sts	GLCDPRINTLOC,SysValueCopy
	lds	SysValueCopy,PRINTLOCX_H
	sts	GLCDPRINTLOC_H,SysValueCopy
;For SysPrintTemp = 1 To PrintLen
	ldi	SysValueCopy,0
	sts	SYSPRINTTEMP,SysValueCopy
	lds	SysCalcTempA,PRINTLEN
	cpi	SysCalcTempA,1
	brlo	SysForLoopEnd10
SysForLoop10:
	lds	SysTemp1,SYSPRINTTEMP
	inc	SysTemp1
	sts	SYSPRINTTEMP,SysTemp1
;DrawBigChar_ILI9341 GLCDPrintLoc, PrintLocY, PrintData(SysPrintTemp), Color
	lds	SysValueCopy,GLCDPRINTLOC
	sts	CHARLOCX,SysValueCopy
	lds	SysValueCopy,GLCDPRINTLOC_H
	sts	CHARLOCX_H,SysValueCopy
	lds	SysValueCopy,PRINTLOCY
	sts	CHARLOCY,SysValueCopy
	lds	SysValueCopy,PRINTLOCY_H
	sts	CHARLOCY_H,SysValueCopy
	lds	SysTemp1,SysPRINTDATAHandler
	lds	SysTemp3,SYSPRINTTEMP
	add	SysTemp1,SysTemp3
	mov	SysStringA,SysTemp1
	lds	SysTemp1,SysPRINTDATAHandler_H
	ldi	SysTemp4,0
	adc	SysTemp1,SysTemp4
	mov	SysStringA_H,SysTemp1
	ld	SysValueCopy,X
	sts	CHARCODE,SysValueCopy
	rcall	DRAWBIGCHAR_ILI9341
;GLCDPrintLoc += 13
	lds	SysTemp1,GLCDPRINTLOC
	ldi	SysTemp4,13
	add	SysTemp1,SysTemp4
	sts	GLCDPRINTLOC,SysTemp1
	lds	SysTemp1,GLCDPRINTLOC_H
	ldi	SysTemp4,0
	adc	SysTemp1,SysTemp4
	sts	GLCDPRINTLOC_H,SysTemp1
;Next
	lds	SysCalcTempA,SYSPRINTTEMP
	lds	SysCalcTempB,PRINTLEN
	cp	SysCalcTempA,SysCalcTempB
	brlo	SysForLoop10
SysForLoopEnd10:
	ret

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
	rjmp	ENDIF10
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
ENDIF10:
;If LineY1 > LineY2 Then
	lds	SysWORDTempB,LINEY1
	lds	SysWORDTempB_H,LINEY1_H
	lds	SysWORDTempA,LINEY2
	lds	SysWORDTempA_H,LINEY2_H
	call	SysCompLessThan16
	sbrs	SysByteTempX,0
	rjmp	ENDIF11
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
ENDIF11:
;dim DrawLine as word
;Draw lines going across
;For DrawLine = LineX1 To LineX2
	lds	SysTemp3,LINEX1
	ldi	SysTemp4,1
	sub	SysTemp3,SysTemp4
	sts	DRAWLINE,SysTemp3
	lds	SysTemp3,LINEX1_H
	ldi	SysTemp4,0
	sbc	SysTemp3,SysTemp4
	sts	DRAWLINE_H,SysTemp3
	lds	SysWORDTempB,LINEX1
	lds	SysWORDTempB_H,LINEX1_H
	lds	SysWORDTempA,LINEX2
	lds	SysWORDTempA_H,LINEX2_H
	call	SysCompLessThan16
	sbrc	SysByteTempX,0
	rjmp	SysForLoopEnd3
ENDIF12:
SysForLoop3:
	lds	SysTemp3,DRAWLINE
	inc	SysTemp3
	sts	DRAWLINE,SysTemp3
	lds	SysTemp3,DRAWLINE_H
	brne	PC + 2
	inc	SysTemp3
	sts	DRAWLINE_H,SysTemp3
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
	rjmp	SysForLoop3
ENDIF13:
SysForLoopEnd3:
;Draw lines going down
;For DrawLine = LineY1 To LineY2
	lds	SysTemp3,LINEY1
	ldi	SysTemp4,1
	sub	SysTemp3,SysTemp4
	sts	DRAWLINE,SysTemp3
	lds	SysTemp3,LINEY1_H
	ldi	SysTemp4,0
	sbc	SysTemp3,SysTemp4
	sts	DRAWLINE_H,SysTemp3
	lds	SysWORDTempB,LINEY1
	lds	SysWORDTempB_H,LINEY1_H
	lds	SysWORDTempA,LINEY2
	lds	SysWORDTempA_H,LINEY2_H
	call	SysCompLessThan16
	sbrc	SysByteTempX,0
	rjmp	SysForLoopEnd4
ENDIF14:
SysForLoop4:
	lds	SysTemp3,DRAWLINE
	inc	SysTemp3
	sts	DRAWLINE,SysTemp3
	lds	SysTemp3,DRAWLINE_H
	brne	PC + 2
	inc	SysTemp3
	sts	DRAWLINE_H,SysTemp3
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
	rjmp	SysForLoop4
ENDIF15:
SysForLoopEnd4:
	ret

;********************************************************************************

CIRCLE:
;dim  radiusErr, xradius as Integer
;xradius = Inxradius
	lds	SysValueCopy,INXRADIUS
	sts	XRADIUS,SysValueCopy
	lds	SysValueCopy,INXRADIUS_H
	sts	XRADIUS_H,SysValueCopy
;radiusErr = -(xradius/2)
	lds	SysINTEGERTempA,XRADIUS
	lds	SysINTEGERTempA_H,XRADIUS_H
	ldi	SysINTEGERTempB,2
	ldi	SysINTEGERTempB_H,0
	call	SysDivSubINT
	mov	SysTemp1,SysINTEGERTempA
	mov	SysTemp1_H,SysINTEGERTempA_H
	com	SysTemp1
	com	SysTemp1_H
	inc	SysTemp1
	brne	PC + 2
	inc	SysTemp1_H
	sts	RADIUSERR,SysTemp1
	sts	RADIUSERR_H,SysTemp1_H
;Do While xradius >=  yordinate
SysDoLoop_S4:
	lds	SysINTEGERTempA,xradius
	lds	SysINTEGERTempA_H,xradius_H
	lds	SysINTEGERTempB,yordinate
	ldi	SysINTEGERTempB_H,0
	call	SysCompLessThanINT
	com	SysByteTempX
	sbrs	SysByteTempX,0
	rjmp	SysDoLoop_E4
;Pset ((xoffset + xradius), (yoffset + yordinate), LineColour)
	lds	SysTemp3,XOFFSET
	lds	SysTemp1,XRADIUS
	add	SysTemp3,SysTemp1
	sts	GLCDX,SysTemp3
	lds	SysTemp3,XOFFSET_H
	lds	SysTemp1,XRADIUS_H
	adc	SysTemp3,SysTemp1
	sts	GLCDX_H,SysTemp3
	lds	SysTemp3,YOFFSET
	lds	SysTemp1,YORDINATE
	add	SysTemp3,SysTemp1
	sts	GLCDY,SysTemp3
	lds	SysTemp3,YOFFSET_H
	ldi	SysTemp4,0
	adc	SysTemp3,SysTemp4
	sts	GLCDY_H,SysTemp3
	lds	SysValueCopy,LINECOLOUR
	sts	GLCDCOLOUR,SysValueCopy
	lds	SysValueCopy,LINECOLOUR_H
	sts	GLCDCOLOUR_H,SysValueCopy
	call	PSET_ILI9341
;Pset ((xoffset + yordinate), (yoffset + xradius), LineColour)
	lds	SysTemp3,XOFFSET
	lds	SysTemp1,YORDINATE
	add	SysTemp3,SysTemp1
	sts	GLCDX,SysTemp3
	lds	SysTemp3,XOFFSET_H
	ldi	SysTemp4,0
	adc	SysTemp3,SysTemp4
	sts	GLCDX_H,SysTemp3
	lds	SysTemp3,YOFFSET
	lds	SysTemp1,XRADIUS
	add	SysTemp3,SysTemp1
	sts	GLCDY,SysTemp3
	lds	SysTemp3,YOFFSET_H
	lds	SysTemp1,XRADIUS_H
	adc	SysTemp3,SysTemp1
	sts	GLCDY_H,SysTemp3
	lds	SysValueCopy,LINECOLOUR
	sts	GLCDCOLOUR,SysValueCopy
	lds	SysValueCopy,LINECOLOUR_H
	sts	GLCDCOLOUR_H,SysValueCopy
	call	PSET_ILI9341
;Pset ((xoffset - xradius), (yoffset + yordinate), LineColour)
	lds	SysTemp3,XOFFSET
	lds	SysTemp1,XRADIUS
	sub	SysTemp3,SysTemp1
	sts	GLCDX,SysTemp3
	lds	SysTemp3,XOFFSET_H
	lds	SysTemp1,XRADIUS_H
	sbc	SysTemp3,SysTemp1
	sts	GLCDX_H,SysTemp3
	lds	SysTemp3,YOFFSET
	lds	SysTemp1,YORDINATE
	add	SysTemp3,SysTemp1
	sts	GLCDY,SysTemp3
	lds	SysTemp3,YOFFSET_H
	ldi	SysTemp4,0
	adc	SysTemp3,SysTemp4
	sts	GLCDY_H,SysTemp3
	lds	SysValueCopy,LINECOLOUR
	sts	GLCDCOLOUR,SysValueCopy
	lds	SysValueCopy,LINECOLOUR_H
	sts	GLCDCOLOUR_H,SysValueCopy
	call	PSET_ILI9341
;Pset ((xoffset - yordinate), (yoffset + xradius), LineColour)
	lds	SysTemp3,XOFFSET
	lds	SysTemp1,YORDINATE
	sub	SysTemp3,SysTemp1
	sts	GLCDX,SysTemp3
	lds	SysTemp3,XOFFSET_H
	ldi	SysTemp4,0
	sbc	SysTemp3,SysTemp4
	sts	GLCDX_H,SysTemp3
	lds	SysTemp3,YOFFSET
	lds	SysTemp1,XRADIUS
	add	SysTemp3,SysTemp1
	sts	GLCDY,SysTemp3
	lds	SysTemp3,YOFFSET_H
	lds	SysTemp1,XRADIUS_H
	adc	SysTemp3,SysTemp1
	sts	GLCDY_H,SysTemp3
	lds	SysValueCopy,LINECOLOUR
	sts	GLCDCOLOUR,SysValueCopy
	lds	SysValueCopy,LINECOLOUR_H
	sts	GLCDCOLOUR_H,SysValueCopy
	call	PSET_ILI9341
;Pset ((xoffset - xradius), (yoffset - yordinate), LineColour)
	lds	SysTemp3,XOFFSET
	lds	SysTemp1,XRADIUS
	sub	SysTemp3,SysTemp1
	sts	GLCDX,SysTemp3
	lds	SysTemp3,XOFFSET_H
	lds	SysTemp1,XRADIUS_H
	sbc	SysTemp3,SysTemp1
	sts	GLCDX_H,SysTemp3
	lds	SysTemp3,YOFFSET
	lds	SysTemp1,YORDINATE
	sub	SysTemp3,SysTemp1
	sts	GLCDY,SysTemp3
	lds	SysTemp3,YOFFSET_H
	ldi	SysTemp4,0
	sbc	SysTemp3,SysTemp4
	sts	GLCDY_H,SysTemp3
	lds	SysValueCopy,LINECOLOUR
	sts	GLCDCOLOUR,SysValueCopy
	lds	SysValueCopy,LINECOLOUR_H
	sts	GLCDCOLOUR_H,SysValueCopy
	call	PSET_ILI9341
;Pset ((xoffset - yordinate), (yoffset - xradius), LineColour)
	lds	SysTemp3,XOFFSET
	lds	SysTemp1,YORDINATE
	sub	SysTemp3,SysTemp1
	sts	GLCDX,SysTemp3
	lds	SysTemp3,XOFFSET_H
	ldi	SysTemp4,0
	sbc	SysTemp3,SysTemp4
	sts	GLCDX_H,SysTemp3
	lds	SysTemp3,YOFFSET
	lds	SysTemp1,XRADIUS
	sub	SysTemp3,SysTemp1
	sts	GLCDY,SysTemp3
	lds	SysTemp3,YOFFSET_H
	lds	SysTemp1,XRADIUS_H
	sbc	SysTemp3,SysTemp1
	sts	GLCDY_H,SysTemp3
	lds	SysValueCopy,LINECOLOUR
	sts	GLCDCOLOUR,SysValueCopy
	lds	SysValueCopy,LINECOLOUR_H
	sts	GLCDCOLOUR_H,SysValueCopy
	call	PSET_ILI9341
;Pset ((xoffset + xradius), (yoffset - yordinate), LineColour)
	lds	SysTemp3,XOFFSET
	lds	SysTemp1,XRADIUS
	add	SysTemp3,SysTemp1
	sts	GLCDX,SysTemp3
	lds	SysTemp3,XOFFSET_H
	lds	SysTemp1,XRADIUS_H
	adc	SysTemp3,SysTemp1
	sts	GLCDX_H,SysTemp3
	lds	SysTemp3,YOFFSET
	lds	SysTemp1,YORDINATE
	sub	SysTemp3,SysTemp1
	sts	GLCDY,SysTemp3
	lds	SysTemp3,YOFFSET_H
	ldi	SysTemp4,0
	sbc	SysTemp3,SysTemp4
	sts	GLCDY_H,SysTemp3
	lds	SysValueCopy,LINECOLOUR
	sts	GLCDCOLOUR,SysValueCopy
	lds	SysValueCopy,LINECOLOUR_H
	sts	GLCDCOLOUR_H,SysValueCopy
	call	PSET_ILI9341
;Pset ((xoffset + yordinate), (yoffset - xradius), LineColour)
	lds	SysTemp3,XOFFSET
	lds	SysTemp1,YORDINATE
	add	SysTemp3,SysTemp1
	sts	GLCDX,SysTemp3
	lds	SysTemp3,XOFFSET_H
	ldi	SysTemp4,0
	adc	SysTemp3,SysTemp4
	sts	GLCDX_H,SysTemp3
	lds	SysTemp3,YOFFSET
	lds	SysTemp1,XRADIUS
	sub	SysTemp3,SysTemp1
	sts	GLCDY,SysTemp3
	lds	SysTemp3,YOFFSET_H
	lds	SysTemp1,XRADIUS_H
	sbc	SysTemp3,SysTemp1
	sts	GLCDY_H,SysTemp3
	lds	SysValueCopy,LINECOLOUR
	sts	GLCDCOLOUR,SysValueCopy
	lds	SysValueCopy,LINECOLOUR_H
	sts	GLCDCOLOUR_H,SysValueCopy
	call	PSET_ILI9341
;yordinate ++
	lds	SysTemp3,YORDINATE
	inc	SysTemp3
	sts	YORDINATE,SysTemp3
;If radiusErr < 0 Then
	lds	SysINTEGERTempA,RADIUSERR
	lds	SysINTEGERTempA_H,RADIUSERR_H
	ldi	SysINTEGERTempB,0
	ldi	SysINTEGERTempB_H,0
	call	SysCompLessThanINT
	sbrs	SysByteTempX,0
	rjmp	ELSE16_1
;radiusErr = radiusErr + 2 * yordinate + 1
	lds	SysTemp1,YORDINATE
	lsl	SysTemp1
	lds	SysTemp4,RADIUSERR
	add	SysTemp4,SysTemp1
	mov	SysTemp3,SysTemp4
	lds	SysTemp1,RADIUSERR_H
	ldi	SysTemp4,0
	adc	SysTemp1,SysTemp4
	mov	SysTemp3_H,SysTemp1
	ldi	SysTemp4,1
	add	SysTemp3,SysTemp4
	sts	RADIUSERR,SysTemp3
	ldi	SysTemp4,0
	adc	SysTemp3_H,SysTemp4
	sts	RADIUSERR_H,SysTemp3_H
;else
	rjmp	ENDIF16
ELSE16_1:
;xradius --
	lds	SysTemp1,XRADIUS
	ldi	SysTemp4,1
	sub	SysTemp1,SysTemp4
	sts	XRADIUS,SysTemp1
	lds	SysTemp1,XRADIUS_H
	ldi	SysTemp4,0
	sbc	SysTemp1,SysTemp4
	sts	XRADIUS_H,SysTemp1
;radiusErr = radiusErr + 2 * (yordinate - xradius + 1)
	lds	SysTemp1,YORDINATE
	lds	SysTemp4,XRADIUS
	sub	SysTemp1,SysTemp4
	mov	SysTemp3,SysTemp1
	ldi	SysTemp4,0
	lds	SysTemp1,XRADIUS_H
	sbc	SysTemp4,SysTemp1
	mov	SysTemp3_H,SysTemp4
	ldi	SysTemp4,1
	add	SysTemp3,SysTemp4
	mov	SysTemp1,SysTemp3
	ldi	SysTemp4,0
	adc	SysTemp3_H,SysTemp4
	mov	SysTemp1_H,SysTemp3_H
	mov	SysINTEGERTempA,SysTemp1
	mov	SysINTEGERTempA_H,SysTemp1_H
	ldi	SysINTEGERTempB,2
	ldi	SysINTEGERTempB_H,0
	call	SysMultSubINT
	lds	SysTemp1,RADIUSERR
	add	SysTemp1,SysINTEGERTempX
	sts	RADIUSERR,SysTemp1
	lds	SysTemp1,RADIUSERR_H
	adc	SysTemp1,SysINTEGERTempX_H
	sts	RADIUSERR_H,SysTemp1
;end if
ENDIF16:
;Loop
	rjmp	SysDoLoop_S4
SysDoLoop_E4:
	ret

;********************************************************************************

DRAWBIGCHAR_ILI9341:
;dim Locx, Locy, CurrCol as Word
;if CharCode <=126 Then
	ldi	SysCalcTempA,126
	lds	SysCalcTempB,CHARCODE
	cp	SysCalcTempA,SysCalcTempB
	brlo	ENDIF39
;CharCode -=32
	lds	SysTemp1,CHARCODE
	ldi	SysTemp4,32
	sub	SysTemp1,SysTemp4
	sts	CHARCODE,SysTemp1
;Goto GCBBigTables
	rjmp	GCBBIGTABLES
;end if
ENDIF39:
;if CharCode <=210 Then
	ldi	SysCalcTempA,210
	lds	SysCalcTempB,CHARCODE
	cp	SysCalcTempA,SysCalcTempB
	brlo	ENDIF40
;CharCode -=33
	lds	SysTemp1,CHARCODE
	ldi	SysTemp4,33
	sub	SysTemp1,SysTemp4
	sts	CHARCODE,SysTemp1
;Goto GCBBigTables
	rjmp	GCBBIGTABLES
;end if
ENDIF40:
;if CharCode <= 250 Then
	ldi	SysCalcTempA,250
	lds	SysCalcTempB,CHARCODE
	cp	SysCalcTempA,SysCalcTempB
	brlo	ENDIF41
;CharCode -=34
	lds	SysTemp1,CHARCODE
	ldi	SysTemp4,34
	sub	SysTemp1,SysTemp4
	sts	CHARCODE,SysTemp1
;Goto GCBBigTables
	rjmp	GCBBIGTABLES
;end if
ENDIF41:
GCBBIGTABLES:
;For CurrCharCol = 1 to 24
	ldi	SysValueCopy,0
	sts	CURRCHARCOL,SysValueCopy
SysForLoop11:
	lds	SysTemp1,CURRCHARCOL
	inc	SysTemp1
	sts	CURRCHARCOL,SysTemp1
;CurrCol=CurrCharCol+CharCode*24-(CharCode/10)*240
	lds	SysBYTETempA,CHARCODE
	ldi	SysBYTETempB,10
	call	SysDivSub
	mov	SysTemp1,SysBYTETempA
	lds	SysBYTETempA,CHARCODE
	ldi	SysBYTETempB,24
	mul	SysByteTempA,SysByteTempB
	mov	SysTemp3,SysByteTempX
	mov	SysBYTETempA,SysTemp1
	ldi	SysBYTETempB,240
	mul	SysByteTempA,SysByteTempB
	lds	SysTemp4,CURRCHARCOL
	add	SysTemp4,SysTemp3
	mov	SysTemp1,SysTemp4
	clr	SysTemp3
	brcc	PC + 2
	inc	SysTemp3
	mov	SysTemp1_H,SysTemp3
	sub	SysTemp1,SysByteTempX
	sts	CURRCOL,SysTemp1
	ldi	SysTemp4,0
	sbc	SysTemp1_H,SysTemp4
	sts	CURRCOL_H,SysTemp1_H
;if CharCode>=0 and CharCode<=9 then ReadTable BigFont32_41 , CurrCol, CurrCharVal
	lds	SysBYTETempA,CHARCODE
	ldi	SysBYTETempB,0
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp1,SysByteTempX
	lds	SysBYTETempB,CHARCODE
	ldi	SysBYTETempA,9
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp4,SysByteTempX
	and	SysTemp4,SysTemp1
	mov	SysTemp3,SysTemp4
	sbrs	SysTemp3,0
	rjmp	ENDIF42
	lds	SYSSTRINGA,CURRCOL
	rcall	BIGFONT32_41
	sts	CURRCHARVAL,SysByteTempX
ENDIF42:
;if CharCode>=10 and CharCode<=19 then ReadTable BigFont42_51 , CurrCol, CurrCharVal
	lds	SysBYTETempA,CHARCODE
	ldi	SysBYTETempB,10
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp1,SysByteTempX
	lds	SysBYTETempB,CHARCODE
	ldi	SysBYTETempA,19
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp4,SysByteTempX
	and	SysTemp4,SysTemp1
	mov	SysTemp3,SysTemp4
	sbrs	SysTemp3,0
	rjmp	ENDIF43
	lds	SYSSTRINGA,CURRCOL
	rcall	BIGFONT42_51
	sts	CURRCHARVAL,SysByteTempX
ENDIF43:
;if CharCode>=20 and CharCode<=29 then ReadTable BigFont52_61 , CurrCol, CurrCharVal
	lds	SysBYTETempA,CHARCODE
	ldi	SysBYTETempB,20
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp1,SysByteTempX
	lds	SysBYTETempB,CHARCODE
	ldi	SysBYTETempA,29
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp4,SysByteTempX
	and	SysTemp4,SysTemp1
	mov	SysTemp3,SysTemp4
	sbrs	SysTemp3,0
	rjmp	ENDIF44
	lds	SYSSTRINGA,CURRCOL
	rcall	BIGFONT52_61
	sts	CURRCHARVAL,SysByteTempX
ENDIF44:
;if CharCode>=30 and CharCode<=39 then ReadTable BigFont62_71 , CurrCol, CurrCharVal
	lds	SysBYTETempA,CHARCODE
	ldi	SysBYTETempB,30
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp1,SysByteTempX
	lds	SysBYTETempB,CHARCODE
	ldi	SysBYTETempA,39
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp4,SysByteTempX
	and	SysTemp4,SysTemp1
	mov	SysTemp3,SysTemp4
	sbrs	SysTemp3,0
	rjmp	ENDIF45
	lds	SYSSTRINGA,CURRCOL
	rcall	BIGFONT62_71
	sts	CURRCHARVAL,SysByteTempX
ENDIF45:
;if CharCode>=40 and CharCode<=49 then ReadTable BigFont72_81 , CurrCol, CurrCharVal
	lds	SysBYTETempA,CHARCODE
	ldi	SysBYTETempB,40
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp1,SysByteTempX
	lds	SysBYTETempB,CHARCODE
	ldi	SysBYTETempA,49
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp4,SysByteTempX
	and	SysTemp4,SysTemp1
	mov	SysTemp3,SysTemp4
	sbrs	SysTemp3,0
	rjmp	ENDIF46
	lds	SYSSTRINGA,CURRCOL
	rcall	BIGFONT72_81
	sts	CURRCHARVAL,SysByteTempX
ENDIF46:
;if CharCode>=50 and CharCode<=59 then ReadTable BigFont82_91 , CurrCol, CurrCharVal
	lds	SysBYTETempA,CHARCODE
	ldi	SysBYTETempB,50
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp1,SysByteTempX
	lds	SysBYTETempB,CHARCODE
	ldi	SysBYTETempA,59
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp4,SysByteTempX
	and	SysTemp4,SysTemp1
	mov	SysTemp3,SysTemp4
	sbrs	SysTemp3,0
	rjmp	ENDIF47
	lds	SYSSTRINGA,CURRCOL
	rcall	BIGFONT82_91
	sts	CURRCHARVAL,SysByteTempX
ENDIF47:
;if CharCode>=60 and CharCode<=69 then ReadTable BigFont92_101 , CurrCol, CurrCharVal
	lds	SysBYTETempA,CHARCODE
	ldi	SysBYTETempB,60
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp1,SysByteTempX
	lds	SysBYTETempB,CHARCODE
	ldi	SysBYTETempA,69
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp4,SysByteTempX
	and	SysTemp4,SysTemp1
	mov	SysTemp3,SysTemp4
	sbrs	SysTemp3,0
	rjmp	ENDIF48
	lds	SYSSTRINGA,CURRCOL
	rcall	BIGFONT92_101
	sts	CURRCHARVAL,SysByteTempX
ENDIF48:
;if CharCode>=70 and CharCode<=79 then ReadTable BigFont102_111 , CurrCol, CurrCharVal
	lds	SysBYTETempA,CHARCODE
	ldi	SysBYTETempB,70
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp1,SysByteTempX
	lds	SysBYTETempB,CHARCODE
	ldi	SysBYTETempA,79
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp4,SysByteTempX
	and	SysTemp4,SysTemp1
	mov	SysTemp3,SysTemp4
	sbrs	SysTemp3,0
	rjmp	ENDIF49
	lds	SYSSTRINGA,CURRCOL
	call	BIGFONT102_111
	sts	CURRCHARVAL,SysByteTempX
ENDIF49:
;if CharCode>=80 and CharCode<=89 then ReadTable BigFont112_121 , CurrCol, CurrCharVal
	lds	SysBYTETempA,CHARCODE
	ldi	SysBYTETempB,80
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp1,SysByteTempX
	lds	SysBYTETempB,CHARCODE
	ldi	SysBYTETempA,89
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp4,SysByteTempX
	and	SysTemp4,SysTemp1
	mov	SysTemp3,SysTemp4
	sbrs	SysTemp3,0
	rjmp	ENDIF50
	lds	SYSSTRINGA,CURRCOL
	call	BIGFONT112_121
	sts	CURRCHARVAL,SysByteTempX
ENDIF50:
;if CharCode>=90 and CharCode<=99 then ReadTable BigFont122_126 , CurrCol, CurrCharVal
	lds	SysBYTETempA,CHARCODE
	ldi	SysBYTETempB,90
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp1,SysByteTempX
	lds	SysBYTETempB,CHARCODE
	ldi	SysBYTETempA,99
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp4,SysByteTempX
	and	SysTemp4,SysTemp1
	mov	SysTemp3,SysTemp4
	sbrs	SysTemp3,0
	rjmp	ENDIF51
	lds	SYSSTRINGA,CURRCOL
	call	BIGFONT122_126
	sts	CURRCHARVAL,SysByteTempX
ENDIF51:
;if CharCode>=160 and CharCode<=169 then ReadTable BigFont193_202 , CurrCol, CurrCharVal
	lds	SysBYTETempA,CHARCODE
	ldi	SysBYTETempB,160
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp1,SysByteTempX
	lds	SysBYTETempB,CHARCODE
	ldi	SysBYTETempA,169
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp4,SysByteTempX
	and	SysTemp4,SysTemp1
	mov	SysTemp3,SysTemp4
	sbrs	SysTemp3,0
	rjmp	ENDIF52
	lds	SYSSTRINGA,CURRCOL
	call	BIGFONT193_202
	sts	CURRCHARVAL,SysByteTempX
ENDIF52:
;if CharCode>=170 and CharCode<=179 then ReadTable BigFont203_212 , CurrCol, CurrCharVal
	lds	SysBYTETempA,CHARCODE
	ldi	SysBYTETempB,170
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp1,SysByteTempX
	lds	SysBYTETempB,CHARCODE
	ldi	SysBYTETempA,179
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp4,SysByteTempX
	and	SysTemp4,SysTemp1
	mov	SysTemp3,SysTemp4
	sbrs	SysTemp3,0
	rjmp	ENDIF53
	lds	SYSSTRINGA,CURRCOL
	call	BIGFONT203_212
	sts	CURRCHARVAL,SysByteTempX
ENDIF53:
;if CharCode>=180 and CharCode<=183 then ReadTable BigFont213_216 , CurrCol, CurrCharVal
	lds	SysBYTETempA,CHARCODE
	ldi	SysBYTETempB,180
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp1,SysByteTempX
	lds	SysBYTETempB,CHARCODE
	ldi	SysBYTETempA,183
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp4,SysByteTempX
	and	SysTemp4,SysTemp1
	mov	SysTemp3,SysTemp4
	sbrs	SysTemp3,0
	rjmp	ENDIF54
	lds	SYSSTRINGA,CURRCOL
	call	BIGFONT213_216
	sts	CURRCHARVAL,SysByteTempX
ENDIF54:
;if CurrCharVal=36 then CurrCharVal=33
	lds	SysCalcTempA,CURRCHARVAL
	cpi	SysCalcTempA,36
	brne	ENDIF55
	ldi	SysValueCopy,33
	sts	CURRCHARVAL,SysValueCopy
ENDIF55:
;For CurrCharRow = 1 to 8
	ldi	SysValueCopy,0
	sts	CURRCHARROW,SysValueCopy
SysForLoop12:
	lds	SysTemp1,CURRCHARROW
	inc	SysTemp1
	sts	CURRCHARROW,SysTemp1
;LocX=[word]CharLocX+CurrCharCol
	lds	SysTemp1,CHARLOCX
	lds	SysTemp3,CURRCHARCOL
	add	SysTemp1,SysTemp3
	sts	LOCX,SysTemp1
	lds	SysTemp1,CHARLOCX_H
	ldi	SysTemp4,0
	adc	SysTemp1,SysTemp4
	sts	LOCX_H,SysTemp1
;LocY=[Word]CharLocY+CurrCharRow
	lds	SysTemp1,CHARLOCY
	lds	SysTemp3,CURRCHARROW
	add	SysTemp1,SysTemp3
	sts	LOCY,SysTemp1
	lds	SysTemp1,CHARLOCY_H
	ldi	SysTemp4,0
	adc	SysTemp1,SysTemp4
	sts	LOCY_H,SysTemp1
;if CurrCharCol>12 then
	ldi	SysCalcTempA,12
	lds	SysCalcTempB,CURRCHARCOL
	cp	SysCalcTempA,SysCalcTempB
	brsh	ENDIF56
;LocX= LocX - 12
	lds	SysTemp1,LOCX
	ldi	SysTemp4,12
	sub	SysTemp1,SysTemp4
	sts	LOCX,SysTemp1
	lds	SysTemp1,LOCX_H
	ldi	SysTemp4,0
	sbc	SysTemp1,SysTemp4
	sts	LOCX_H,SysTemp1
;LocY= LocY + 8
	lds	SysTemp1,LOCY
	ldi	SysTemp4,8
	add	SysTemp1,SysTemp4
	sts	LOCY,SysTemp1
	lds	SysTemp1,LOCY_H
	ldi	SysTemp4,0
	adc	SysTemp1,SysTemp4
	sts	LOCY_H,SysTemp1
;end if
ENDIF56:
;if CurrCharVal.0=1 then
	lds	SysBitTest,CURRCHARVAL
	sbrs	SysBitTest,0
	rjmp	ENDIF57
;PSet_ILI9341 LocX , LocY , Color
	lds	SysValueCopy,LOCX
	sts	GLCDX,SysValueCopy
	lds	SysValueCopy,LOCX_H
	sts	GLCDX_H,SysValueCopy
	lds	SysValueCopy,LOCY
	sts	GLCDY,SysValueCopy
	lds	SysValueCopy,LOCY_H
	sts	GLCDY_H,SysValueCopy
	lds	SysValueCopy,COLOR
	sts	GLCDCOLOUR,SysValueCopy
	lds	SysValueCopy,COLOR_H
	sts	GLCDCOLOUR_H,SysValueCopy
	call	PSET_ILI9341
;end if
ENDIF57:
;Rotate CurrCharVal Right
	lds	SysValueCopy,CURRCHARVAL
	ror	SysValueCopy
	sts	CURRCHARVAL,SysValueCopy
;Next
	lds	SysCalcTempA,CURRCHARROW
	cpi	SysCalcTempA,8
	brsh	ENDIF58
	rjmp	SysForLoop12
ENDIF58:
SysForLoopEnd12:
;Next
	lds	SysCalcTempA,CURRCHARCOL
	cpi	SysCalcTempA,24
	brsh	ENDIF59
	rjmp	SysForLoop11
ENDIF59:
SysForLoopEnd11:
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

Delay_S:
DS_START:
	ldi	SysWaitTempMS,232
	ldi	SysWaitTempMS_H,3
	rcall	Delay_MS
	dec	SysWaitTempS
	brne	DS_START
	ret

;********************************************************************************

FILLEDBOX_ILI9341:
;dim GLCDTemp as word
;Make sure that starting point (1) is always less than end point (2)
;If LineX1 > LineX2 Then
	lds	SysWORDTempB,LINEX1
	lds	SysWORDTempB_H,LINEX1_H
	lds	SysWORDTempA,LINEX2
	lds	SysWORDTempA_H,LINEX2_H
	call	SysCompLessThan16
	sbrs	SysByteTempX,0
	rjmp	ENDIF33
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
ENDIF33:
;If LineY1 > LineY2 Then
	lds	SysWORDTempB,LINEY1
	lds	SysWORDTempB_H,LINEY1_H
	lds	SysWORDTempA,LINEY2
	lds	SysWORDTempA_H,LINEY2_H
	call	SysCompLessThan16
	sbrs	SysByteTempX,0
	rjmp	ENDIF34
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
ENDIF34:
;Set address window
;SetAddress_ILI9341 ILI9341_COLUMN, LineX1, LineX2
;SetAddress_ILI9341 ILI9341_ROW, LineY1, LineY2
;SetAddressWindow_ILI9341 (  LineX1, LineY1, LineX2, LineY2 )
	lds	SysValueCopy,LINEX1
	sts	_X1,SysValueCopy
	lds	SysValueCopy,LINEX1_H
	sts	_X1_H,SysValueCopy
	lds	SysValueCopy,LINEY1
	sts	_Y1,SysValueCopy
	lds	SysValueCopy,LINEY1_H
	sts	_Y1_H,SysValueCopy
	lds	SysValueCopy,LINEX2
	sts	_X2,SysValueCopy
	lds	SysValueCopy,LINEX2_H
	sts	_X2_H,SysValueCopy
	lds	SysValueCopy,LINEY2
	sts	_Y2,SysValueCopy
	lds	SysValueCopy,LINEY2_H
	sts	_Y2_H,SysValueCopy
	call	SETADDRESSWINDOW_ILI9341
;Fill with colour
;Dim GLCDPixelCount As Word
;GLCDPixelCount = (LineX2 - LineX1 + 1) * (LineY2 - LineY1 + 1)
	lds	SysTemp3,LINEX2
	lds	SysTemp4,LINEX1
	sub	SysTemp3,SysTemp4
	mov	SysTemp1,SysTemp3
	lds	SysTemp3,LINEX2_H
	lds	SysTemp4,LINEX1_H
	sbc	SysTemp3,SysTemp4
	mov	SysTemp1_H,SysTemp3
	ldi	SysTemp4,1
	add	SysTemp1,SysTemp4
	mov	SysTemp3,SysTemp1
	ldi	SysTemp4,0
	adc	SysTemp1_H,SysTemp4
	mov	SysTemp3_H,SysTemp1_H
	lds	SysTemp4,LINEY2
	lds	SysTemp2,LINEY1
	sub	SysTemp4,SysTemp2
	mov	SysTemp1,SysTemp4
	lds	SysTemp4,LINEY2_H
	lds	SysTemp2,LINEY1_H
	sbc	SysTemp4,SysTemp2
	mov	SysTemp1_H,SysTemp4
	ldi	SysTemp4,1
	add	SysTemp1,SysTemp4
	mov	SysTemp2,SysTemp1
	ldi	SysTemp4,0
	adc	SysTemp1_H,SysTemp4
	mov	SysTemp2_H,SysTemp1_H
	mov	SysWORDTempA,SysTemp3
	mov	SysWORDTempA_H,SysTemp3_H
	mov	SysWORDTempB,SysTemp2
	mov	SysWORDTempB_H,SysTemp2_H
	call	SysMultSub16
	sts	GLCDPIXELCOUNT,SysWORDTempX
	sts	GLCDPIXELCOUNT_H,SysWORDTempX_H
;Repeat GLCDPixelCount
	lds	SysValueCopy,GLCDPIXELCOUNT
	sts	SysRepeatTemp4,SysValueCopy
	lds	SysValueCopy,GLCDPIXELCOUNT_H
	sts	SysRepeatTemp4_H,SysValueCopy
	lds	SysWORDTempA,SYSREPEATTEMP4
	lds	SysWORDTempA_H,SYSREPEATTEMP4_H
	ldi	SysWORDTempB,1
	ldi	SysWORDTempB_H,0
	call	SysCompLessThan16
	sbrc	SysByteTempX,0
	rjmp	SysRepeatLoopEnd4
	lds	SysCalcTempA,SYSREPEATTEMP4
	tst	SysCalcTempA
	breq	ENDIF35
	lds	SysTemp1,SysRepeatTemp4_H
	inc	SysTemp1
	sts	SysRepeatTemp4_H,SysTemp1
ENDIF35:
SysRepeatLoop4:
;SendWord_ILI9341 LineColour
	lds	SysValueCopy,LINECOLOUR
	sts	ILI9341SENDWORD,SysValueCopy
	lds	SysValueCopy,LINECOLOUR_H
	sts	ILI9341SENDWORD_H,SysValueCopy
	call	SENDWORD_ILI9341
;End Repeat
	lds	SysTemp1,SysRepeatTemp4
	lds	SysTemp1_H,SysRepeatTemp4_H
	dec	SysTemp1
	sts	SysRepeatTemp4,SysTemp1
	brne	SysRepeatLoop4
	dec	SysTemp1_H
	sts	SysRepeatTemp4_H,SysTemp1_H
	brne	SysRepeatLoop4
SysRepeatLoopEnd4:
	ret

;********************************************************************************

FILLEDCIRCLE:
;Circle fill Code is merely a modification of the midpoint
;circle algorithem which is an adaption of Bresenham's line algorithm
;http://en.wikipedia.org/wiki/Midpoint_circle_algorithm
;http://en.wikipedia.org/wiki/Bresenham%27s_line_algorithm
;dim ff, ddF_x, ddF_y as integer
;dim YCalc2, YCalc1 as word
;ff = 1 - xradius
	ldi	SysTemp4,1
	lds	SysTemp1,XRADIUS
	sub	SysTemp4,SysTemp1
	sts	FF,SysTemp4
	ldi	SysTemp4,0
	lds	SysTemp1,XRADIUS_H
	sbc	SysTemp4,SysTemp1
	sts	FF_H,SysTemp4
;ddF_x = 1
	ldi	SysValueCopy,1
	sts	DDF_X,SysValueCopy
	ldi	SysValueCopy,0
	sts	DDF_X_H,SysValueCopy
;ddF_y = -2 * xradius
	lds	SysINTEGERTempA,XRADIUS
	lds	SysINTEGERTempA_H,XRADIUS_H
	ldi	SysINTEGERTempB,254
	ldi	SysINTEGERTempB_H,255
	call	SysMultSubINT
	sts	DDF_Y,SysINTEGERTempX
	sts	DDF_Y_H,SysINTEGERTempX_H
;FillCircleXX = 0
	ldi	SysValueCopy,0
	sts	FILLCIRCLEXX,SysValueCopy
;FillCircleYY = xradius
	lds	SysValueCopy,XRADIUS
	sts	FILLCIRCLEYY,SysValueCopy
;Fill in the center between the two halves
;YCalc2 = yoffset+xradius
	lds	SysTemp1,YOFFSET
	lds	SysTemp3,XRADIUS
	add	SysTemp1,SysTemp3
	sts	YCALC2,SysTemp1
	lds	SysTemp1,YOFFSET_H
	lds	SysTemp3,XRADIUS_H
	adc	SysTemp1,SysTemp3
	sts	YCALC2_H,SysTemp1
;YCalc1 = yoffset-xradius
	lds	SysTemp1,YOFFSET
	lds	SysTemp3,XRADIUS
	sub	SysTemp1,SysTemp3
	sts	YCALC1,SysTemp1
	lds	SysTemp1,YOFFSET_H
	lds	SysTemp3,XRADIUS_H
	sbc	SysTemp1,SysTemp3
	sts	YCALC1_H,SysTemp1
;Line( xoffset, YCalc1 , xoffset, YCalc2, LineColour)
	lds	SysValueCopy,XOFFSET
	sts	LINEX1,SysValueCopy
	lds	SysValueCopy,XOFFSET_H
	sts	LINEX1_H,SysValueCopy
	lds	SysValueCopy,YCALC1
	sts	LINEY1,SysValueCopy
	lds	SysValueCopy,YCALC1_H
	sts	LINEY1_H,SysValueCopy
	lds	SysValueCopy,XOFFSET
	sts	LINEX2,SysValueCopy
	lds	SysValueCopy,XOFFSET_H
	sts	LINEX2_H,SysValueCopy
	lds	SysValueCopy,YCALC2
	sts	LINEY2,SysValueCopy
	lds	SysValueCopy,YCALC2_H
	sts	LINEY2_H,SysValueCopy
	call	LINE
;do while (FillCircleXX < FillCircleYY)
SysDoLoop_S5:
	lds	SysCalcTempA,FILLCIRCLEXX
	lds	SysCalcTempB,FILLCIRCLEYY
	cp	SysCalcTempA,SysCalcTempB
	brlo	PC + 2
	rjmp	SysDoLoop_E5
;if ff >= 0 then
	lds	SysINTEGERTempA,FF
	lds	SysINTEGERTempA_H,FF_H
	ldi	SysINTEGERTempB,0
	ldi	SysINTEGERTempB_H,0
	call	SysCompLessThanINT
	com	SysByteTempX
	sbrs	SysByteTempX,0
	rjmp	ENDIF17
;FillCircleYY--
	lds	SysTemp1,FILLCIRCLEYY
	dec	SysTemp1
	sts	FILLCIRCLEYY,SysTemp1
;ddF_y += 2
	lds	SysTemp1,DDF_Y
	ldi	SysTemp4,2
	add	SysTemp1,SysTemp4
	sts	DDF_Y,SysTemp1
	lds	SysTemp1,DDF_Y_H
	ldi	SysTemp4,0
	adc	SysTemp1,SysTemp4
	sts	DDF_Y_H,SysTemp1
;ff += ddF_y
	lds	SysTemp1,FF
	lds	SysTemp3,DDF_Y
	add	SysTemp1,SysTemp3
	sts	FF,SysTemp1
	lds	SysTemp1,FF_H
	lds	SysTemp3,DDF_Y_H
	adc	SysTemp1,SysTemp3
	sts	FF_H,SysTemp1
;end if
ENDIF17:
;FillCircleXX++
	lds	SysTemp1,FILLCIRCLEXX
	inc	SysTemp1
	sts	FILLCIRCLEXX,SysTemp1
;ddF_x += 2
	lds	SysTemp1,DDF_X
	ldi	SysTemp4,2
	add	SysTemp1,SysTemp4
	sts	DDF_X,SysTemp1
	lds	SysTemp1,DDF_X_H
	ldi	SysTemp4,0
	adc	SysTemp1,SysTemp4
	sts	DDF_X_H,SysTemp1
;ff += ddF_x
	lds	SysTemp1,FF
	lds	SysTemp3,DDF_X
	add	SysTemp1,SysTemp3
	sts	FF,SysTemp1
	lds	SysTemp1,FF_H
	lds	SysTemp3,DDF_X_H
	adc	SysTemp1,SysTemp3
	sts	FF_H,SysTemp1
;Now draw vertical lines between the points on the circle rather than
;draw the points of the circle. This draws lines between the
;perimeter points on the upper and lower quadrants of the 2 halves of the circle.
;Line(xoffset+FillCircleXX, yoffset+FillCircleYY, xoffset+FillCircleXX, yoffset-FillCircleYY, LineColour);
	lds	SysTemp1,XOFFSET
	lds	SysTemp3,FILLCIRCLEXX
	add	SysTemp1,SysTemp3
	sts	LINEX1,SysTemp1
	lds	SysTemp1,XOFFSET_H
	ldi	SysTemp4,0
	adc	SysTemp1,SysTemp4
	sts	LINEX1_H,SysTemp1
	lds	SysTemp1,YOFFSET
	lds	SysTemp3,FILLCIRCLEYY
	add	SysTemp1,SysTemp3
	sts	LINEY1,SysTemp1
	lds	SysTemp1,YOFFSET_H
	ldi	SysTemp4,0
	adc	SysTemp1,SysTemp4
	sts	LINEY1_H,SysTemp1
	lds	SysTemp1,XOFFSET
	lds	SysTemp3,FILLCIRCLEXX
	add	SysTemp1,SysTemp3
	sts	LINEX2,SysTemp1
	lds	SysTemp1,XOFFSET_H
	ldi	SysTemp4,0
	adc	SysTemp1,SysTemp4
	sts	LINEX2_H,SysTemp1
	lds	SysTemp1,YOFFSET
	lds	SysTemp3,FILLCIRCLEYY
	sub	SysTemp1,SysTemp3
	sts	LINEY2,SysTemp1
	lds	SysTemp1,YOFFSET_H
	ldi	SysTemp4,0
	sbc	SysTemp1,SysTemp4
	sts	LINEY2_H,SysTemp1
	call	LINE
;Line(xoffset-FillCircleXX, yoffset+FillCircleYY, xoffset-FillCircleXX, yoffset-FillCircleYY, LineColour);
	lds	SysTemp1,XOFFSET
	lds	SysTemp3,FILLCIRCLEXX
	sub	SysTemp1,SysTemp3
	sts	LINEX1,SysTemp1
	lds	SysTemp1,XOFFSET_H
	ldi	SysTemp4,0
	sbc	SysTemp1,SysTemp4
	sts	LINEX1_H,SysTemp1
	lds	SysTemp1,YOFFSET
	lds	SysTemp3,FILLCIRCLEYY
	add	SysTemp1,SysTemp3
	sts	LINEY1,SysTemp1
	lds	SysTemp1,YOFFSET_H
	ldi	SysTemp4,0
	adc	SysTemp1,SysTemp4
	sts	LINEY1_H,SysTemp1
	lds	SysTemp1,XOFFSET
	lds	SysTemp3,FILLCIRCLEXX
	sub	SysTemp1,SysTemp3
	sts	LINEX2,SysTemp1
	lds	SysTemp1,XOFFSET_H
	ldi	SysTemp4,0
	sbc	SysTemp1,SysTemp4
	sts	LINEX2_H,SysTemp1
	lds	SysTemp1,YOFFSET
	lds	SysTemp3,FILLCIRCLEYY
	sub	SysTemp1,SysTemp3
	sts	LINEY2,SysTemp1
	lds	SysTemp1,YOFFSET_H
	ldi	SysTemp4,0
	sbc	SysTemp1,SysTemp4
	sts	LINEY2_H,SysTemp1
	call	LINE
;Line(xoffset+FillCircleYY, yoffset+FillCircleXX, FillCircleYY+xoffset, yoffset-FillCircleXX, LineColour);
	lds	SysTemp1,XOFFSET
	lds	SysTemp3,FILLCIRCLEYY
	add	SysTemp1,SysTemp3
	sts	LINEX1,SysTemp1
	lds	SysTemp1,XOFFSET_H
	ldi	SysTemp4,0
	adc	SysTemp1,SysTemp4
	sts	LINEX1_H,SysTemp1
	lds	SysTemp1,YOFFSET
	lds	SysTemp3,FILLCIRCLEXX
	add	SysTemp1,SysTemp3
	sts	LINEY1,SysTemp1
	lds	SysTemp1,YOFFSET_H
	ldi	SysTemp4,0
	adc	SysTemp1,SysTemp4
	sts	LINEY1_H,SysTemp1
	lds	SysTemp1,FILLCIRCLEYY
	lds	SysTemp3,XOFFSET
	add	SysTemp1,SysTemp3
	sts	LINEX2,SysTemp1
	ldi	SysTemp4,0
	lds	SysTemp1,XOFFSET_H
	adc	SysTemp4,SysTemp1
	sts	LINEX2_H,SysTemp4
	lds	SysTemp1,YOFFSET
	lds	SysTemp3,FILLCIRCLEXX
	sub	SysTemp1,SysTemp3
	sts	LINEY2,SysTemp1
	lds	SysTemp1,YOFFSET_H
	ldi	SysTemp4,0
	sbc	SysTemp1,SysTemp4
	sts	LINEY2_H,SysTemp1
	call	LINE
;Line(xoffset-FillCircleYY, yoffset+FillCircleXX, xoffset-FillCircleYY, yoffset-FillCircleXX, LineColour);
	lds	SysTemp1,XOFFSET
	lds	SysTemp3,FILLCIRCLEYY
	sub	SysTemp1,SysTemp3
	sts	LINEX1,SysTemp1
	lds	SysTemp1,XOFFSET_H
	ldi	SysTemp4,0
	sbc	SysTemp1,SysTemp4
	sts	LINEX1_H,SysTemp1
	lds	SysTemp1,YOFFSET
	lds	SysTemp3,FILLCIRCLEXX
	add	SysTemp1,SysTemp3
	sts	LINEY1,SysTemp1
	lds	SysTemp1,YOFFSET_H
	ldi	SysTemp4,0
	adc	SysTemp1,SysTemp4
	sts	LINEY1_H,SysTemp1
	lds	SysTemp1,XOFFSET
	lds	SysTemp3,FILLCIRCLEYY
	sub	SysTemp1,SysTemp3
	sts	LINEX2,SysTemp1
	lds	SysTemp1,XOFFSET_H
	ldi	SysTemp4,0
	sbc	SysTemp1,SysTemp4
	sts	LINEX2_H,SysTemp1
	lds	SysTemp1,YOFFSET
	lds	SysTemp3,FILLCIRCLEXX
	sub	SysTemp1,SysTemp3
	sts	LINEY2,SysTemp1
	lds	SysTemp1,YOFFSET_H
	ldi	SysTemp4,0
	sbc	SysTemp1,SysTemp4
	sts	LINEY2_H,SysTemp1
	rcall	LINE
;loop
	rjmp	SysDoLoop_S5
SysDoLoop_E5:
	ret

;********************************************************************************

GLCDCHARCOL3EXTENDED1:
	cpi	SysStringA, 240
	brlo	PC + 3
	clr	SysByteTempX
	ret
	ldi	SysReadA, low(TableGLCDCHARCOL3EXTENDED1<<1)
	ldi	SysReadA_H, high(TableGLCDCHARCOL3EXTENDED1<<1)
	add	SysReadA, SysStringA
	brcc	PC + 2
	inc	SysReadA_H
	lpm
	ret
TableGLCDCHARCOL3EXTENDED1:
	.DB	239,0,16,12,10,136,34,56,32,8,32,16,16,128,128,64,4,0,0,0,40,72,70,108,0,0,0,40
	.DB	16,0,16,0,64,124,0,132,130,48,78,120,6,108,12,0,0,16,40,0,4,100,248,254,124,254
	.DB	254,254,124,254,0,64,254,254,254,254,124,254,124,254,76,2,126,62,126,198,14,194
	.DB	0,4,0,8,128,0,64,254,112,112,112,16,16,254,0,64,254,0,248,248,112,248,16,248
	.DB	144,16,120,56,120,136,24,136,0,0,0,32,120,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.DB	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.DB	0,0,0,0,0,0,248,254,254,248,254,194,254,124,0,254,248,254,254,130,124,254,254,0
	.DB	198,2,14,56,198,14,188,0,0,56,40,124,0,0,56,254,4,48,40,1,124,48,0,124,64,252
	.DB	28,0,56,4,248,24,56,4,60,56,68,60,60,0,60,56,60,60

;********************************************************************************

GLCDCHARCOL4EXTENDED1:
	cpi	SysStringA, 240
	brlo	PC + 3
	clr	SysByteTempX
	ret
	ldi	SysReadA, low(TableGLCDCHARCOL4EXTENDED1<<1)
	ldi	SysReadA_H, high(TableGLCDCHARCOL4EXTENDED1<<1)
	add	SysReadA, SysStringA
	brcc	PC + 2
	inc	SysReadA_H
	lpm
	ret
TableGLCDCHARCOL4EXTENDED1:
	.DB	239,254,56,10,6,204,102,124,112,4,64,16,56,136,162,112,28,0,0,14,254,84,38,146
	.DB	10,56,130,16,16,160,16,192,32,162,132,194,130,40,138,148,2,146,146,108,172,40
	.DB	40,130,2,146,36,146,130,130,146,18,130,16,130,128,16,128,4,8,130,18,130,18,146,2
	.DB	128,64,128,40,16,162,254,8,130,4,128,2,168,144,136,136,168,252,168,16,144,128
	.DB	32,130,8,16,136,40,40,16,168,124,128,64,128,80,160,200,16,0,130,16,68,0,0,0,0,0
	.DB	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.DB	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,36,146,2,132,146,162,16,146,130,16,4,4
	.DB	8,146,130,2,18,0,170,2,16,68,40,16,194,0,0,68,84,8,0,0,68,73,104,73,84,25,8,74
	.DB	0,16,50,64,32,1,68,124,36,36,68,4,64,68,40,64,64,1,65,68,64,64

;********************************************************************************

GLCDCHARCOL5EXTENDED1:
	cpi	SysStringA, 240
	brlo	PC + 3
	clr	SysByteTempX
	ret
	ldi	SysReadA, low(TableGLCDCHARCOL5EXTENDED1<<1)
	ldi	SysReadA_H, high(TableGLCDCHARCOL5EXTENDED1<<1)
	add	SysReadA, SysStringA
	brcc	PC + 2
	inc	SysReadA_H
	lpm
	ret
TableGLCDCHARCOL5EXTENDED1:
	.DB	239,124,124,0,0,238,238,124,168,254,254,84,84,148,148,124,124,0,158,0,40,254,16,170
	.DB	6,68,68,124,124,96,16,192,16,146,254,162,138,36,138,146,226,146,146,108,108,68
	.DB	40,68,162,242,34,146,130,130,146,18,146,16,254,130,40,128,24,16,130,18,162,50
	.DB	146,254,128,128,112,16,224,146,130,16,130,2,128,4,168,136,136,136,168,18,168,8
	.DB	250,136,80,254,240,8,136,40,40,8,168,144,128,128,96,32,160,168,108,254,108,16
	.DB	66,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.DB	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,34,146,2,130,146,146,16,146
	.DB	254,40,2,24,16,146,130,2,18,0,146,254,224,254,16,254,2,0,0,69,84,5,61,0,68,73
	.DB	144,75,84,165,4,77,60,40,9,64,64,149,68,4,36,164,68,124,64,254,16,248,56,60,64,69
	.DB	66,58

;********************************************************************************

GLCDCHARCOL6EXTENDED1:
	cpi	SysStringA, 240
	brlo	PC + 3
	clr	SysByteTempX
	ret
	ldi	SysReadA, low(TableGLCDCHARCOL6EXTENDED1<<1)
	ldi	SysReadA_H, high(TableGLCDCHARCOL6EXTENDED1<<1)
	add	SysReadA, SysStringA
	brcc	PC + 2
	inc	SysReadA_H
	lpm
	ret
TableGLCDCHARCOL6EXTENDED1:
	.DB	239,56,254,12,10,204,102,124,32,4,64,56,16,162,136,112,28,0,0,14,254,84,200,68
	.DB	0,130,56,16,16,0,16,0,8,138,128,146,150,254,138,146,18,146,82,0,0,130,40,40,18,130
	.DB	36,146,130,68,146,18,146,16,130,126,68,128,4,32,130,18,66,82,146,2,128,64,128,40
	.DB	16,138,130,32,254,4,128,8,168,136,136,144,168,2,168,8,128,122,136,128,8,8,136,40
	.DB	48,8,168,128,64,64,128,80,160,152,130,0,16,32,68,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.DB	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.DB	0,0,0,0,0,0,0,0,0,0,36,146,2,132,146,138,16,146,130,68,4,4,32,146,130,2,18,0
	.DB	130,2,16,68,40,16,194,0,0,56,85,4,64,0,56,78,104,77,84,67,4,73,64,68,9,32,32,171
	.DB	68,124,36,164,76,4,64,68,40,64,64,65,65,68,65,65

;********************************************************************************

GLCDCHARCOL7EXTENDED1:
	cpi	SysStringA, 240
	brlo	PC + 3
	clr	SysByteTempX
	ret
	ldi	SysReadA, low(TableGLCDCHARCOL7EXTENDED1<<1)
	ldi	SysReadA_H, high(TableGLCDCHARCOL7EXTENDED1<<1)
	add	SysReadA, SysStringA
	brcc	PC + 2
	inc	SysReadA_H
	lpm
	ret
TableGLCDCHARCOL7EXTENDED1:
	.DB	239,16,0,10,6,136,34,56,62,8,32,16,16,128,128,64,4,0,0,0,40,36,196,160,0,0,0,40
	.DB	16,0,16,0,4,124,0,140,98,32,114,96,14,108,60,0,0,0,40,16,12,124,248,108,68,56
	.DB	130,2,244,254,0,2,130,128,254,254,124,12,188,140,100,2,126,62,126,198,14,134,0,64
	.DB	0,8,128,0,240,112,64,254,48,4,120,240,0,0,0,0,240,240,112,16,248,16,64,64,248,56
	.DB	120,136,120,136,0,0,0,16,120,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.DB	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.DB	248,108,2,248,130,134,254,124,0,130,248,254,254,130,124,254,12,0,130,2,14,56
	.DB	198,14,188,0,0,68,68,120,32,0,68,48,4,49,68,1,120,62,32,0,126,124,28,65,56,4,24,72
	.DB	52,4,60,56,68,60,60,32,60,56,60,60

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
	lds	SysTemp1,GLCDDEVICEWIDTH
	ldi	SysTemp4,1
	sub	SysTemp1,SysTemp4
	sts	_X2,SysTemp1
	lds	SysTemp1,GLCDDEVICEWIDTH_H
	ldi	SysTemp4,0
	sbc	SysTemp1,SysTemp4
	sts	_X2_H,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT
	ldi	SysTemp4,1
	sub	SysTemp1,SysTemp4
	sts	_Y2,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT_H
	ldi	SysTemp4,0
	sbc	SysTemp1,SysTemp4
	sts	_Y2_H,SysTemp1
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
	sts	SysRepeatTemp2,SysValueCopy
SysRepeatLoop2:
;repeat 38400  'ILI9341_GLCD_HEIGHT
	ldi	SysValueCopy,0
	sts	SysRepeatTemp3,SysValueCopy
	ldi	SysValueCopy,150
	sts	SysRepeatTemp3_H,SysValueCopy
SysRepeatLoop3:
;ILI9341_WR = 1
	sbi	PORTC,1
;PORTD = (PORTD & 0B00000011) | ((ILI9341SendWord_h) & 0B11111100)
	ldi	SysTemp4,3
	in	SysTemp3,PORTD
	and	SysTemp3,SysTemp4
	mov	SysTemp1,SysTemp3
	ldi	SysTemp4,252
	lds	SysTemp2,ILI9341SENDWORD_H
	and	SysTemp2,SysTemp4
	mov	SysTemp3,SysTemp2
	or	SysTemp3,SysTemp1
	out	PORTD,SysTemp3
;PORTB = (PORTB & 0B11111100) | ((ILI9341SendWord_h) & 0B00000011)
	ldi	SysTemp4,252
	in	SysTemp3,PORTB
	and	SysTemp3,SysTemp4
	mov	SysTemp1,SysTemp3
	ldi	SysTemp4,3
	lds	SysTemp2,ILI9341SENDWORD_H
	and	SysTemp2,SysTemp4
	mov	SysTemp3,SysTemp2
	or	SysTemp3,SysTemp1
	out	PORTB,SysTemp3
;ILI9341_WR = 0
	cbi	PORTC,1
;ILI9341_WR = 1
	sbi	PORTC,1
;PORTD = (PORTD & 0B00000011) | ((ILI9341SendWord) & 0B11111100)
	ldi	SysTemp4,3
	in	SysTemp3,PORTD
	and	SysTemp3,SysTemp4
	mov	SysTemp1,SysTemp3
	ldi	SysTemp4,252
	lds	SysTemp2,ILI9341SENDWORD
	and	SysTemp2,SysTemp4
	mov	SysTemp3,SysTemp2
	ldi	SysValueCopy,0
	mov	SysTemp3_H,SysValueCopy
	or	SysTemp3,SysTemp1
	out	PORTD,SysTemp3
;PORTB = (PORTB & 0B11111100) | ((ILI9341SendWord) & 0B00000011)
	ldi	SysTemp4,252
	in	SysTemp3,PORTB
	and	SysTemp3,SysTemp4
	mov	SysTemp1,SysTemp3
	ldi	SysTemp4,3
	lds	SysTemp2,ILI9341SENDWORD
	and	SysTemp2,SysTemp4
	mov	SysTemp3,SysTemp2
	ldi	SysValueCopy,0
	mov	SysTemp3_H,SysValueCopy
	or	SysTemp3,SysTemp1
	out	PORTB,SysTemp3
;ILI9341_WR = 0
	cbi	PORTC,1
;endif 8bit
;end repeat
	lds	SysTemp1,SysRepeatTemp3
	lds	SysTemp1_H,SysRepeatTemp3_H
	dec	SysTemp1
	sts	SysRepeatTemp3,SysTemp1
	brne	SysRepeatLoop3
	dec	SysTemp1_H
	sts	SysRepeatTemp3_H,SysTemp1_H
	breq	PC + 2
	rjmp	SysRepeatLoop3
SysRepeatLoopEnd3:
;end repeat
	lds	SysTemp1,SysRepeatTemp2
	dec	SysTemp1
	sts	SysRepeatTemp2,SysTemp1
	breq	PC + 2
	rjmp	SysRepeatLoop2
SysRepeatLoopEnd2:
;ILI9341_CS = 1
	sbi	PORTC,3
;8bit mode
;ILI9341_WR = 1
	sbi	PORTC,1
;PORTD = (PORTD & 0B00000011) | ((ILI9341SendWord_h) & 0B11111100)
	ldi	SysTemp4,3
	in	SysTemp3,PORTD
	and	SysTemp3,SysTemp4
	mov	SysTemp1,SysTemp3
	ldi	SysTemp4,252
	lds	SysTemp2,ILI9341SENDWORD_H
	and	SysTemp2,SysTemp4
	mov	SysTemp3,SysTemp2
	or	SysTemp3,SysTemp1
	out	PORTD,SysTemp3
;PORTB = (PORTB & 0B11111100) | ((ILI9341SendWord_h) & 0B00000011)
	ldi	SysTemp4,252
	in	SysTemp3,PORTB
	and	SysTemp3,SysTemp4
	mov	SysTemp1,SysTemp3
	ldi	SysTemp4,3
	lds	SysTemp2,ILI9341SENDWORD_H
	and	SysTemp2,SysTemp4
	mov	SysTemp3,SysTemp2
	or	SysTemp3,SysTemp1
	out	PORTB,SysTemp3
;ILI9341_WR = 0
	cbi	PORTC,1
;ILI9341_WR = 1
	sbi	PORTC,1
;PORTD = (PORTD & 0B00000011) | ((ILI9341SendWord) & 0B11111100)
	ldi	SysTemp4,3
	in	SysTemp3,PORTD
	and	SysTemp3,SysTemp4
	mov	SysTemp1,SysTemp3
	ldi	SysTemp4,252
	lds	SysTemp2,ILI9341SENDWORD
	and	SysTemp2,SysTemp4
	mov	SysTemp3,SysTemp2
	ldi	SysValueCopy,0
	mov	SysTemp3_H,SysValueCopy
	or	SysTemp3,SysTemp1
	out	PORTD,SysTemp3
;PORTB = (PORTB & 0B11111100) | ((ILI9341SendWord) & 0B00000011)
	ldi	SysTemp4,252
	in	SysTemp3,PORTB
	and	SysTemp3,SysTemp4
	mov	SysTemp1,SysTemp3
	ldi	SysTemp4,3
	lds	SysTemp2,ILI9341SENDWORD
	and	SysTemp2,SysTemp4
	mov	SysTemp3,SysTemp2
	ldi	SysValueCopy,0
	mov	SysTemp3_H,SysValueCopy
	or	SysTemp3,SysTemp1
	out	PORTB,SysTemp3
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
	ldi	SysTemp4,15
	sub	SysTemp1,SysTemp4
	sts	CHARCODE,SysTemp1
;CharCol=0
	ldi	SysValueCopy,0
	sts	CHARCOL,SysValueCopy
	sts	CHARCOL_H,SysValueCopy
;if CharCode>=178 and CharCode<=202 then
	lds	SysBYTETempA,CHARCODE
	ldi	SysBYTETempB,178
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp1,SysByteTempX
	lds	SysBYTETempB,CHARCODE
	ldi	SysBYTETempA,202
	call	SysCompLessThan
	com	SysByteTempX
	mov	SysTemp4,SysByteTempX
	and	SysTemp4,SysTemp1
	mov	SysTemp3,SysTemp4
	sbrs	SysTemp3,0
	rjmp	ENDIF25
;CharLocY=CharLocY-1
	lds	SysTemp1,CHARLOCY
	ldi	SysTemp4,1
	sub	SysTemp1,SysTemp4
	sts	CHARLOCY,SysTemp1
	lds	SysTemp1,CHARLOCY_H
	ldi	SysTemp4,0
	sbc	SysTemp1,SysTemp4
	sts	CHARLOCY_H,SysTemp1
;end if
ENDIF25:
;For CurrCharCol = 1 to 5
	ldi	SysValueCopy,0
	sts	CURRCHARCOL,SysValueCopy
SysForLoop6:
	lds	SysTemp1,CURRCHARCOL
	inc	SysTemp1
	sts	CURRCHARCOL,SysTemp1
;Select Case CurrCharCol
;Case 1: ReadTable GLCDCharCol3, CharCode, CurrCharVal
SysSelect2Case1:
	lds	SysCalcTempA,CURRCHARCOL
	cpi	SysCalcTempA,1
	brne	SysSelect2Case2
	lds	SYSSTRINGA,CHARCODE
	rcall	GLCDCHARCOL3EXTENDED1
	sts	CURRCHARVAL,SysByteTempX
;Case 2: ReadTable GLCDCharCol4, CharCode, CurrCharVal
	rjmp	SysSelectEnd2
SysSelect2Case2:
	lds	SysCalcTempA,CURRCHARCOL
	cpi	SysCalcTempA,2
	brne	SysSelect2Case3
	lds	SYSSTRINGA,CHARCODE
	rcall	GLCDCHARCOL4EXTENDED1
	sts	CURRCHARVAL,SysByteTempX
;Case 3: ReadTable GLCDCharCol5, CharCode, CurrCharVal
	rjmp	SysSelectEnd2
SysSelect2Case3:
	lds	SysCalcTempA,CURRCHARCOL
	cpi	SysCalcTempA,3
	brne	SysSelect2Case4
	lds	SYSSTRINGA,CHARCODE
	rcall	GLCDCHARCOL5EXTENDED1
	sts	CURRCHARVAL,SysByteTempX
;Case 4: ReadTable GLCDCharCol6, CharCode, CurrCharVal
	rjmp	SysSelectEnd2
SysSelect2Case4:
	lds	SysCalcTempA,CURRCHARCOL
	cpi	SysCalcTempA,4
	brne	SysSelect2Case5
	lds	SYSSTRINGA,CHARCODE
	rcall	GLCDCHARCOL6EXTENDED1
	sts	CURRCHARVAL,SysByteTempX
;Case 5: ReadTable GLCDCharCol7, CharCode, CurrCharVal
	rjmp	SysSelectEnd2
SysSelect2Case5:
	lds	SysCalcTempA,CURRCHARCOL
	cpi	SysCalcTempA,5
	brne	SysSelectEnd2
	lds	SYSSTRINGA,CHARCODE
	rcall	GLCDCHARCOL7EXTENDED1
	sts	CURRCHARVAL,SysByteTempX
;End Select
SysSelectEnd2:
;CharRow=0
	ldi	SysValueCopy,0
	sts	CHARROW,SysValueCopy
	sts	CHARROW_H,SysValueCopy
;For CurrCharRow = 1 to 8
	ldi	SysValueCopy,0
	sts	CURRCHARROW,SysValueCopy
SysForLoop7:
	lds	SysTemp1,CURRCHARROW
	inc	SysTemp1
	sts	CURRCHARROW,SysTemp1
;CharColS=0
	ldi	SysValueCopy,0
	sts	CHARCOLS,SysValueCopy
;For Col=1 to GLCDfntDefaultsize
	ldi	SysValueCopy,0
	sts	COL,SysValueCopy
	lds	SysCalcTempA,GLCDFNTDEFAULTSIZE
	cpi	SysCalcTempA,1
	brsh	ENDIF26
	rjmp	SysForLoopEnd8
ENDIF26:
SysForLoop8:
	lds	SysTemp1,COL
	inc	SysTemp1
	sts	COL,SysTemp1
;CharColS +=1
	lds	SysTemp1,CHARCOLS
	inc	SysTemp1
	sts	CHARCOLS,SysTemp1
;CharRowS=0
	ldi	SysValueCopy,0
	sts	CHARROWS,SysValueCopy
;For Row=1 to GLCDfntDefaultsize
	ldi	SysValueCopy,0
	sts	ROW,SysValueCopy
	lds	SysCalcTempA,GLCDFNTDEFAULTSIZE
	cpi	SysCalcTempA,1
	brsh	ENDIF27
	rjmp	SysForLoopEnd9
ENDIF27:
SysForLoop9:
	lds	SysTemp1,ROW
	inc	SysTemp1
	sts	ROW,SysTemp1
;CharRowS +=1
	lds	SysTemp1,CHARROWS
	inc	SysTemp1
	sts	CHARROWS,SysTemp1
;if CurrCharVal.0=1 then
	lds	SysBitTest,CURRCHARVAL
	sbrs	SysBitTest,0
	rjmp	ELSE28_1
;PSet [word]CharLocX + CharCol+ CharColS, [word]CharLocY + CharRow+CharRowS, LineColour
	lds	SysTemp3,CHARLOCX
	lds	SysTemp4,CHARCOL
	add	SysTemp3,SysTemp4
	mov	SysTemp1,SysTemp3
	lds	SysTemp3,CHARLOCX_H
	lds	SysTemp4,CHARCOL_H
	adc	SysTemp3,SysTemp4
	mov	SysTemp1_H,SysTemp3
	lds	SysTemp3,CHARCOLS
	add	SysTemp1,SysTemp3
	sts	GLCDX,SysTemp1
	ldi	SysTemp4,0
	adc	SysTemp1_H,SysTemp4
	sts	GLCDX_H,SysTemp1_H
	lds	SysTemp3,CHARLOCY
	lds	SysTemp4,CHARROW
	add	SysTemp3,SysTemp4
	mov	SysTemp1,SysTemp3
	lds	SysTemp3,CHARLOCY_H
	lds	SysTemp4,CHARROW_H
	adc	SysTemp3,SysTemp4
	mov	SysTemp1_H,SysTemp3
	lds	SysTemp3,CHARROWS
	add	SysTemp1,SysTemp3
	sts	GLCDY,SysTemp1
	ldi	SysTemp4,0
	adc	SysTemp1_H,SysTemp4
	sts	GLCDY_H,SysTemp1_H
	lds	SysValueCopy,LINECOLOUR
	sts	GLCDCOLOUR,SysValueCopy
	lds	SysValueCopy,LINECOLOUR_H
	sts	GLCDCOLOUR_H,SysValueCopy
	rcall	PSET_ILI9341
;Else
	rjmp	ENDIF28
ELSE28_1:
;PSet [word]CharLocX + CharCol+ CharColS, [word]CharLocY + CharRow+CharRowS, GLCDBACKGROUND
	lds	SysTemp3,CHARLOCX
	lds	SysTemp4,CHARCOL
	add	SysTemp3,SysTemp4
	mov	SysTemp1,SysTemp3
	lds	SysTemp3,CHARLOCX_H
	lds	SysTemp4,CHARCOL_H
	adc	SysTemp3,SysTemp4
	mov	SysTemp1_H,SysTemp3
	lds	SysTemp3,CHARCOLS
	add	SysTemp1,SysTemp3
	sts	GLCDX,SysTemp1
	ldi	SysTemp4,0
	adc	SysTemp1_H,SysTemp4
	sts	GLCDX_H,SysTemp1_H
	lds	SysTemp3,CHARLOCY
	lds	SysTemp4,CHARROW
	add	SysTemp3,SysTemp4
	mov	SysTemp1,SysTemp3
	lds	SysTemp3,CHARLOCY_H
	lds	SysTemp4,CHARROW_H
	adc	SysTemp3,SysTemp4
	mov	SysTemp1_H,SysTemp3
	lds	SysTemp3,CHARROWS
	add	SysTemp1,SysTemp3
	sts	GLCDY,SysTemp1
	ldi	SysTemp4,0
	adc	SysTemp1_H,SysTemp4
	sts	GLCDY_H,SysTemp1_H
	lds	SysValueCopy,GLCDBACKGROUND
	sts	GLCDCOLOUR,SysValueCopy
	lds	SysValueCopy,GLCDBACKGROUND_H
	sts	GLCDCOLOUR_H,SysValueCopy
	rcall	PSET_ILI9341
;End if
ENDIF28:
;Next Row
	lds	SysCalcTempA,ROW
	lds	SysCalcTempB,GLCDFNTDEFAULTSIZE
	cp	SysCalcTempA,SysCalcTempB
	brsh	ENDIF29
	rjmp	SysForLoop9
ENDIF29:
SysForLoopEnd9:
;Next Col
	lds	SysCalcTempA,COL
	lds	SysCalcTempB,GLCDFNTDEFAULTSIZE
	cp	SysCalcTempA,SysCalcTempB
	brsh	ENDIF30
	rjmp	SysForLoop8
ENDIF30:
SysForLoopEnd8:
;Rotate CurrCharVal Right
	lds	SysValueCopy,CURRCHARVAL
	ror	SysValueCopy
	sts	CURRCHARVAL,SysValueCopy
;CharRow +=GLCDfntDefaultsize
	lds	SysTemp1,CHARROW
	lds	SysTemp3,GLCDFNTDEFAULTSIZE
	add	SysTemp1,SysTemp3
	sts	CHARROW,SysTemp1
	lds	SysTemp1,CHARROW_H
	ldi	SysTemp4,0
	adc	SysTemp1,SysTemp4
	sts	CHARROW_H,SysTemp1
;Next
	lds	SysCalcTempA,CURRCHARROW
	cpi	SysCalcTempA,8
	brsh	ENDIF31
	rjmp	SysForLoop7
ENDIF31:
SysForLoopEnd7:
;CharCol +=GLCDfntDefaultsize
	lds	SysTemp1,CHARCOL
	lds	SysTemp3,GLCDFNTDEFAULTSIZE
	add	SysTemp1,SysTemp3
	sts	CHARCOL,SysTemp1
	lds	SysTemp1,CHARCOL_H
	ldi	SysTemp4,0
	adc	SysTemp1,SysTemp4
	sts	CHARCOL_H,SysTemp1
;Next
	lds	SysCalcTempA,CURRCHARCOL
	cpi	SysCalcTempA,5
	brsh	ENDIF32
	rjmp	SysForLoop6
ENDIF32:
SysForLoopEnd6:
	ret

;********************************************************************************

GLCDDRAWSTRING_ILI9341:
;dim GLCDPrintLoc as word
;GLCDPrintLoc = StringLocX
	lds	SysValueCopy,STRINGLOCX
	sts	GLCDPRINTLOC,SysValueCopy
	lds	SysValueCopy,STRINGLOCX_H
	sts	GLCDPRINTLOC_H,SysValueCopy
;for xchar = 1 to Chars(0)
	ldi	SysValueCopy,0
	sts	XCHAR,SysValueCopy
	lds	SysStringA,SysCHARSHandler
	lds	SysStringA_H,SysCHARSHandler_H
	ld	SysCalcTempA,X
	cpi	SysCalcTempA,1
	brsh	ENDIF23
	rjmp	SysForLoopEnd5
ENDIF23:
SysForLoop5:
	lds	SysTemp1,XCHAR
	inc	SysTemp1
	sts	XCHAR,SysTemp1
;GLCDDrawChar GLCDPrintLoc , CharLocY , Chars(xchar), LineColour
	lds	SysValueCopy,GLCDPRINTLOC
	sts	CHARLOCX,SysValueCopy
	lds	SysValueCopy,GLCDPRINTLOC_H
	sts	CHARLOCX_H,SysValueCopy
	lds	SysTemp1,SysCHARSHandler
	lds	SysTemp3,XCHAR
	add	SysTemp1,SysTemp3
	mov	SysStringA,SysTemp1
	lds	SysTemp1,SysCHARSHandler_H
	ldi	SysTemp4,0
	adc	SysTemp1,SysTemp4
	mov	SysStringA_H,SysTemp1
	ld	SysValueCopy,X
	sts	CHARCODE,SysValueCopy
	rcall	GLCDDRAWCHAR_ILI9341
;GLCDPrintIncrementPixelPositionMacro
;GLCDPrintLoc = GLCDPrintLoc + ( GLCDFontWidth * GLCDfntDefaultsize )+1
	lds	SysBYTETempA,GLCDFONTWIDTH
	lds	SysBYTETempB,GLCDFNTDEFAULTSIZE
	mul	SysByteTempA,SysByteTempB
	mov	SysTemp1,SysByteTempX
	lds	SysTemp4,GLCDPRINTLOC
	add	SysTemp4,SysTemp1
	mov	SysTemp3,SysTemp4
	lds	SysTemp1,GLCDPRINTLOC_H
	ldi	SysTemp4,0
	adc	SysTemp1,SysTemp4
	mov	SysTemp3_H,SysTemp1
	ldi	SysTemp4,1
	add	SysTemp3,SysTemp4
	sts	GLCDPRINTLOC,SysTemp3
	ldi	SysTemp4,0
	adc	SysTemp3_H,SysTemp4
	sts	GLCDPRINTLOC_H,SysTemp3_H
;next
	lds	SysStringA,SysCHARSHandler
	lds	SysStringA_H,SysCHARSHandler_H
	lds	SysCalcTempA,XCHAR
	ld	SysCalcTempB,X
	cp	SysCalcTempA,SysCalcTempB
	brlo	SysForLoop5
SysForLoopEnd5:
	ret

;********************************************************************************

;Overloaded signature: WORD:WORD:STRING:
GLCDPRINT5:
;GLCD.h Sub GLCDPrint
;Dim GLCDPrintLoc  as word
;Dim GLCDPrint_String_Counter, GLCDPrintLen as byte
;GLCDPrintLen = LCDPrintData(0)
	lds	SysStringA,SysLCDPRINTDATAHandler
	lds	SysStringA_H,SysLCDPRINTDATAHandler_H
	ld	SysValueCopy,X
	sts	GLCDPRINTLEN,SysValueCopy
;If GLCDPrintLen = 0 Then Exit Sub
	lds	SysCalcTempA,GLCDPRINTLEN
	tst	SysCalcTempA
	brne	ENDIF5
	ret
ENDIF5:
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
	brsh	ENDIF6
	rjmp	SysForLoopEnd1
ENDIF6:
SysForLoop1:
	lds	SysTemp1,GLCDPRINT_STRING_COUNTER
	inc	SysTemp1
	sts	GLCDPRINT_STRING_COUNTER,SysTemp1
;GLCDDrawChar  GLCDPrintLoc, PrintLocY, LCDPrintData(GLCDPrint_String_Counter)
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
	ldi	SysTemp2,0
	adc	SysTemp1,SysTemp2
	mov	SysStringA_H,SysTemp1
	ld	SysValueCopy,X
	sts	CHARCODE,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND
	sts	LINECOLOUR,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND_H
	sts	LINECOLOUR_H,SysValueCopy
	rcall	GLCDDRAWCHAR_ILI9341
;GLCDPrintIncrementPixelPositionMacro
;GLCDPrintLoc = GLCDPrintLoc + ( GLCDFontWidth * GLCDfntDefaultsize )+1
	lds	SysBYTETempA,GLCDFONTWIDTH
	lds	SysBYTETempB,GLCDFNTDEFAULTSIZE
	mul	SysByteTempA,SysByteTempB
	mov	SysTemp1,SysByteTempX
	lds	SysTemp3,GLCDPRINTLOC
	add	SysTemp3,SysTemp1
	mov	SysTemp2,SysTemp3
	lds	SysTemp3,GLCDPRINTLOC_H
	ldi	SysTemp4,0
	adc	SysTemp3,SysTemp4
	mov	SysTemp2_H,SysTemp3
	ldi	SysTemp4,1
	add	SysTemp2,SysTemp4
	sts	GLCDPRINTLOC,SysTemp2
	ldi	SysTemp4,0
	adc	SysTemp2_H,SysTemp4
	sts	GLCDPRINTLOC_H,SysTemp2_H
;Next
	lds	SysCalcTempA,GLCDPRINT_STRING_COUNTER
	lds	SysCalcTempB,GLCDPRINTLEN
	cp	SysCalcTempA,SysCalcTempB
	brsh	ENDIF7
	rjmp	SysForLoop1
ENDIF7:
SysForLoopEnd1:
	ret

;********************************************************************************

;Overloaded signature: WORD:WORD:LONG:
GLCDPRINT7:
;Dim SysCalcTempA As Long
;Dim GLCDPrintLoc as word
;Dim SysPrintBuffer(10)
;SysPrintBuffLen = 0
	ldi	SysValueCopy,0
	sts	SYSPRINTBUFFLEN,SysValueCopy
;Do
SysDoLoop_S3:
;Divide number by 10, remainder into buffer
;SysPrintBuffLen += 1
	lds	SysTemp3,SYSPRINTBUFFLEN
	inc	SysTemp3
	sts	SYSPRINTBUFFLEN,SysTemp3
;SysPrintBuffer(SysPrintBuffLen) = LCDValue % 10
	ldi	SysTemp4,low(SYSPRINTBUFFER)
	add	SysTemp3,SysTemp4
	mov	SysStringA,SysTemp3
	ldi	SysTemp4,0
	ldi	SysTemp2,high(SYSPRINTBUFFER)
	adc	SysTemp4,SysTemp2
	mov	SysStringA_H,SysTemp4
	lds	SysLONGTempA,LCDVALUE
	lds	SysLONGTempA_H,LCDVALUE_H
	lds	SysLONGTempA_U,LCDVALUE_U
	lds	SysLONGTempA_E,LCDVALUE_E
	ldi	SysLONGTempB,10
	ldi	SysLONGTempB_H,0
	ldi	SysLONGTempB_U,0
	ldi	SysLONGTempB_E,0
	call	SysDivSub32
	st	X,SysLONGTempX
;LCDValue = SysCalcTempA
	sts	LCDVALUE,SYSCALCTEMPA
	sts	LCDVALUE_H,SYSCALCTEMPA_H
	sts	LCDVALUE_U,SYSCALCTEMPA_U
	sts	LCDVALUE_E,SYSCALCTEMPA_E
;Loop While LCDValue <> 0
	lds	SysLONGTempA,lcdvalue
	lds	SysLONGTempA_H,lcdvalue_H
	lds	SysLONGTempA_U,lcdvalue_U
	lds	SysLONGTempA_E,lcdvalue_E
	ldi	SysLONGTempB,0
	ldi	SysLONGTempB_H,0
	ldi	SysLONGTempB_U,0
	ldi	SysLONGTempB_E,0
	call	SysCompEqual32
	com	SysByteTempX
	sbrc	SysByteTempX,0
	rjmp	SysDoLoop_S3
SysDoLoop_E3:
;Display
;GLCDPrintLoc = PrintLocX
	lds	SysValueCopy,PRINTLOCX
	sts	GLCDPRINTLOC,SysValueCopy
	lds	SysValueCopy,PRINTLOCX_H
	sts	GLCDPRINTLOC_H,SysValueCopy
;For GLCDPrint_String_Counter = SysPrintBuffLen To 1 Step -1
	lds	SysTemp3,SYSPRINTBUFFLEN
	inc	SysTemp3
	sts	GLCDPRINT_STRING_COUNTER,SysTemp3
	lds	SysCalcTempA,SYSPRINTBUFFLEN
	ldi	SysCalcTempA_H,0
	ldi	SysCalcTempA_U,0
	ldi	SysCalcTempA_E,0
	cpi	SysCalcTempA,1
	brsh	ENDIF8
	rjmp	SysForLoopEnd2
ENDIF8:
SysForLoop2:
	lds	SysTemp3,GLCDPRINT_STRING_COUNTER
	dec	SysTemp3
	sts	GLCDPRINT_STRING_COUNTER,SysTemp3
;GLCDDrawChar GLCDPrintLoc, PrintLocY, SysPrintBuffer(GLCDPrint_String_Counter) + 48
	lds	SysValueCopy,GLCDPRINTLOC
	sts	CHARLOCX,SysValueCopy
	lds	SysValueCopy,GLCDPRINTLOC_H
	sts	CHARLOCX_H,SysValueCopy
	lds	SysValueCopy,PRINTLOCY
	sts	CHARLOCY,SysValueCopy
	lds	SysValueCopy,PRINTLOCY_H
	sts	CHARLOCY_H,SysValueCopy
	lds	SysTemp3,GLCDPRINT_STRING_COUNTER
	ldi	SysTemp4,low(SYSPRINTBUFFER)
	add	SysTemp3,SysTemp4
	mov	SysStringA,SysTemp3
	ldi	SysTemp4,0
	ldi	SysTemp2,high(SYSPRINTBUFFER)
	adc	SysTemp4,SysTemp2
	mov	SysStringA_H,SysTemp4
	ld	SysTemp3,X
	ldi	SysTemp4,48
	add	SysTemp3,SysTemp4
	sts	CHARCODE,SysTemp3
	lds	SysValueCopy,GLCDFOREGROUND
	sts	LINECOLOUR,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND_H
	sts	LINECOLOUR_H,SysValueCopy
	rcall	GLCDDRAWCHAR_ILI9341
;GLCDPrintIncrementPixelPositionMacro
;GLCDPrintLoc = GLCDPrintLoc + ( GLCDFontWidth * GLCDfntDefaultsize )+1
	lds	SysBYTETempA,GLCDFONTWIDTH
	lds	SysBYTETempB,GLCDFNTDEFAULTSIZE
	mul	SysByteTempA,SysByteTempB
	mov	SysTemp3,SysByteTempX
	lds	SysTemp4,GLCDPRINTLOC
	add	SysTemp4,SysTemp3
	mov	SysTemp1,SysTemp4
	lds	SysTemp3,GLCDPRINTLOC_H
	ldi	SysTemp4,0
	adc	SysTemp3,SysTemp4
	mov	SysTemp1_H,SysTemp3
	ldi	SysTemp4,1
	add	SysTemp1,SysTemp4
	sts	GLCDPRINTLOC,SysTemp1
	ldi	SysTemp4,0
	adc	SysTemp1_H,SysTemp4
	sts	GLCDPRINTLOC_H,SysTemp1_H
;Next
	ldi	SysCalcTempA,1
	ldi	SysCalcTempA_H,0
	ldi	SysCalcTempA_U,0
	ldi	SysCalcTempA_E,0
	lds	SysCalcTempB,GLCDPRINT_STRING_COUNTER
	cp	SysCalcTempA,SysCalcTempB
	brsh	ENDIF9
	rjmp	SysForLoop2
ENDIF9:
SysForLoopEnd2:
	ret

;********************************************************************************

GLCDROTATE_ILI9341:
;#define ILI9341_MADCTL_MY  0x80
;#define ILI9341_MADCTL_MX  0x40
;#define ILI9341_MADCTL_MV  0x20
;#define ILI9341_MADCTL_ML  0x10
;#define ILI9341_MADCTL_RGB 0x00
;#define ILI9341_MADCTL_BGR 0x08
;#define ILI9341_MADCTL_MH  0x04
;SendCommand_ILI9341 ( ILI9341_MADCTL )
	ldi	SysValueCopy,54
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDCOMMAND_ILI9341
;select case GLCDRotateState
;case PORTRAIT
SysSelect3Case1:
	lds	SysCalcTempA,GLCDROTATESTATE
	cpi	SysCalcTempA,4
	brne	SysSelect3Case2
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
;SendData_ILI9341( ILI9341_MADCTL_MX | ILI9341_MADCTL_BGR)
	ldi	SysValueCopy,72
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;case LANDSCAPE
	rjmp	SysSelectEnd3
SysSelect3Case2:
	lds	SysCalcTempA,GLCDROTATESTATE
	cpi	SysCalcTempA,1
	brne	SysSelect3Case3
;ILI9341_GLCD_WIDTH = GLCD_HEIGHT
	ldi	SysValueCopy,64
	sts	GLCDDEVICEWIDTH,SysValueCopy
	ldi	SysValueCopy,1
	sts	GLCDDEVICEWIDTH_H,SysValueCopy
;ILI9341_GLCD_HEIGHT = GLCD_WIDTH
	ldi	SysValueCopy,240
	sts	GLCDDEVICEHEIGHT,SysValueCopy
	ldi	SysValueCopy,0
	sts	GLCDDEVICEHEIGHT_H,SysValueCopy
;SendData_ILI9341( ILI9341_MADCTL_MV | ILI9341_MADCTL_BGR )
	ldi	SysValueCopy,40
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;case PORTRAIT_REV
	rjmp	SysSelectEnd3
SysSelect3Case3:
	lds	SysCalcTempA,GLCDROTATESTATE
	cpi	SysCalcTempA,2
	brne	SysSelect3Case4
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
;SendData_ILI9341( ILI9341_MADCTL_MY | ILI9341_MADCTL_BGR)
	ldi	SysValueCopy,136
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;case LANDSCAPE_REV
	rjmp	SysSelectEnd3
SysSelect3Case4:
	lds	SysCalcTempA,GLCDROTATESTATE
	cpi	SysCalcTempA,3
	brne	SysSelect3Case5
;ILI9341_GLCD_WIDTH = GLCD_HEIGHT
	ldi	SysValueCopy,64
	sts	GLCDDEVICEWIDTH,SysValueCopy
	ldi	SysValueCopy,1
	sts	GLCDDEVICEWIDTH_H,SysValueCopy
;ILI9341_GLCD_HEIGHT = GLCD_WIDTH
	ldi	SysValueCopy,240
	sts	GLCDDEVICEHEIGHT,SysValueCopy
	ldi	SysValueCopy,0
	sts	GLCDDEVICEHEIGHT_H,SysValueCopy
;SendData_ILI9341(  ILI9341_MADCTL_MV | ILI9341_MADCTL_MY | ILI9341_MADCTL_MX | ILI9341_MADCTL_BGR )
	ldi	SysValueCopy,232
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;case else
	rjmp	SysSelectEnd3
SysSelect3Case5:
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
;SendData_ILI9341( ILI9341_MADCTL_MX | ILI9341_MADCTL_BGR )
	ldi	SysValueCopy,72
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDDATA_ILI9341
;end select
SysSelectEnd3:
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
	call	Delay_MS
;Set ILI9341_RST On
	sbi	PORTC,4
;Wait 15 ms
	ldi	SysWaitTempMS,15
	ldi	SysWaitTempMS_H,0
	call	Delay_MS
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
	call	Delay_MS
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
	call	Delay_MS
;SendCommand_ILI9341(ILI9341_DISPON)    'Display on
	ldi	SysValueCopy,41
	sts	ILI9341SENDBYTE,SysValueCopy
	rcall	SENDCOMMAND_ILI9341
;Default Colours
;GLCDBACKGROUND = ILI9341_BLACK
	ldi	SysValueCopy,0
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
;GLCDFontWidth = 6
	ldi	SysValueCopy,6
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

LINE:
;dim LineStepX as integer
;dim LineStepY as integer
;dim LineDiffX, LineDiffY as integer
;dim LineDiffX_x2, LineDiffY_x2 as integer
;dim LineErr as integer
;LineDiffX = 0
	ldi	SysValueCopy,0
	sts	LINEDIFFX,SysValueCopy
	sts	LINEDIFFX_H,SysValueCopy
;LineDiffY = 0
	ldi	SysValueCopy,0
	sts	LINEDIFFY,SysValueCopy
	sts	LINEDIFFY_H,SysValueCopy
;LineStepX = 0
	ldi	SysValueCopy,0
	sts	LINESTEPX,SysValueCopy
	sts	LINESTEPX_H,SysValueCopy
;LineStepY = 0
	ldi	SysValueCopy,0
	sts	LINESTEPY,SysValueCopy
	sts	LINESTEPY_H,SysValueCopy
;LineDiffX_x2 = 0
	ldi	SysValueCopy,0
	sts	LINEDIFFX_X2,SysValueCopy
	sts	LINEDIFFX_X2_H,SysValueCopy
;LineDiffY_x2 = 0
	ldi	SysValueCopy,0
	sts	LINEDIFFY_X2,SysValueCopy
	sts	LINEDIFFY_X2_H,SysValueCopy
;LineErr = 0
	ldi	SysValueCopy,0
	sts	LINEERR,SysValueCopy
	sts	LINEERR_H,SysValueCopy
;LineDiffX =  LineX2 -   LineX1
	lds	SysTemp1,LINEX2
	lds	SysTemp3,LINEX1
	sub	SysTemp1,SysTemp3
	sts	LINEDIFFX,SysTemp1
	lds	SysTemp1,LINEX2_H
	lds	SysTemp3,LINEX1_H
	sbc	SysTemp1,SysTemp3
	sts	LINEDIFFX_H,SysTemp1
;LineDiffY =  LineY2 -   LineY1
	lds	SysTemp1,LINEY2
	lds	SysTemp3,LINEY1
	sub	SysTemp1,SysTemp3
	sts	LINEDIFFY,SysTemp1
	lds	SysTemp1,LINEY2_H
	lds	SysTemp3,LINEY1_H
	sbc	SysTemp1,SysTemp3
	sts	LINEDIFFY_H,SysTemp1
;if (LineDiffX > 0) then
	lds	SysINTEGERTempB,LINEDIFFX
	lds	SysINTEGERTempB_H,LINEDIFFX_H
	ldi	SysINTEGERTempA,0
	ldi	SysINTEGERTempA_H,0
	call	SysCompLessThanINT
	sbrs	SysByteTempX,0
	rjmp	ELSE18_1
;LineStepX = 1
	ldi	SysValueCopy,1
	sts	LINESTEPX,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINESTEPX_H,SysValueCopy
;else
	rjmp	ENDIF18
ELSE18_1:
;LineStepX = -1
	ldi	SysValueCopy,255
	sts	LINESTEPX,SysValueCopy
	sts	LINESTEPX_H,SysValueCopy
;end if
ENDIF18:
;if (LineDiffY > 0) then
	lds	SysINTEGERTempB,LINEDIFFY
	lds	SysINTEGERTempB_H,LINEDIFFY_H
	ldi	SysINTEGERTempA,0
	ldi	SysINTEGERTempA_H,0
	call	SysCompLessThanINT
	sbrs	SysByteTempX,0
	rjmp	ELSE19_1
;LineStepY = 1
	ldi	SysValueCopy,1
	sts	LINESTEPY,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINESTEPY_H,SysValueCopy
;else
	rjmp	ENDIF19
ELSE19_1:
;LineStepY = -1
	ldi	SysValueCopy,255
	sts	LINESTEPY,SysValueCopy
	sts	LINESTEPY_H,SysValueCopy
;end if
ENDIF19:
;LineDiffX = LineStepX * LineDiffX
	lds	SysINTEGERTempA,LINESTEPX
	lds	SysINTEGERTempA_H,LINESTEPX_H
	lds	SysINTEGERTempB,LINEDIFFX
	lds	SysINTEGERTempB_H,LINEDIFFX_H
	call	SysMultSubINT
	sts	LINEDIFFX,SysINTEGERTempX
	sts	LINEDIFFX_H,SysINTEGERTempX_H
;LineDiffY = LineStepY * LineDiffY
	lds	SysINTEGERTempA,LINESTEPY
	lds	SysINTEGERTempA_H,LINESTEPY_H
	lds	SysINTEGERTempB,LINEDIFFY
	lds	SysINTEGERTempB_H,LINEDIFFY_H
	call	SysMultSubINT
	sts	LINEDIFFY,SysINTEGERTempX
	sts	LINEDIFFY_H,SysINTEGERTempX_H
;LineDiffX_x2 = LineDiffX*2
	lds	SysINTEGERTempA,LINEDIFFX
	lds	SysINTEGERTempA_H,LINEDIFFX_H
	ldi	SysINTEGERTempB,2
	ldi	SysINTEGERTempB_H,0
	call	SysMultSubINT
	sts	LINEDIFFX_X2,SysINTEGERTempX
	sts	LINEDIFFX_X2_H,SysINTEGERTempX_H
;LineDiffY_x2 = LineDiffY*2
	lds	SysINTEGERTempA,LINEDIFFY
	lds	SysINTEGERTempA_H,LINEDIFFY_H
	ldi	SysINTEGERTempB,2
	ldi	SysINTEGERTempB_H,0
	call	SysMultSubINT
	sts	LINEDIFFY_X2,SysINTEGERTempX
	sts	LINEDIFFY_X2_H,SysINTEGERTempX_H
;if ( LineDiffX >= LineDiffY) then
	lds	SysINTEGERTempA,LINEDIFFX
	lds	SysINTEGERTempA_H,LINEDIFFX_H
	lds	SysINTEGERTempB,LINEDIFFY
	lds	SysINTEGERTempB_H,LINEDIFFY_H
	call	SysCompLessThanINT
	com	SysByteTempX
	sbrs	SysByteTempX,0
	rjmp	ELSE20_1
;LineErr = LineDiffY_x2 - LineDiffX
	lds	SysTemp1,LINEDIFFY_X2
	lds	SysTemp3,LINEDIFFX
	sub	SysTemp1,SysTemp3
	sts	LINEERR,SysTemp1
	lds	SysTemp1,LINEDIFFY_X2_H
	lds	SysTemp3,LINEDIFFX_H
	sbc	SysTemp1,SysTemp3
	sts	LINEERR_H,SysTemp1
;do while (   LineX1 <>  LineX2 )
SysDoLoop_S6:
	lds	SysWORDTempA,linex1
	lds	SysWORDTempA_H,linex1_H
	lds	SysWORDTempB,linex2
	lds	SysWORDTempB_H,linex2_H
	call	SysCompEqual16
	com	SysByteTempX
	sbrs	SysByteTempX,0
	rjmp	SysDoLoop_E6
;PSet (   LineX1,   LineY1, LineColour )
	lds	SysValueCopy,LINEX1
	sts	GLCDX,SysValueCopy
	lds	SysValueCopy,LINEX1_H
	sts	GLCDX_H,SysValueCopy
	lds	SysValueCopy,LINEY1
	sts	GLCDY,SysValueCopy
	lds	SysValueCopy,LINEY1_H
	sts	GLCDY_H,SysValueCopy
	lds	SysValueCopy,LINECOLOUR
	sts	GLCDCOLOUR,SysValueCopy
	lds	SysValueCopy,LINECOLOUR_H
	sts	GLCDCOLOUR_H,SysValueCopy
	rcall	PSET_ILI9341
;LineX1 += LineStepX
	lds	SysTemp1,LINEX1
	lds	SysTemp3,LINESTEPX
	add	SysTemp1,SysTemp3
	sts	LINEX1,SysTemp1
	lds	SysTemp1,LINEX1_H
	lds	SysTemp3,LINESTEPX_H
	adc	SysTemp1,SysTemp3
	sts	LINEX1_H,SysTemp1
;if ( LineErr < 0) then
	lds	SysINTEGERTempA,LINEERR
	lds	SysINTEGERTempA_H,LINEERR_H
	ldi	SysINTEGERTempB,0
	ldi	SysINTEGERTempB_H,0
	call	SysCompLessThanINT
	sbrs	SysByteTempX,0
	rjmp	ELSE21_1
;LineErr += LineDiffY_x2
	lds	SysTemp1,LINEERR
	lds	SysTemp3,LINEDIFFY_X2
	add	SysTemp1,SysTemp3
	sts	LINEERR,SysTemp1
	lds	SysTemp1,LINEERR_H
	lds	SysTemp3,LINEDIFFY_X2_H
	adc	SysTemp1,SysTemp3
	sts	LINEERR_H,SysTemp1
;else
	rjmp	ENDIF21
ELSE21_1:
;LineErr += ( LineDiffY_x2 - LineDiffX_x2 )
	lds	SysTemp1,LINEDIFFY_X2
	lds	SysTemp4,LINEDIFFX_X2
	sub	SysTemp1,SysTemp4
	mov	SysTemp3,SysTemp1
	lds	SysTemp1,LINEDIFFY_X2_H
	lds	SysTemp4,LINEDIFFX_X2_H
	sbc	SysTemp1,SysTemp4
	mov	SysTemp3_H,SysTemp1
	lds	SysTemp1,LINEERR
	add	SysTemp1,SysTemp3
	sts	LINEERR,SysTemp1
	lds	SysTemp1,LINEERR_H
	adc	SysTemp1,SysTemp3_H
	sts	LINEERR_H,SysTemp1
;LineY1 += LineStepY
	lds	SysTemp1,LINEY1
	lds	SysTemp3,LINESTEPY
	add	SysTemp1,SysTemp3
	sts	LINEY1,SysTemp1
	lds	SysTemp1,LINEY1_H
	lds	SysTemp3,LINESTEPY_H
	adc	SysTemp1,SysTemp3
	sts	LINEY1_H,SysTemp1
;end if
ENDIF21:
;loop
	rjmp	SysDoLoop_S6
SysDoLoop_E6:
;PSet (   LineX1,   LineY1, LineColour )
	lds	SysValueCopy,LINEX1
	sts	GLCDX,SysValueCopy
	lds	SysValueCopy,LINEX1_H
	sts	GLCDX_H,SysValueCopy
	lds	SysValueCopy,LINEY1
	sts	GLCDY,SysValueCopy
	lds	SysValueCopy,LINEY1_H
	sts	GLCDY_H,SysValueCopy
	lds	SysValueCopy,LINECOLOUR
	sts	GLCDCOLOUR,SysValueCopy
	lds	SysValueCopy,LINECOLOUR_H
	sts	GLCDCOLOUR_H,SysValueCopy
	rcall	PSET_ILI9341
;else
	rjmp	ENDIF20
ELSE20_1:
;LineErr = LineDiffX_x2 - LineDiffY
	lds	SysTemp1,LINEDIFFX_X2
	lds	SysTemp3,LINEDIFFY
	sub	SysTemp1,SysTemp3
	sts	LINEERR,SysTemp1
	lds	SysTemp1,LINEDIFFX_X2_H
	lds	SysTemp3,LINEDIFFY_H
	sbc	SysTemp1,SysTemp3
	sts	LINEERR_H,SysTemp1
;do while (   LineY1 <>  LineY2)
SysDoLoop_S7:
	lds	SysWORDTempA,liney1
	lds	SysWORDTempA_H,liney1_H
	lds	SysWORDTempB,liney2
	lds	SysWORDTempB_H,liney2_H
	call	SysCompEqual16
	com	SysByteTempX
	sbrs	SysByteTempX,0
	rjmp	SysDoLoop_E7
;PSet (   LineX1,   LineY1, LineColour )
	lds	SysValueCopy,LINEX1
	sts	GLCDX,SysValueCopy
	lds	SysValueCopy,LINEX1_H
	sts	GLCDX_H,SysValueCopy
	lds	SysValueCopy,LINEY1
	sts	GLCDY,SysValueCopy
	lds	SysValueCopy,LINEY1_H
	sts	GLCDY_H,SysValueCopy
	lds	SysValueCopy,LINECOLOUR
	sts	GLCDCOLOUR,SysValueCopy
	lds	SysValueCopy,LINECOLOUR_H
	sts	GLCDCOLOUR_H,SysValueCopy
	rcall	PSET_ILI9341
;LineY1 += LineStepY
	lds	SysTemp1,LINEY1
	lds	SysTemp3,LINESTEPY
	add	SysTemp1,SysTemp3
	sts	LINEY1,SysTemp1
	lds	SysTemp1,LINEY1_H
	lds	SysTemp3,LINESTEPY_H
	adc	SysTemp1,SysTemp3
	sts	LINEY1_H,SysTemp1
;if ( LineErr < 0) then
	lds	SysINTEGERTempA,LINEERR
	lds	SysINTEGERTempA_H,LINEERR_H
	ldi	SysINTEGERTempB,0
	ldi	SysINTEGERTempB_H,0
	call	SysCompLessThanINT
	sbrs	SysByteTempX,0
	rjmp	ELSE22_1
;LineErr += LineDiffX_x2
	lds	SysTemp1,LINEERR
	lds	SysTemp3,LINEDIFFX_X2
	add	SysTemp1,SysTemp3
	sts	LINEERR,SysTemp1
	lds	SysTemp1,LINEERR_H
	lds	SysTemp3,LINEDIFFX_X2_H
	adc	SysTemp1,SysTemp3
	sts	LINEERR_H,SysTemp1
;else
	rjmp	ENDIF22
ELSE22_1:
;LineErr += ( LineDiffX_x2 - LineDiffY_x2 )
	lds	SysTemp1,LINEDIFFX_X2
	lds	SysTemp4,LINEDIFFY_X2
	sub	SysTemp1,SysTemp4
	mov	SysTemp3,SysTemp1
	lds	SysTemp1,LINEDIFFX_X2_H
	lds	SysTemp4,LINEDIFFY_X2_H
	sbc	SysTemp1,SysTemp4
	mov	SysTemp3_H,SysTemp1
	lds	SysTemp1,LINEERR
	add	SysTemp1,SysTemp3
	sts	LINEERR,SysTemp1
	lds	SysTemp1,LINEERR_H
	adc	SysTemp1,SysTemp3_H
	sts	LINEERR_H,SysTemp1
;LineX1 += LineStepX
	lds	SysTemp1,LINEX1
	lds	SysTemp3,LINESTEPX
	add	SysTemp1,SysTemp3
	sts	LINEX1,SysTemp1
	lds	SysTemp1,LINEX1_H
	lds	SysTemp3,LINESTEPX_H
	adc	SysTemp1,SysTemp3
	sts	LINEX1_H,SysTemp1
;end if
ENDIF22:
;loop
	rjmp	SysDoLoop_S7
SysDoLoop_E7:
;PSet (   LineX1,   LineY1, LineColour )
	lds	SysValueCopy,LINEX1
	sts	GLCDX,SysValueCopy
	lds	SysValueCopy,LINEX1_H
	sts	GLCDX_H,SysValueCopy
	lds	SysValueCopy,LINEY1
	sts	GLCDY,SysValueCopy
	lds	SysValueCopy,LINEY1_H
	sts	GLCDY_H,SysValueCopy
	lds	SysValueCopy,LINECOLOUR
	sts	GLCDCOLOUR,SysValueCopy
	lds	SysValueCopy,LINECOLOUR_H
	sts	GLCDCOLOUR_H,SysValueCopy
	rcall	PSET_ILI9341
;end if
ENDIF20:
	ret

;********************************************************************************

FN_PAD:
;Check length of SysInString
;If SysInString(0) = longer or equal SysStrLen then
;give back SysInString and exit function
;If SysInString(0) < SysStrLen Then
	lds	SysStringA,SysSYSINSTRINGHandler
	lds	SysStringA_H,SysSYSINSTRINGHandler_H
	ld	SysCalcTempA,X
	lds	SysCalcTempB,SYSSTRLEN
	cp	SysCalcTempA,SysCalcTempB
	brlo	PC + 2
	rjmp	ELSE77_1
;SysCharCount = SysInString(0)
	lds	SysStringA,SysSYSINSTRINGHandler
	lds	SysStringA_H,SysSYSINSTRINGHandler_H
	ld	SysValueCopy,X
	sts	SYSCHARCOUNT,SysValueCopy
;clear output string
;Pad=""
	ldi	SysStringB,low(PAD)
	ldi	SysStringB_H,high(PAD)
	ldi	SysReadA,low(StringTable81<<1)
	ldi	SysReadA_H,high(StringTable81<<1)
	call	SysReadString
;Copy leftmost characters
;For SysStringTemp = 1 To SysCharCount
	ldi	SysValueCopy,0
	sts	SYSSTRINGTEMP,SysValueCopy
	lds	SysCalcTempA,SYSCHARCOUNT
	cpi	SysCalcTempA,1
	brlo	SysForLoopEnd13
SysForLoop13:
	lds	SysTemp1,SYSSTRINGTEMP
	inc	SysTemp1
	sts	SYSSTRINGTEMP,SysTemp1
;Pad(SysStringTemp) = SysInString(SysStringTemp)
	lds	SysTemp1,SysSYSINSTRINGHandler
	lds	SysTemp3,SYSSTRINGTEMP
	add	SysTemp1,SysTemp3
	mov	SysStringA,SysTemp1
	lds	SysTemp1,SysSYSINSTRINGHandler_H
	ldi	SysTemp4,0
	adc	SysTemp1,SysTemp4
	mov	SysStringA_H,SysTemp1
	ld	SysValueCopy,X+
	sts	SysArrayTemp1,SysValueCopy
	sts	SysArrayTemp2,SysValueCopy
	lds	SysTemp1,SYSSTRINGTEMP
	ldi	SysTemp4,low(PAD)
	add	SysTemp1,SysTemp4
	mov	SysStringA,SysTemp1
	ldi	SysTemp4,0
	ldi	SysTemp2,high(PAD)
	adc	SysTemp4,SysTemp2
	mov	SysStringA_H,SysTemp4
	lds	SysValueCopy,SysArrayTemp2
	st	X+,SysValueCopy
;Next
	lds	SysCalcTempA,SYSSTRINGTEMP
	lds	SysCalcTempB,SYSCHARCOUNT
	cp	SysCalcTempA,SysCalcTempB
	brlo	SysForLoop13
SysForLoopEnd13:
;For SysStringTemp = SysCharCount+1 to SysStrLen
	lds	SysTemp3,SYSCHARCOUNT
	inc	SysTemp3
	dec	SysTemp3
	sts	SYSSTRINGTEMP,SysTemp3
	lds	SysTemp3,SYSCHARCOUNT
	inc	SysTemp3
	mov	SysBYTETempB,SysTemp3
	lds	SysBYTETempA,SYSSTRLEN
	call	SysCompLessThan
	sbrc	SysByteTempX,0
	rjmp	SysForLoopEnd14
ENDIF80:
SysForLoop14:
	lds	SysTemp1,SYSSTRINGTEMP
	inc	SysTemp1
	sts	SYSSTRINGTEMP,SysTemp1
;Pad(SysStringTemp) = SysInString3(1)
	lds	SysTemp1,SysSYSINSTRING3Handler
	ldi	SysTemp4,1
	add	SysTemp1,SysTemp4
	mov	SysStringA,SysTemp1
	lds	SysTemp1,SysSYSINSTRING3Handler_H
	ldi	SysTemp4,0
	adc	SysTemp1,SysTemp4
	mov	SysStringA_H,SysTemp1
	ld	SysValueCopy,X+
	sts	SysArrayTemp2,SysValueCopy
	sts	SysArrayTemp1,SysValueCopy
	lds	SysTemp1,SYSSTRINGTEMP
	ldi	SysTemp4,low(PAD)
	add	SysTemp1,SysTemp4
	mov	SysStringA,SysTemp1
	ldi	SysTemp4,0
	ldi	SysTemp2,high(PAD)
	adc	SysTemp4,SysTemp2
	mov	SysStringA_H,SysTemp4
	lds	SysValueCopy,SysArrayTemp1
	st	X+,SysValueCopy
;Next
	lds	SysCalcTempA,SYSSTRINGTEMP
	lds	SysCalcTempB,SYSSTRLEN
	cp	SysCalcTempA,SysCalcTempB
	brlo	SysForLoop14
SysForLoopEnd14:
;set new length to PAD
;Pad(0) = SysStrLen
	lds	SysValueCopy,SYSSTRLEN
	sts	SYSPAD_0,SysValueCopy
;else
	rjmp	ENDIF77
ELSE77_1:
;SysInString is equal or longer than SysStrLen
;give back old string; copy SysInString to Pad
;For SysStringTemp = 1 To SysInString(0)
	ldi	SysValueCopy,0
	sts	SYSSTRINGTEMP,SysValueCopy
	lds	SysStringA,SysSYSINSTRINGHandler
	lds	SysStringA_H,SysSYSINSTRINGHandler_H
	ld	SysCalcTempA,X
	cpi	SysCalcTempA,1
	brlo	SysForLoopEnd15
SysForLoop15:
	lds	SysTemp1,SYSSTRINGTEMP
	inc	SysTemp1
	sts	SYSSTRINGTEMP,SysTemp1
;Pad(SysStringTemp) = SysInString(SysStringTemp)
	lds	SysTemp1,SysSYSINSTRINGHandler
	lds	SysTemp3,SYSSTRINGTEMP
	add	SysTemp1,SysTemp3
	mov	SysStringA,SysTemp1
	lds	SysTemp1,SysSYSINSTRINGHandler_H
	ldi	SysTemp4,0
	adc	SysTemp1,SysTemp4
	mov	SysStringA_H,SysTemp1
	ld	SysValueCopy,X+
	sts	SysArrayTemp1,SysValueCopy
	sts	SysArrayTemp2,SysValueCopy
	lds	SysTemp1,SYSSTRINGTEMP
	ldi	SysTemp4,low(PAD)
	add	SysTemp1,SysTemp4
	mov	SysStringA,SysTemp1
	ldi	SysTemp4,0
	ldi	SysTemp2,high(PAD)
	adc	SysTemp4,SysTemp2
	mov	SysStringA_H,SysTemp4
	lds	SysValueCopy,SysArrayTemp2
	st	X+,SysValueCopy
;Next
	lds	SysStringA,SysSYSINSTRINGHandler
	lds	SysStringA_H,SysSYSINSTRINGHandler_H
	lds	SysCalcTempA,SYSSTRINGTEMP
	ld	SysCalcTempB,X
	cp	SysCalcTempA,SysCalcTempB
	brlo	SysForLoop15
SysForLoopEnd15:
;PAD(0) = SysInString(0)
	lds	SysStringA,SysSYSINSTRINGHandler
	lds	SysStringA_H,SysSYSINSTRINGHandler_H
	ld	SysValueCopy,X+
	sts	SysArrayTemp1,SysValueCopy
	sts	SYSPAD_0,SysValueCopy
;End If
ENDIF77:
	ret

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
	ldi	SysTemp4,3
	in	SysTemp3,PORTD
	and	SysTemp3,SysTemp4
	mov	SysTemp1,SysTemp3
	ldi	SysTemp4,252
	lds	SysTemp2,ILI9341SENDBYTE
	and	SysTemp2,SysTemp4
	mov	SysTemp3,SysTemp2
	or	SysTemp3,SysTemp1
	out	PORTD,SysTemp3
;PORTB = (PORTB & 0B11111100) | ((ILI9341SendByte) & 0B00000011);
	ldi	SysTemp4,252
	in	SysTemp3,PORTB
	and	SysTemp3,SysTemp4
	mov	SysTemp1,SysTemp3
	ldi	SysTemp4,3
	lds	SysTemp2,ILI9341SENDBYTE
	and	SysTemp2,SysTemp4
	mov	SysTemp3,SysTemp2
	or	SysTemp3,SysTemp1
	out	PORTB,SysTemp3
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
	ldi	SysTemp4,3
	in	SysTemp3,PORTD
	and	SysTemp3,SysTemp4
	mov	SysTemp1,SysTemp3
	ldi	SysTemp4,252
	lds	SysTemp2,ILI9341SENDBYTE
	and	SysTemp2,SysTemp4
	mov	SysTemp3,SysTemp2
	or	SysTemp3,SysTemp1
	out	PORTD,SysTemp3
;PORTB = (PORTB & 0B11111100) | ((ILI9341SendByte) & 0B00000011);
	ldi	SysTemp4,252
	in	SysTemp3,PORTB
	and	SysTemp3,SysTemp4
	mov	SysTemp1,SysTemp3
	ldi	SysTemp4,3
	lds	SysTemp2,ILI9341SENDBYTE
	and	SysTemp2,SysTemp4
	mov	SysTemp3,SysTemp2
	or	SysTemp3,SysTemp1
	out	PORTB,SysTemp3
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
	ldi	SysTemp4,3
	in	SysTemp3,PORTD
	and	SysTemp3,SysTemp4
	mov	SysTemp1,SysTemp3
	ldi	SysTemp4,252
	lds	SysTemp2,ILI9341SENDWORD_H
	and	SysTemp2,SysTemp4
	mov	SysTemp3,SysTemp2
	or	SysTemp3,SysTemp1
	out	PORTD,SysTemp3
;PORTB = (PORTB & 0B11111100) | ((ILI9341SendWord_h) & 0B00000011);
	ldi	SysTemp4,252
	in	SysTemp3,PORTB
	and	SysTemp3,SysTemp4
	mov	SysTemp1,SysTemp3
	ldi	SysTemp4,3
	lds	SysTemp2,ILI9341SENDWORD_H
	and	SysTemp2,SysTemp4
	mov	SysTemp3,SysTemp2
	or	SysTemp3,SysTemp1
	out	PORTB,SysTemp3
;ILI9341_WR = 0
	cbi	PORTC,1
;ILI9341_WR = 1
	sbi	PORTC,1
;PORTD = (PORTD & 0B00000011) | ((ILI9341SendWord) & 0B11111100);
	ldi	SysTemp4,3
	in	SysTemp3,PORTD
	and	SysTemp3,SysTemp4
	mov	SysTemp1,SysTemp3
	ldi	SysTemp4,252
	lds	SysTemp2,ILI9341SENDWORD
	and	SysTemp2,SysTemp4
	mov	SysTemp3,SysTemp2
	ldi	SysValueCopy,0
	mov	SysTemp3_H,SysValueCopy
	or	SysTemp3,SysTemp1
	out	PORTD,SysTemp3
;PORTB = (PORTB & 0B11111100) | ((ILI9341SendWord) & 0B00000011);
	ldi	SysTemp4,252
	in	SysTemp3,PORTB
	and	SysTemp3,SysTemp4
	mov	SysTemp1,SysTemp3
	ldi	SysTemp4,3
	lds	SysTemp2,ILI9341SENDWORD
	and	SysTemp2,SysTemp4
	mov	SysTemp3,SysTemp2
	ldi	SysValueCopy,0
	mov	SysTemp3_H,SysValueCopy
	or	SysTemp3,SysTemp1
	out	PORTB,SysTemp3
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

SHOWCASE1:
;GLCDRotate ( Portrait )
	ldi	SysValueCopy,4
	sts	GLCDROTATESTATE,SysValueCopy
	rcall	GLCDROTATE_ILI9341
;GLCDDrawString (2, 1, "GCB", ILI9341_WHITE )
	ldi	SysValueCopy,2
	sts	STRINGLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	STRINGLOCX_H,SysValueCopy
	ldi	SysValueCopy,1
	sts	CHARLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable4<<1)
	ldi	SysReadA_H,high(StringTable4<<1)
	call	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysCHARSHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysCHARSHandler_H,SysValueCopy
	ldi	SysValueCopy,255
	sts	LINECOLOUR,SysValueCopy
	sts	LINECOLOUR_H,SysValueCopy
	rcall	GLCDDRAWSTRING_ILI9341
;GLCDDrawString (56,1,"v0.98.05", ILI9341_YELLOW )
	ldi	SysValueCopy,56
	sts	STRINGLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	STRINGLOCX_H,SysValueCopy
	ldi	SysValueCopy,1
	sts	CHARLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable5<<1)
	ldi	SysReadA_H,high(StringTable5<<1)
	call	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysCHARSHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysCHARSHandler_H,SysValueCopy
	ldi	SysValueCopy,224
	sts	LINECOLOUR,SysValueCopy
	ldi	SysValueCopy,255
	sts	LINECOLOUR_H,SysValueCopy
	rcall	GLCDDRAWSTRING_ILI9341
;GLCDDrawString (2, 16, "DrawStr", ILI9341_WHITE )
	ldi	SysValueCopy,2
	sts	STRINGLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	STRINGLOCX_H,SysValueCopy
	ldi	SysValueCopy,16
	sts	CHARLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable6<<1)
	ldi	SysReadA_H,high(StringTable6<<1)
	call	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysCHARSHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysCHARSHandler_H,SysValueCopy
	ldi	SysValueCopy,255
	sts	LINECOLOUR,SysValueCopy
	sts	LINECOLOUR_H,SysValueCopy
	rcall	GLCDDRAWSTRING_ILI9341
;GLCDDrawString ( 60, 31, "Long Number" )
	ldi	SysValueCopy,60
	sts	STRINGLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	STRINGLOCX_H,SysValueCopy
	ldi	SysValueCopy,31
	sts	CHARLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable7<<1)
	ldi	SysReadA_H,high(StringTable7<<1)
	call	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysCHARSHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysCHARSHandler_H,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND
	sts	LINECOLOUR,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND_H
	sts	LINECOLOUR_H,SysValueCopy
	rcall	GLCDDRAWSTRING_ILI9341
;GLCDDrawString ( 60, 39, "Word Number" )
	ldi	SysValueCopy,60
	sts	STRINGLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	STRINGLOCX_H,SysValueCopy
	ldi	SysValueCopy,39
	sts	CHARLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable8<<1)
	ldi	SysReadA_H,high(StringTable8<<1)
	call	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysCHARSHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysCHARSHandler_H,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND
	sts	LINECOLOUR,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND_H
	sts	LINECOLOUR_H,SysValueCopy
	rcall	GLCDDRAWSTRING_ILI9341
;GLCDDrawString ( 60, 47, "Byte Number" )
	ldi	SysValueCopy,60
	sts	STRINGLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	STRINGLOCX_H,SysValueCopy
	ldi	SysValueCopy,47
	sts	CHARLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable9<<1)
	ldi	SysReadA_H,high(StringTable9<<1)
	call	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysCHARSHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysCHARSHandler_H,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND
	sts	LINECOLOUR,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND_H
	sts	LINECOLOUR_H,SysValueCopy
	rcall	GLCDDRAWSTRING_ILI9341
;GLCDDrawString ( 74, 16, "Asc:" )
	ldi	SysValueCopy,74
	sts	STRINGLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	STRINGLOCX_H,SysValueCopy
	ldi	SysValueCopy,16
	sts	CHARLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable10<<1)
	ldi	SysReadA_H,high(StringTable10<<1)
	call	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysCHARSHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysCHARSHandler_H,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND
	sts	LINECOLOUR,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND_H
	sts	LINECOLOUR_H,SysValueCopy
	rcall	GLCDDRAWSTRING_ILI9341
;box 0,0,ILI9341_GLCD_WIDTH-1, ILI9341_GLCD_HEIGHT-1, ILI9341_YELLOW
	ldi	SysValueCopy,0
	sts	LINEX1,SysValueCopy
	sts	LINEX1_H,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINEY1,SysValueCopy
	sts	LINEY1_H,SysValueCopy
	lds	SysTemp1,GLCDDEVICEWIDTH
	ldi	SysTemp2,1
	sub	SysTemp1,SysTemp2
	sts	LINEX2,SysTemp1
	lds	SysTemp1,GLCDDEVICEWIDTH_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	LINEX2_H,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT
	ldi	SysTemp2,1
	sub	SysTemp1,SysTemp2
	sts	LINEY2,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	LINEY2_H,SysTemp1
	ldi	SysValueCopy,224
	sts	LINECOLOUR,SysValueCopy
	ldi	SysValueCopy,255
	sts	LINECOLOUR_H,SysValueCopy
	call	BOX
;box ILI9341_GLCD_WIDTH-5, ILI9341_GLCD_HEIGHT-5,ILI9341_GLCD_WIDTH-1, ILI9341_GLCD_HEIGHT-1, ILI9341_WHITE
	lds	SysTemp1,GLCDDEVICEWIDTH
	ldi	SysTemp2,5
	sub	SysTemp1,SysTemp2
	sts	LINEX1,SysTemp1
	lds	SysTemp1,GLCDDEVICEWIDTH_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	LINEX1_H,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT
	ldi	SysTemp2,5
	sub	SysTemp1,SysTemp2
	sts	LINEY1,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	LINEY1_H,SysTemp1
	lds	SysTemp1,GLCDDEVICEWIDTH
	ldi	SysTemp2,1
	sub	SysTemp1,SysTemp2
	sts	LINEX2,SysTemp1
	lds	SysTemp1,GLCDDEVICEWIDTH_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	LINEX2_H,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT
	ldi	SysTemp2,1
	sub	SysTemp1,SysTemp2
	sts	LINEY2,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	LINEY2_H,SysTemp1
	ldi	SysValueCopy,255
	sts	LINECOLOUR,SysValueCopy
	sts	LINECOLOUR_H,SysValueCopy
	call	BOX
;Circle( ILI9341_GLCD_WIDTH/2, ILI9341_GLCD_HEIGHT/2, 50, ILI9341_SILVER )            ;center
	lds	SysWORDTempA,GLCDDEVICEWIDTH
	lds	SysWORDTempA_H,GLCDDEVICEWIDTH_H
	ldi	SysWORDTempB,2
	ldi	SysWORDTempB_H,0
	call	SysDivSub16
	sts	XOFFSET,SysWORDTempA
	sts	XOFFSET_H,SysWORDTempA_H
	lds	SysWORDTempA,GLCDDEVICEHEIGHT
	lds	SysWORDTempA_H,GLCDDEVICEHEIGHT_H
	ldi	SysWORDTempB,2
	ldi	SysWORDTempB_H,0
	call	SysDivSub16
	sts	YOFFSET,SysWORDTempA
	sts	YOFFSET_H,SysWORDTempA_H
	ldi	SysValueCopy,50
	sts	INXRADIUS,SysValueCopy
	ldi	SysValueCopy,0
	sts	INXRADIUS_H,SysValueCopy
	ldi	SysValueCopy,24
	sts	LINECOLOUR,SysValueCopy
	ldi	SysValueCopy,198
	sts	LINECOLOUR_H,SysValueCopy
	lds	SysValueCopy,GLCD_YORDINATE
	sts	YORDINATE,SysValueCopy
	call	CIRCLE
;FilledCircle( ILI9341_GLCD_WIDTH/2, ILI9341_GLCD_HEIGHT/2, 25, ILI9341_D_GRAY  )
	lds	SysWORDTempA,GLCDDEVICEWIDTH
	lds	SysWORDTempA_H,GLCDDEVICEWIDTH_H
	ldi	SysWORDTempB,2
	ldi	SysWORDTempB_H,0
	rcall	SysDivSub16
	sts	XOFFSET,SysWORDTempA
	sts	XOFFSET_H,SysWORDTempA_H
	lds	SysWORDTempA,GLCDDEVICEHEIGHT
	lds	SysWORDTempA_H,GLCDDEVICEHEIGHT_H
	ldi	SysWORDTempB,2
	ldi	SysWORDTempB_H,0
	rcall	SysDivSub16
	sts	YOFFSET,SysWORDTempA
	sts	YOFFSET_H,SysWORDTempA_H
	ldi	SysValueCopy,25
	sts	XRADIUS,SysValueCopy
	ldi	SysValueCopy,0
	sts	XRADIUS_H,SysValueCopy
	ldi	SysValueCopy,138
	sts	LINECOLOUR,SysValueCopy
	ldi	SysValueCopy,82
	sts	LINECOLOUR_H,SysValueCopy
	call	FILLEDCIRCLE
;line 0,  ILI9341_GLCD_HEIGHT-1 , ILI9341_GLCD_WIDTH/2 +100,  (ILI9341_GLCD_HEIGHT /2) - 50, ILI9341_CYAN
	ldi	SysValueCopy,0
	sts	LINEX1,SysValueCopy
	sts	LINEX1_H,SysValueCopy
	lds	SysTemp1,GLCDDEVICEHEIGHT
	ldi	SysTemp2,1
	sub	SysTemp1,SysTemp2
	sts	LINEY1,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	LINEY1_H,SysTemp1
	lds	SysWORDTempA,GLCDDEVICEWIDTH
	lds	SysWORDTempA_H,GLCDDEVICEWIDTH_H
	ldi	SysWORDTempB,2
	ldi	SysWORDTempB_H,0
	rcall	SysDivSub16
	mov	SysTemp1,SysWORDTempA
	ldi	SysTemp2,100
	add	SysTemp1,SysTemp2
	sts	LINEX2,SysTemp1
	mov	SysTemp1,SysWORDTempA_H
	ldi	SysTemp2,0
	adc	SysTemp1,SysTemp2
	sts	LINEX2_H,SysTemp1
	lds	SysWORDTempA,GLCDDEVICEHEIGHT
	lds	SysWORDTempA_H,GLCDDEVICEHEIGHT_H
	ldi	SysWORDTempB,2
	ldi	SysWORDTempB_H,0
	rcall	SysDivSub16
	mov	SysTemp1,SysWORDTempA
	mov	SysTemp1_H,SysWORDTempA_H
	ldi	SysTemp2,50
	sub	SysTemp1,SysTemp2
	sts	LINEY2,SysTemp1
	ldi	SysTemp2,0
	sbc	SysTemp1_H,SysTemp2
	sts	LINEY2_H,SysTemp1_H
	ldi	SysValueCopy,255
	sts	LINECOLOUR,SysValueCopy
	ldi	SysValueCopy,7
	sts	LINECOLOUR_H,SysValueCopy
	rcall	LINE
;line  0, (ILI9341_GLCD_HEIGHT /2) - 50, ILI9341_GLCD_WIDTH/2 +100, (ILI9341_GLCD_HEIGHT /2) - 50, ILI9341_CYAN
	ldi	SysValueCopy,0
	sts	LINEX1,SysValueCopy
	sts	LINEX1_H,SysValueCopy
	lds	SysWORDTempA,GLCDDEVICEHEIGHT
	lds	SysWORDTempA_H,GLCDDEVICEHEIGHT_H
	ldi	SysWORDTempB,2
	ldi	SysWORDTempB_H,0
	rcall	SysDivSub16
	mov	SysTemp1,SysWORDTempA
	mov	SysTemp1_H,SysWORDTempA_H
	ldi	SysTemp2,50
	sub	SysTemp1,SysTemp2
	sts	LINEY1,SysTemp1
	ldi	SysTemp2,0
	sbc	SysTemp1_H,SysTemp2
	sts	LINEY1_H,SysTemp1_H
	lds	SysWORDTempA,GLCDDEVICEWIDTH
	lds	SysWORDTempA_H,GLCDDEVICEWIDTH_H
	ldi	SysWORDTempB,2
	ldi	SysWORDTempB_H,0
	rcall	SysDivSub16
	mov	SysTemp1,SysWORDTempA
	ldi	SysTemp2,100
	add	SysTemp1,SysTemp2
	sts	LINEX2,SysTemp1
	mov	SysTemp1,SysWORDTempA_H
	ldi	SysTemp2,0
	adc	SysTemp1,SysTemp2
	sts	LINEX2_H,SysTemp1
	lds	SysWORDTempA,GLCDDEVICEHEIGHT
	lds	SysWORDTempA_H,GLCDDEVICEHEIGHT_H
	ldi	SysWORDTempB,2
	ldi	SysWORDTempB_H,0
	rcall	SysDivSub16
	mov	SysTemp1,SysWORDTempA
	mov	SysTemp1_H,SysWORDTempA_H
	ldi	SysTemp2,50
	sub	SysTemp1,SysTemp2
	sts	LINEY2,SysTemp1
	ldi	SysTemp2,0
	sbc	SysTemp1_H,SysTemp2
	sts	LINEY2_H,SysTemp1_H
	ldi	SysValueCopy,255
	sts	LINECOLOUR,SysValueCopy
	ldi	SysValueCopy,7
	sts	LINECOLOUR_H,SysValueCopy
	rcall	LINE
;filledbox 2,ILI9341_GLCD_HEIGHT/2+10,42,ILI9341_GLCD_HEIGHT/2+50, ILI9341_RED
	ldi	SysValueCopy,2
	sts	LINEX1,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINEX1_H,SysValueCopy
	lds	SysWORDTempA,GLCDDEVICEHEIGHT
	lds	SysWORDTempA_H,GLCDDEVICEHEIGHT_H
	ldi	SysWORDTempB,2
	ldi	SysWORDTempB_H,0
	rcall	SysDivSub16
	mov	SysTemp1,SysWORDTempA
	ldi	SysTemp2,10
	add	SysTemp1,SysTemp2
	sts	LINEY1,SysTemp1
	mov	SysTemp1,SysWORDTempA_H
	ldi	SysTemp2,0
	adc	SysTemp1,SysTemp2
	sts	LINEY1_H,SysTemp1
	ldi	SysValueCopy,42
	sts	LINEX2,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINEX2_H,SysValueCopy
	lds	SysWORDTempA,GLCDDEVICEHEIGHT
	lds	SysWORDTempA_H,GLCDDEVICEHEIGHT_H
	ldi	SysWORDTempB,2
	ldi	SysWORDTempB_H,0
	rcall	SysDivSub16
	mov	SysTemp1,SysWORDTempA
	ldi	SysTemp2,50
	add	SysTemp1,SysTemp2
	sts	LINEY2,SysTemp1
	mov	SysTemp1,SysWORDTempA_H
	ldi	SysTemp2,0
	adc	SysTemp1,SysTemp2
	sts	LINEY2_H,SysTemp1
	ldi	SysValueCopy,0
	sts	LINECOLOUR,SysValueCopy
	ldi	SysValueCopy,248
	sts	LINECOLOUR_H,SysValueCopy
	call	FILLEDBOX_ILI9341
;oldfont = GLCDfntDefaultsize
	lds	SysValueCopy,GLCDFNTDEFAULTSIZE
	sts	OLDFONT,SysValueCopy
;GLCDfntDefaultsize = 2
	ldi	SysValueCopy,2
	sts	GLCDFNTDEFAULTSIZE,SysValueCopy
;GLCDDrawString ( 42, ILI9341_GLCD_HEIGHT - 30 , "ILI9341 Driver" , ILI9341_WHITE )
	ldi	SysValueCopy,42
	sts	STRINGLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	STRINGLOCX_H,SysValueCopy
	lds	SysTemp1,GLCDDEVICEHEIGHT
	ldi	SysTemp2,30
	sub	SysTemp1,SysTemp2
	sts	CHARLOCY,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	CHARLOCY_H,SysTemp1
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable11<<1)
	ldi	SysReadA_H,high(StringTable11<<1)
	call	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysCHARSHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysCHARSHandler_H,SysValueCopy
	ldi	SysValueCopy,255
	sts	LINECOLOUR,SysValueCopy
	sts	LINECOLOUR_H,SysValueCopy
	call	GLCDDRAWSTRING_ILI9341
;GLCDfntDefaultsize = 1
	ldi	SysValueCopy,1
	sts	GLCDFNTDEFAULTSIZE,SysValueCopy
;GLCDDrawString ( 72, ILI9341_GLCD_HEIGHT - 60 , "Great Cow BASIC" , ILI9341_WHITE )
	ldi	SysValueCopy,72
	sts	STRINGLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	STRINGLOCX_H,SysValueCopy
	lds	SysTemp1,GLCDDEVICEHEIGHT
	ldi	SysTemp2,60
	sub	SysTemp1,SysTemp2
	sts	CHARLOCY,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	CHARLOCY_H,SysTemp1
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable12<<1)
	ldi	SysReadA_H,high(StringTable12<<1)
	call	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysCHARSHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysCHARSHandler_H,SysValueCopy
	ldi	SysValueCopy,255
	sts	LINECOLOUR,SysValueCopy
	sts	LINECOLOUR_H,SysValueCopy
	call	GLCDDRAWSTRING_ILI9341
;GLCDDrawString ( ILI9341_GLCD_WIDTH - 60, 2 , "Mar 2019" , ILI9341_WHITE )
	lds	SysTemp1,GLCDDEVICEWIDTH
	ldi	SysTemp2,60
	sub	SysTemp1,SysTemp2
	sts	STRINGLOCX,SysTemp1
	lds	SysTemp1,GLCDDEVICEWIDTH_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	STRINGLOCX_H,SysTemp1
	ldi	SysValueCopy,2
	sts	CHARLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable13<<1)
	ldi	SysReadA_H,high(StringTable13<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysCHARSHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysCHARSHandler_H,SysValueCopy
	ldi	SysValueCopy,255
	sts	LINECOLOUR,SysValueCopy
	sts	LINECOLOUR_H,SysValueCopy
	call	GLCDDRAWSTRING_ILI9341
;GLCDDrawString ( ILI9341_GLCD_WIDTH - 38, 10 , "8 bit" , ILI9341_WHITE )
	lds	SysTemp1,GLCDDEVICEWIDTH
	ldi	SysTemp2,38
	sub	SysTemp1,SysTemp2
	sts	STRINGLOCX,SysTemp1
	lds	SysTemp1,GLCDDEVICEWIDTH_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	STRINGLOCX_H,SysTemp1
	ldi	SysValueCopy,10
	sts	CHARLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable14<<1)
	ldi	SysReadA_H,high(StringTable14<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysCHARSHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysCHARSHandler_H,SysValueCopy
	ldi	SysValueCopy,255
	sts	LINECOLOUR,SysValueCopy
	sts	LINECOLOUR_H,SysValueCopy
	call	GLCDDRAWSTRING_ILI9341
;Revert the font size
;GLCDfntDefaultsize = oldfont
	lds	SysValueCopy,OLDFONT
	sts	GLCDFNTDEFAULTSIZE,SysValueCopy
;GLCDForeground = ILI9341_WHITE
	ldi	SysValueCopy,255
	sts	GLCDFOREGROUND,SysValueCopy
	sts	GLCDFOREGROUND_H,SysValueCopy
;DO forever
SysDoLoop_S1:
;GLCDPrint ( 144 , 31, longNumber)
	ldi	SysValueCopy,144
	sts	PRINTLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCX_H,SysValueCopy
	ldi	SysValueCopy,31
	sts	PRINTLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCY_H,SysValueCopy
	lds	SysValueCopy,LONGNUMBER
	sts	LCDVALUE,SysValueCopy
	lds	SysValueCopy,LONGNUMBER_H
	sts	LCDVALUE_H,SysValueCopy
	lds	SysValueCopy,LONGNUMBER_U
	sts	LCDVALUE_U,SysValueCopy
	lds	SysValueCopy,LONGNUMBER_E
	sts	LCDVALUE_E,SysValueCopy
	call	GLCDPRINT7
;GLCDPrint ( 144 , 39, pad( str(wordnumber),5))
	ldi	SysValueCopy,144
	sts	PRINTLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCX_H,SysValueCopy
	ldi	SysValueCopy,39
	sts	PRINTLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCY_H,SysValueCopy
	lds	SysValueCopy,WORDNUMBER
	sts	SYSVALTEMP,SysValueCopy
	lds	SysValueCopy,WORDNUMBER_H
	sts	SYSVALTEMP_H,SysValueCopy
	rcall	FN_STR
	ldi	SysValueCopy,low(STR)
	sts	SysSYSINSTRINGHandler,SysValueCopy
	ldi	SysValueCopy,high(STR)
	sts	SysSYSINSTRINGHandler_H,SysValueCopy
	ldi	SysValueCopy,5
	sts	SYSSTRLEN,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable53<<1)
	ldi	SysReadA_H,high(StringTable53<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysSYSINSTRING3Handler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysSYSINSTRING3Handler_H,SysValueCopy
	rcall	FN_PAD
	ldi	SysValueCopy,low(PAD)
	sts	SysLCDPRINTDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(PAD)
	sts	SysLCDPRINTDATAHandler_H,SysValueCopy
	call	GLCDPRINT5
;GLCDPrint ( 144 , 47, pad( str(bytenumber),3))
	ldi	SysValueCopy,144
	sts	PRINTLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCX_H,SysValueCopy
	ldi	SysValueCopy,47
	sts	PRINTLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCY_H,SysValueCopy
	lds	SysValueCopy,BYTENUMBER
	sts	SYSVALTEMP,SysValueCopy
	ldi	SysValueCopy,0
	sts	SYSVALTEMP_H,SysValueCopy
	rcall	FN_STR
	ldi	SysValueCopy,low(STR)
	sts	SysSYSINSTRINGHandler,SysValueCopy
	ldi	SysValueCopy,high(STR)
	sts	SysSYSINSTRINGHandler_H,SysValueCopy
	ldi	SysValueCopy,3
	sts	SYSSTRLEN,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable53<<1)
	ldi	SysReadA_H,high(StringTable53<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysSYSINSTRING3Handler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysSYSINSTRING3Handler_H,SysValueCopy
	rcall	FN_PAD
	ldi	SysValueCopy,low(PAD)
	sts	SysLCDPRINTDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(PAD)
	sts	SysLCDPRINTDATAHandler_H,SysValueCopy
	call	GLCDPRINT5
;GLCDDrawChar(54, 16, CCount )
	ldi	SysValueCopy,54
	sts	CHARLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCX_H,SysValueCopy
	ldi	SysValueCopy,16
	sts	CHARLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCY_H,SysValueCopy
	lds	SysValueCopy,CCOUNT
	sts	CHARCODE,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND
	sts	LINECOLOUR,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND_H
	sts	LINECOLOUR_H,SysValueCopy
	call	GLCDDRAWCHAR_ILI9341
;Box 52,15,62,26, ILI9341_WHITE                'Draw a box around the Char below
	ldi	SysValueCopy,52
	sts	LINEX1,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINEX1_H,SysValueCopy
	ldi	SysValueCopy,15
	sts	LINEY1,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINEY1_H,SysValueCopy
	ldi	SysValueCopy,62
	sts	LINEX2,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINEX2_H,SysValueCopy
	ldi	SysValueCopy,26
	sts	LINEY2,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINEY2_H,SysValueCopy
	ldi	SysValueCopy,255
	sts	LINECOLOUR,SysValueCopy
	sts	LINECOLOUR_H,SysValueCopy
	call	BOX
;GLCDDrawString ( 100, 16 , pad( str(CCount),3) )
	ldi	SysValueCopy,100
	sts	STRINGLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	STRINGLOCX_H,SysValueCopy
	ldi	SysValueCopy,16
	sts	CHARLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCY_H,SysValueCopy
	lds	SysValueCopy,CCOUNT
	sts	SYSVALTEMP,SysValueCopy
	ldi	SysValueCopy,0
	sts	SYSVALTEMP_H,SysValueCopy
	rcall	FN_STR
	ldi	SysValueCopy,low(STR)
	sts	SysSYSINSTRINGHandler,SysValueCopy
	ldi	SysValueCopy,high(STR)
	sts	SysSYSINSTRINGHandler_H,SysValueCopy
	ldi	SysValueCopy,3
	sts	SYSSTRLEN,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable53<<1)
	ldi	SysReadA_H,high(StringTable53<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysSYSINSTRING3Handler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysSYSINSTRING3Handler_H,SysValueCopy
	rcall	FN_PAD
	ldi	SysValueCopy,low(PAD)
	sts	SysCHARSHandler,SysValueCopy
	ldi	SysValueCopy,high(PAD)
	sts	SysCHARSHandler_H,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND
	sts	LINECOLOUR,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND_H
	sts	LINECOLOUR_H,SysValueCopy
	call	GLCDDRAWSTRING_ILI9341
;CCount++
	lds	SysTemp1,CCOUNT
	inc	SysTemp1
	sts	CCOUNT,SysTemp1
;if CCount = 0 then CCount = 31
	lds	SysCalcTempA,CCOUNT
	tst	SysCalcTempA
	brne	ENDIF1
	ldi	SysValueCopy,31
	sts	CCOUNT,SysValueCopy
ENDIF1:
;if CCount = 128 then CCount = 192
	lds	SysCalcTempA,CCOUNT
	cpi	SysCalcTempA,128
	brne	ENDIF2
	ldi	SysValueCopy,192
	sts	CCOUNT,SysValueCopy
ENDIF2:
;longNumber = longNumber + 7
	lds	SysTemp1,LONGNUMBER
	ldi	SysTemp2,7
	add	SysTemp1,SysTemp2
	sts	LONGNUMBER,SysTemp1
	lds	SysTemp1,LONGNUMBER_H
	ldi	SysTemp2,0
	adc	SysTemp1,SysTemp2
	sts	LONGNUMBER_H,SysTemp1
	lds	SysTemp1,LONGNUMBER_U
	ldi	SysTemp2,0
	adc	SysTemp1,SysTemp2
	sts	LONGNUMBER_U,SysTemp1
	lds	SysTemp1,LONGNUMBER_E
	ldi	SysTemp2,0
	adc	SysTemp1,SysTemp2
	sts	LONGNUMBER_E,SysTemp1
;wordNumber = wordNumber + 3
	lds	SysTemp1,WORDNUMBER
	ldi	SysTemp2,3
	add	SysTemp1,SysTemp2
	sts	WORDNUMBER,SysTemp1
	lds	SysTemp1,WORDNUMBER_H
	ldi	SysTemp2,0
	adc	SysTemp1,SysTemp2
	sts	WORDNUMBER_H,SysTemp1
;byteNumber++
	lds	SysTemp1,BYTENUMBER
	inc	SysTemp1
	sts	BYTENUMBER,SysTemp1
;LOOP
	rjmp	SysDoLoop_S1
SysDoLoop_E1:
	ret

;********************************************************************************

SHOWCASE2:
;GLCDRotate ( Landscape_rev )
	ldi	SysValueCopy,3
	sts	GLCDROTATESTATE,SysValueCopy
	call	GLCDROTATE_ILI9341
;GLCDDrawString (2, 1, "GCB",ILI9341_WHITE)
	ldi	SysValueCopy,2
	sts	STRINGLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	STRINGLOCX_H,SysValueCopy
	ldi	SysValueCopy,1
	sts	CHARLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable4<<1)
	ldi	SysReadA_H,high(StringTable4<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysCHARSHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysCHARSHandler_H,SysValueCopy
	ldi	SysValueCopy,255
	sts	LINECOLOUR,SysValueCopy
	sts	LINECOLOUR_H,SysValueCopy
	call	GLCDDRAWSTRING_ILI9341
;GLCDDrawString (56,1,"v0.98.05",ILI9341_YELLOW)
	ldi	SysValueCopy,56
	sts	STRINGLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	STRINGLOCX_H,SysValueCopy
	ldi	SysValueCopy,1
	sts	CHARLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable5<<1)
	ldi	SysReadA_H,high(StringTable5<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysCHARSHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysCHARSHandler_H,SysValueCopy
	ldi	SysValueCopy,224
	sts	LINECOLOUR,SysValueCopy
	ldi	SysValueCopy,255
	sts	LINECOLOUR_H,SysValueCopy
	call	GLCDDRAWSTRING_ILI9341
;GLCDDrawString (2, 18, "DrawStr",ILI9341_WHITE)
	ldi	SysValueCopy,2
	sts	STRINGLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	STRINGLOCX_H,SysValueCopy
	ldi	SysValueCopy,18
	sts	CHARLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable6<<1)
	ldi	SysReadA_H,high(StringTable6<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysCHARSHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysCHARSHandler_H,SysValueCopy
	ldi	SysValueCopy,255
	sts	LINECOLOUR,SysValueCopy
	sts	LINECOLOUR_H,SysValueCopy
	call	GLCDDRAWSTRING_ILI9341
;GLCDDrawString ( 2, 52, "Long:" )
	ldi	SysValueCopy,2
	sts	STRINGLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	STRINGLOCX_H,SysValueCopy
	ldi	SysValueCopy,52
	sts	CHARLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable15<<1)
	ldi	SysReadA_H,high(StringTable15<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysCHARSHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysCHARSHandler_H,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND
	sts	LINECOLOUR,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND_H
	sts	LINECOLOUR_H,SysValueCopy
	call	GLCDDRAWSTRING_ILI9341
;GLCDDrawString ( 2, 70, "Word:" )
	ldi	SysValueCopy,2
	sts	STRINGLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	STRINGLOCX_H,SysValueCopy
	ldi	SysValueCopy,70
	sts	CHARLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable16<<1)
	ldi	SysReadA_H,high(StringTable16<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysCHARSHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysCHARSHandler_H,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND
	sts	LINECOLOUR,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND_H
	sts	LINECOLOUR_H,SysValueCopy
	call	GLCDDRAWSTRING_ILI9341
;GLCDDrawString ( 2, 88, "Byte:" )
	ldi	SysValueCopy,2
	sts	STRINGLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	STRINGLOCX_H,SysValueCopy
	ldi	SysValueCopy,88
	sts	CHARLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable17<<1)
	ldi	SysReadA_H,high(StringTable17<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysCHARSHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysCHARSHandler_H,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND
	sts	LINECOLOUR,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND_H
	sts	LINECOLOUR_H,SysValueCopy
	call	GLCDDRAWSTRING_ILI9341
;GLCDDrawString ( 128, 18, "Asc:"+"  " )
	ldi	SysValueCopy,128
	sts	STRINGLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	STRINGLOCX_H,SysValueCopy
	ldi	SysValueCopy,18
	sts	CHARLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	clr	SysStringLength
	ld	SysValueCopy, Y+
	ldi	SysReadA,low(StringTable10<<1)
	ldi	SysReadA_H,high(StringTable10<<1)
	rcall	SysReadStringPart
	ldi	SysReadA,low(StringTable18<<1)
	ldi	SysReadA_H,high(StringTable18<<1)
	rcall	SysReadStringPart
	ldi	SysStringA,low(SYSSTRINGPARAM2)
	ldi	SysStringA_H,high(SYSSTRINGPARAM2)
	st	X, SysStringLength
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysCHARSHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysCHARSHandler_H,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND
	sts	LINECOLOUR,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND_H
	sts	LINECOLOUR_H,SysValueCopy
	call	GLCDDRAWSTRING_ILI9341
;box 0,0,ILI9341_GLCD_WIDTH-1, ILI9341_GLCD_HEIGHT-1, ILI9341_YELLOW
	ldi	SysValueCopy,0
	sts	LINEX1,SysValueCopy
	sts	LINEX1_H,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINEY1,SysValueCopy
	sts	LINEY1_H,SysValueCopy
	lds	SysTemp1,GLCDDEVICEWIDTH
	ldi	SysTemp2,1
	sub	SysTemp1,SysTemp2
	sts	LINEX2,SysTemp1
	lds	SysTemp1,GLCDDEVICEWIDTH_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	LINEX2_H,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT
	ldi	SysTemp2,1
	sub	SysTemp1,SysTemp2
	sts	LINEY2,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	LINEY2_H,SysTemp1
	ldi	SysValueCopy,224
	sts	LINECOLOUR,SysValueCopy
	ldi	SysValueCopy,255
	sts	LINECOLOUR_H,SysValueCopy
	call	BOX
;box ILI9341_GLCD_WIDTH-5, ILI9341_GLCD_HEIGHT-5,ILI9341_GLCD_WIDTH-1, ILI9341_GLCD_HEIGHT-1, ILI9341_WHITE
	lds	SysTemp1,GLCDDEVICEWIDTH
	ldi	SysTemp2,5
	sub	SysTemp1,SysTemp2
	sts	LINEX1,SysTemp1
	lds	SysTemp1,GLCDDEVICEWIDTH_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	LINEX1_H,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT
	ldi	SysTemp2,5
	sub	SysTemp1,SysTemp2
	sts	LINEY1,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	LINEY1_H,SysTemp1
	lds	SysTemp1,GLCDDEVICEWIDTH
	ldi	SysTemp2,1
	sub	SysTemp1,SysTemp2
	sts	LINEX2,SysTemp1
	lds	SysTemp1,GLCDDEVICEWIDTH_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	LINEX2_H,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT
	ldi	SysTemp2,1
	sub	SysTemp1,SysTemp2
	sts	LINEY2,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	LINEY2_H,SysTemp1
	ldi	SysValueCopy,255
	sts	LINECOLOUR,SysValueCopy
	sts	LINECOLOUR_H,SysValueCopy
	call	BOX
;Circle( ILI9341_GLCD_WIDTH/2, ILI9341_GLCD_HEIGHT/2, 50, ILI9341_SILVER )            ;center
	lds	SysWORDTempA,GLCDDEVICEWIDTH
	lds	SysWORDTempA_H,GLCDDEVICEWIDTH_H
	ldi	SysWORDTempB,2
	ldi	SysWORDTempB_H,0
	rcall	SysDivSub16
	sts	XOFFSET,SysWORDTempA
	sts	XOFFSET_H,SysWORDTempA_H
	lds	SysWORDTempA,GLCDDEVICEHEIGHT
	lds	SysWORDTempA_H,GLCDDEVICEHEIGHT_H
	ldi	SysWORDTempB,2
	ldi	SysWORDTempB_H,0
	rcall	SysDivSub16
	sts	YOFFSET,SysWORDTempA
	sts	YOFFSET_H,SysWORDTempA_H
	ldi	SysValueCopy,50
	sts	INXRADIUS,SysValueCopy
	ldi	SysValueCopy,0
	sts	INXRADIUS_H,SysValueCopy
	ldi	SysValueCopy,24
	sts	LINECOLOUR,SysValueCopy
	ldi	SysValueCopy,198
	sts	LINECOLOUR_H,SysValueCopy
	lds	SysValueCopy,GLCD_YORDINATE
	sts	YORDINATE,SysValueCopy
	call	CIRCLE
;FilledCircle( ILI9341_GLCD_WIDTH/2, ILI9341_GLCD_HEIGHT/2, 25, ILI9341_D_GRAY  )
	lds	SysWORDTempA,GLCDDEVICEWIDTH
	lds	SysWORDTempA_H,GLCDDEVICEWIDTH_H
	ldi	SysWORDTempB,2
	ldi	SysWORDTempB_H,0
	rcall	SysDivSub16
	sts	XOFFSET,SysWORDTempA
	sts	XOFFSET_H,SysWORDTempA_H
	lds	SysWORDTempA,GLCDDEVICEHEIGHT
	lds	SysWORDTempA_H,GLCDDEVICEHEIGHT_H
	ldi	SysWORDTempB,2
	ldi	SysWORDTempB_H,0
	rcall	SysDivSub16
	sts	YOFFSET,SysWORDTempA
	sts	YOFFSET_H,SysWORDTempA_H
	ldi	SysValueCopy,25
	sts	XRADIUS,SysValueCopy
	ldi	SysValueCopy,0
	sts	XRADIUS_H,SysValueCopy
	ldi	SysValueCopy,138
	sts	LINECOLOUR,SysValueCopy
	ldi	SysValueCopy,82
	sts	LINECOLOUR_H,SysValueCopy
	call	FILLEDCIRCLE
;line 0,  ILI9341_GLCD_HEIGHT-1 , ILI9341_GLCD_WIDTH/2 +100,  (ILI9341_GLCD_HEIGHT /2) - 50, ILI9341_CYAN
	ldi	SysValueCopy,0
	sts	LINEX1,SysValueCopy
	sts	LINEX1_H,SysValueCopy
	lds	SysTemp1,GLCDDEVICEHEIGHT
	ldi	SysTemp2,1
	sub	SysTemp1,SysTemp2
	sts	LINEY1,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	LINEY1_H,SysTemp1
	lds	SysWORDTempA,GLCDDEVICEWIDTH
	lds	SysWORDTempA_H,GLCDDEVICEWIDTH_H
	ldi	SysWORDTempB,2
	ldi	SysWORDTempB_H,0
	rcall	SysDivSub16
	mov	SysTemp1,SysWORDTempA
	ldi	SysTemp2,100
	add	SysTemp1,SysTemp2
	sts	LINEX2,SysTemp1
	mov	SysTemp1,SysWORDTempA_H
	ldi	SysTemp2,0
	adc	SysTemp1,SysTemp2
	sts	LINEX2_H,SysTemp1
	lds	SysWORDTempA,GLCDDEVICEHEIGHT
	lds	SysWORDTempA_H,GLCDDEVICEHEIGHT_H
	ldi	SysWORDTempB,2
	ldi	SysWORDTempB_H,0
	rcall	SysDivSub16
	mov	SysTemp1,SysWORDTempA
	mov	SysTemp1_H,SysWORDTempA_H
	ldi	SysTemp2,50
	sub	SysTemp1,SysTemp2
	sts	LINEY2,SysTemp1
	ldi	SysTemp2,0
	sbc	SysTemp1_H,SysTemp2
	sts	LINEY2_H,SysTemp1_H
	ldi	SysValueCopy,255
	sts	LINECOLOUR,SysValueCopy
	ldi	SysValueCopy,7
	sts	LINECOLOUR_H,SysValueCopy
	call	LINE
;line  0, (ILI9341_GLCD_HEIGHT /2) - 50, ILI9341_GLCD_WIDTH/2 +100, (ILI9341_GLCD_HEIGHT /2) - 50, ILI9341_CYAN
	ldi	SysValueCopy,0
	sts	LINEX1,SysValueCopy
	sts	LINEX1_H,SysValueCopy
	lds	SysWORDTempA,GLCDDEVICEHEIGHT
	lds	SysWORDTempA_H,GLCDDEVICEHEIGHT_H
	ldi	SysWORDTempB,2
	ldi	SysWORDTempB_H,0
	rcall	SysDivSub16
	mov	SysTemp1,SysWORDTempA
	mov	SysTemp1_H,SysWORDTempA_H
	ldi	SysTemp2,50
	sub	SysTemp1,SysTemp2
	sts	LINEY1,SysTemp1
	ldi	SysTemp2,0
	sbc	SysTemp1_H,SysTemp2
	sts	LINEY1_H,SysTemp1_H
	lds	SysWORDTempA,GLCDDEVICEWIDTH
	lds	SysWORDTempA_H,GLCDDEVICEWIDTH_H
	ldi	SysWORDTempB,2
	ldi	SysWORDTempB_H,0
	rcall	SysDivSub16
	mov	SysTemp1,SysWORDTempA
	ldi	SysTemp2,100
	add	SysTemp1,SysTemp2
	sts	LINEX2,SysTemp1
	mov	SysTemp1,SysWORDTempA_H
	ldi	SysTemp2,0
	adc	SysTemp1,SysTemp2
	sts	LINEX2_H,SysTemp1
	lds	SysWORDTempA,GLCDDEVICEHEIGHT
	lds	SysWORDTempA_H,GLCDDEVICEHEIGHT_H
	ldi	SysWORDTempB,2
	ldi	SysWORDTempB_H,0
	rcall	SysDivSub16
	mov	SysTemp1,SysWORDTempA
	mov	SysTemp1_H,SysWORDTempA_H
	ldi	SysTemp2,50
	sub	SysTemp1,SysTemp2
	sts	LINEY2,SysTemp1
	ldi	SysTemp2,0
	sbc	SysTemp1_H,SysTemp2
	sts	LINEY2_H,SysTemp1_H
	ldi	SysValueCopy,255
	sts	LINECOLOUR,SysValueCopy
	ldi	SysValueCopy,7
	sts	LINECOLOUR_H,SysValueCopy
	call	LINE
;filledbox 2,ILI9341_GLCD_HEIGHT/2+10,42,ILI9341_GLCD_HEIGHT/2+50, ILI9341_RED
	ldi	SysValueCopy,2
	sts	LINEX1,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINEX1_H,SysValueCopy
	lds	SysWORDTempA,GLCDDEVICEHEIGHT
	lds	SysWORDTempA_H,GLCDDEVICEHEIGHT_H
	ldi	SysWORDTempB,2
	ldi	SysWORDTempB_H,0
	rcall	SysDivSub16
	mov	SysTemp1,SysWORDTempA
	ldi	SysTemp2,10
	add	SysTemp1,SysTemp2
	sts	LINEY1,SysTemp1
	mov	SysTemp1,SysWORDTempA_H
	ldi	SysTemp2,0
	adc	SysTemp1,SysTemp2
	sts	LINEY1_H,SysTemp1
	ldi	SysValueCopy,42
	sts	LINEX2,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINEX2_H,SysValueCopy
	lds	SysWORDTempA,GLCDDEVICEHEIGHT
	lds	SysWORDTempA_H,GLCDDEVICEHEIGHT_H
	ldi	SysWORDTempB,2
	ldi	SysWORDTempB_H,0
	rcall	SysDivSub16
	mov	SysTemp1,SysWORDTempA
	ldi	SysTemp2,50
	add	SysTemp1,SysTemp2
	sts	LINEY2,SysTemp1
	mov	SysTemp1,SysWORDTempA_H
	ldi	SysTemp2,0
	adc	SysTemp1,SysTemp2
	sts	LINEY2_H,SysTemp1
	ldi	SysValueCopy,0
	sts	LINECOLOUR,SysValueCopy
	ldi	SysValueCopy,248
	sts	LINECOLOUR_H,SysValueCopy
	call	FILLEDBOX_ILI9341
;oldfont = GLCDfntDefaultsize
	lds	SysValueCopy,GLCDFNTDEFAULTSIZE
	sts	OLDFONT,SysValueCopy
;GLCDfntDefaultsize = 3
	ldi	SysValueCopy,3
	sts	GLCDFNTDEFAULTSIZE,SysValueCopy
;GLCDDrawString ( 50, ILI9341_GLCD_HEIGHT - 30 , "ILI9341 Driver" , ILI9341_WHITE )
	ldi	SysValueCopy,50
	sts	STRINGLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	STRINGLOCX_H,SysValueCopy
	lds	SysTemp1,GLCDDEVICEHEIGHT
	ldi	SysTemp2,30
	sub	SysTemp1,SysTemp2
	sts	CHARLOCY,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	CHARLOCY_H,SysTemp1
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable11<<1)
	ldi	SysReadA_H,high(StringTable11<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysCHARSHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysCHARSHandler_H,SysValueCopy
	ldi	SysValueCopy,255
	sts	LINECOLOUR,SysValueCopy
	sts	LINECOLOUR_H,SysValueCopy
	call	GLCDDRAWSTRING_ILI9341
;GLCDfntDefaultsize = 1
	ldi	SysValueCopy,1
	sts	GLCDFNTDEFAULTSIZE,SysValueCopy
;GLCDDrawString ( ILI9341_GLCD_WIDTH - 60, 2 , "Mar 2019" , ILI9341_WHITE )
	lds	SysTemp1,GLCDDEVICEWIDTH
	ldi	SysTemp2,60
	sub	SysTemp1,SysTemp2
	sts	STRINGLOCX,SysTemp1
	lds	SysTemp1,GLCDDEVICEWIDTH_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	STRINGLOCX_H,SysTemp1
	ldi	SysValueCopy,2
	sts	CHARLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable13<<1)
	ldi	SysReadA_H,high(StringTable13<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysCHARSHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysCHARSHandler_H,SysValueCopy
	ldi	SysValueCopy,255
	sts	LINECOLOUR,SysValueCopy
	sts	LINECOLOUR_H,SysValueCopy
	call	GLCDDRAWSTRING_ILI9341
;GLCDDrawString ( ILI9341_GLCD_WIDTH - 38, 10 , "8 bit" , ILI9341_WHITE )
	lds	SysTemp1,GLCDDEVICEWIDTH
	ldi	SysTemp2,38
	sub	SysTemp1,SysTemp2
	sts	STRINGLOCX,SysTemp1
	lds	SysTemp1,GLCDDEVICEWIDTH_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	STRINGLOCX_H,SysTemp1
	ldi	SysValueCopy,10
	sts	CHARLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCY_H,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable14<<1)
	ldi	SysReadA_H,high(StringTable14<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysCHARSHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysCHARSHandler_H,SysValueCopy
	ldi	SysValueCopy,255
	sts	LINECOLOUR,SysValueCopy
	sts	LINECOLOUR_H,SysValueCopy
	call	GLCDDRAWSTRING_ILI9341
;Revert the font size
;GLCDfntDefaultsize = oldfont
	lds	SysValueCopy,OLDFONT
	sts	GLCDFNTDEFAULTSIZE,SysValueCopy
;GLCDForeground = ILI9341_WHITE
	ldi	SysValueCopy,255
	sts	GLCDFOREGROUND,SysValueCopy
	sts	GLCDFOREGROUND_H,SysValueCopy
;BigPrint_ILI9341 ( 100 , ILI9341_GLCD_HEIGHT - 60 , "Great Cow BASIC" )
	ldi	SysValueCopy,100
	sts	PRINTLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCX_H,SysValueCopy
	lds	SysTemp1,GLCDDEVICEHEIGHT
	ldi	SysTemp2,60
	sub	SysTemp1,SysTemp2
	sts	PRINTLOCY,SysTemp1
	lds	SysTemp1,GLCDDEVICEHEIGHT_H
	ldi	SysTemp2,0
	sbc	SysTemp1,SysTemp2
	sts	PRINTLOCY_H,SysTemp1
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable12<<1)
	ldi	SysReadA_H,high(StringTable12<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysPRINTDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysPRINTDATAHandler_H,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND
	sts	COLOR,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND_H
	sts	COLOR_H,SysValueCopy
	call	BIGPRINT_ILI9341
;DO forever
SysDoLoop_S2:
;GLCDPrint ( 64 , 52, longNumber)
	ldi	SysValueCopy,64
	sts	PRINTLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCX_H,SysValueCopy
	ldi	SysValueCopy,52
	sts	PRINTLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCY_H,SysValueCopy
	lds	SysValueCopy,LONGNUMBER
	sts	LCDVALUE,SysValueCopy
	lds	SysValueCopy,LONGNUMBER_H
	sts	LCDVALUE_H,SysValueCopy
	lds	SysValueCopy,LONGNUMBER_U
	sts	LCDVALUE_U,SysValueCopy
	lds	SysValueCopy,LONGNUMBER_E
	sts	LCDVALUE_E,SysValueCopy
	call	GLCDPRINT7
;GLCDPrint ( 64 , 70, pad( str(wordnumber),5))
	ldi	SysValueCopy,64
	sts	PRINTLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCX_H,SysValueCopy
	ldi	SysValueCopy,70
	sts	PRINTLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCY_H,SysValueCopy
	lds	SysValueCopy,WORDNUMBER
	sts	SYSVALTEMP,SysValueCopy
	lds	SysValueCopy,WORDNUMBER_H
	sts	SYSVALTEMP_H,SysValueCopy
	rcall	FN_STR
	ldi	SysValueCopy,low(STR)
	sts	SysSYSINSTRINGHandler,SysValueCopy
	ldi	SysValueCopy,high(STR)
	sts	SysSYSINSTRINGHandler_H,SysValueCopy
	ldi	SysValueCopy,5
	sts	SYSSTRLEN,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable53<<1)
	ldi	SysReadA_H,high(StringTable53<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysSYSINSTRING3Handler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysSYSINSTRING3Handler_H,SysValueCopy
	call	FN_PAD
	ldi	SysValueCopy,low(PAD)
	sts	SysLCDPRINTDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(PAD)
	sts	SysLCDPRINTDATAHandler_H,SysValueCopy
	call	GLCDPRINT5
;GLCDPrint ( 64 , 88, pad( str(bytenumber),3))
	ldi	SysValueCopy,64
	sts	PRINTLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCX_H,SysValueCopy
	ldi	SysValueCopy,88
	sts	PRINTLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	PRINTLOCY_H,SysValueCopy
	lds	SysValueCopy,BYTENUMBER
	sts	SYSVALTEMP,SysValueCopy
	ldi	SysValueCopy,0
	sts	SYSVALTEMP_H,SysValueCopy
	rcall	FN_STR
	ldi	SysValueCopy,low(STR)
	sts	SysSYSINSTRINGHandler,SysValueCopy
	ldi	SysValueCopy,high(STR)
	sts	SysSYSINSTRINGHandler_H,SysValueCopy
	ldi	SysValueCopy,3
	sts	SYSSTRLEN,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable53<<1)
	ldi	SysReadA_H,high(StringTable53<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysSYSINSTRING3Handler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysSYSINSTRING3Handler_H,SysValueCopy
	call	FN_PAD
	ldi	SysValueCopy,low(PAD)
	sts	SysLCDPRINTDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(PAD)
	sts	SysLCDPRINTDATAHandler_H,SysValueCopy
	call	GLCDPRINT5
;GLCDDrawChar(99, 18, CCount )
	ldi	SysValueCopy,99
	sts	CHARLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCX_H,SysValueCopy
	ldi	SysValueCopy,18
	sts	CHARLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCY_H,SysValueCopy
	lds	SysValueCopy,CCOUNT
	sts	CHARCODE,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND
	sts	LINECOLOUR,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND_H
	sts	LINECOLOUR_H,SysValueCopy
	call	GLCDDRAWCHAR_ILI9341
;Box 98,18,117,42, ILI9341_WHITE               'Draw a box around the Char below
	ldi	SysValueCopy,98
	sts	LINEX1,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINEX1_H,SysValueCopy
	ldi	SysValueCopy,18
	sts	LINEY1,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINEY1_H,SysValueCopy
	ldi	SysValueCopy,117
	sts	LINEX2,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINEX2_H,SysValueCopy
	ldi	SysValueCopy,42
	sts	LINEY2,SysValueCopy
	ldi	SysValueCopy,0
	sts	LINEY2_H,SysValueCopy
	ldi	SysValueCopy,255
	sts	LINECOLOUR,SysValueCopy
	sts	LINECOLOUR_H,SysValueCopy
	call	BOX
;GLCDDrawString ( 180, 18 , pad( str(CCount),3) )
	ldi	SysValueCopy,180
	sts	STRINGLOCX,SysValueCopy
	ldi	SysValueCopy,0
	sts	STRINGLOCX_H,SysValueCopy
	ldi	SysValueCopy,18
	sts	CHARLOCY,SysValueCopy
	ldi	SysValueCopy,0
	sts	CHARLOCY_H,SysValueCopy
	lds	SysValueCopy,CCOUNT
	sts	SYSVALTEMP,SysValueCopy
	ldi	SysValueCopy,0
	sts	SYSVALTEMP_H,SysValueCopy
	rcall	FN_STR
	ldi	SysValueCopy,low(STR)
	sts	SysSYSINSTRINGHandler,SysValueCopy
	ldi	SysValueCopy,high(STR)
	sts	SysSYSINSTRINGHandler_H,SysValueCopy
	ldi	SysValueCopy,3
	sts	SYSSTRLEN,SysValueCopy
	ldi	SysStringB,low(SYSSTRINGPARAM2)
	ldi	SysStringB_H,high(SYSSTRINGPARAM2)
	ldi	SysReadA,low(StringTable53<<1)
	ldi	SysReadA_H,high(StringTable53<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM2)
	sts	SysSYSINSTRING3Handler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM2)
	sts	SysSYSINSTRING3Handler_H,SysValueCopy
	call	FN_PAD
	ldi	SysValueCopy,low(PAD)
	sts	SysCHARSHandler,SysValueCopy
	ldi	SysValueCopy,high(PAD)
	sts	SysCHARSHandler_H,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND
	sts	LINECOLOUR,SysValueCopy
	lds	SysValueCopy,GLCDFOREGROUND_H
	sts	LINECOLOUR_H,SysValueCopy
	call	GLCDDRAWSTRING_ILI9341
;CCount++
	lds	SysTemp1,CCOUNT
	inc	SysTemp1
	sts	CCOUNT,SysTemp1
;if CCount = 0 then CCount = 31
	lds	SysCalcTempA,CCOUNT
	tst	SysCalcTempA
	brne	ENDIF3
	ldi	SysValueCopy,31
	sts	CCOUNT,SysValueCopy
ENDIF3:
;if CCount = 128 then CCount = 192
	lds	SysCalcTempA,CCOUNT
	cpi	SysCalcTempA,128
	brne	ENDIF4
	ldi	SysValueCopy,192
	sts	CCOUNT,SysValueCopy
ENDIF4:
;longNumber = longNumber + 7
	lds	SysTemp1,LONGNUMBER
	ldi	SysTemp2,7
	add	SysTemp1,SysTemp2
	sts	LONGNUMBER,SysTemp1
	lds	SysTemp1,LONGNUMBER_H
	ldi	SysTemp2,0
	adc	SysTemp1,SysTemp2
	sts	LONGNUMBER_H,SysTemp1
	lds	SysTemp1,LONGNUMBER_U
	ldi	SysTemp2,0
	adc	SysTemp1,SysTemp2
	sts	LONGNUMBER_U,SysTemp1
	lds	SysTemp1,LONGNUMBER_E
	ldi	SysTemp2,0
	adc	SysTemp1,SysTemp2
	sts	LONGNUMBER_E,SysTemp1
;wordNumber = wordNumber + 3
	lds	SysTemp1,WORDNUMBER
	ldi	SysTemp2,3
	add	SysTemp1,SysTemp2
	sts	WORDNUMBER,SysTemp1
	lds	SysTemp1,WORDNUMBER_H
	ldi	SysTemp2,0
	adc	SysTemp1,SysTemp2
	sts	WORDNUMBER_H,SysTemp1
;byteNumber++
	lds	SysTemp1,BYTENUMBER
	inc	SysTemp1
	sts	BYTENUMBER,SysTemp1
;LOOP
	rjmp	SysDoLoop_S2
SysDoLoop_E2:
	ret

;********************************************************************************

FN_STR:
;SysCharCount = 0
	ldi	SysValueCopy,0
	sts	SYSCHARCOUNT,SysValueCopy
;Dim SysCalcTempX As Word
;Ten Thousands
;IF SysValTemp >= 10000 then
	lds	SysWORDTempA,SYSVALTEMP
	lds	SysWORDTempA_H,SYSVALTEMP_H
	ldi	SysWORDTempB,16
	ldi	SysWORDTempB_H,39
	rcall	SysCompLessThan16
	com	SysByteTempX
	sbrs	SysByteTempX,0
	rjmp	ENDIF73
;SysStrData = SysValTemp / 10000
	lds	SysWORDTempA,SYSVALTEMP
	lds	SysWORDTempA_H,SYSVALTEMP_H
	ldi	SysWORDTempB,16
	ldi	SysWORDTempB_H,39
	rcall	SysDivSub16
	sts	SYSSTRDATA,SysWORDTempA
;SysValTemp = SysCalcTempX
	sts	SYSVALTEMP,SYSCALCTEMPX
	sts	SYSVALTEMP_H,SYSCALCTEMPX_H
;SysCharCount += 1
	lds	SysTemp1,SYSCHARCOUNT
	inc	SysTemp1
	sts	SYSCHARCOUNT,SysTemp1
;Str(SysCharCount) = SysStrData + 48
	ldi	SysTemp4,low(STR)
	add	SysTemp1,SysTemp4
	mov	SysStringA,SysTemp1
	ldi	SysTemp4,0
	ldi	SysTemp2,high(STR)
	adc	SysTemp4,SysTemp2
	mov	SysStringA_H,SysTemp4
	lds	SysTemp1,SYSSTRDATA
	ldi	SysTemp4,48
	add	SysTemp1,SysTemp4
	st	X,SysTemp1
;Goto SysValThousands
	rjmp	SYSVALTHOUSANDS
;End If
ENDIF73:
;Thousands
;IF SysValTemp >= 1000 then
	lds	SysWORDTempA,SYSVALTEMP
	lds	SysWORDTempA_H,SYSVALTEMP_H
	ldi	SysWORDTempB,232
	ldi	SysWORDTempB_H,3
	rcall	SysCompLessThan16
	com	SysByteTempX
	sbrs	SysByteTempX,0
	rjmp	ENDIF74
SYSVALTHOUSANDS:
;SysStrData = SysValTemp / 1000
	lds	SysWORDTempA,SYSVALTEMP
	lds	SysWORDTempA_H,SYSVALTEMP_H
	ldi	SysWORDTempB,232
	ldi	SysWORDTempB_H,3
	rcall	SysDivSub16
	sts	SYSSTRDATA,SysWORDTempA
;SysValTemp = SysCalcTempX
	sts	SYSVALTEMP,SYSCALCTEMPX
	sts	SYSVALTEMP_H,SYSCALCTEMPX_H
;SysCharCount += 1
	lds	SysTemp1,SYSCHARCOUNT
	inc	SysTemp1
	sts	SYSCHARCOUNT,SysTemp1
;Str(SysCharCount) = SysStrData + 48
	ldi	SysTemp4,low(STR)
	add	SysTemp1,SysTemp4
	mov	SysStringA,SysTemp1
	ldi	SysTemp4,0
	ldi	SysTemp2,high(STR)
	adc	SysTemp4,SysTemp2
	mov	SysStringA_H,SysTemp4
	lds	SysTemp1,SYSSTRDATA
	ldi	SysTemp4,48
	add	SysTemp1,SysTemp4
	st	X,SysTemp1
;Goto SysValHundreds
	rjmp	SYSVALHUNDREDS
;End If
ENDIF74:
;Hundreds
;IF SysValTemp >= 100 then
	lds	SysWORDTempA,SYSVALTEMP
	lds	SysWORDTempA_H,SYSVALTEMP_H
	ldi	SysWORDTempB,100
	ldi	SysWORDTempB_H,0
	rcall	SysCompLessThan16
	com	SysByteTempX
	sbrs	SysByteTempX,0
	rjmp	ENDIF75
SYSVALHUNDREDS:
;SysStrData = SysValTemp / 100
	lds	SysWORDTempA,SYSVALTEMP
	lds	SysWORDTempA_H,SYSVALTEMP_H
	ldi	SysWORDTempB,100
	ldi	SysWORDTempB_H,0
	rcall	SysDivSub16
	sts	SYSSTRDATA,SysWORDTempA
;SysValTemp = SysCalcTempX
	sts	SYSVALTEMP,SYSCALCTEMPX
	sts	SYSVALTEMP_H,SYSCALCTEMPX_H
;SysCharCount += 1
	lds	SysTemp1,SYSCHARCOUNT
	inc	SysTemp1
	sts	SYSCHARCOUNT,SysTemp1
;Str(SysCharCount) = SysStrData + 48
	ldi	SysTemp4,low(STR)
	add	SysTemp1,SysTemp4
	mov	SysStringA,SysTemp1
	ldi	SysTemp4,0
	ldi	SysTemp2,high(STR)
	adc	SysTemp4,SysTemp2
	mov	SysStringA_H,SysTemp4
	lds	SysTemp1,SYSSTRDATA
	ldi	SysTemp4,48
	add	SysTemp1,SysTemp4
	st	X,SysTemp1
;Goto SysValTens
	rjmp	SYSVALTENS
;End If
ENDIF75:
;Tens
;IF SysValTemp >= 10 Then
	lds	SysWORDTempA,SYSVALTEMP
	lds	SysWORDTempA_H,SYSVALTEMP_H
	ldi	SysWORDTempB,10
	ldi	SysWORDTempB_H,0
	rcall	SysCompLessThan16
	com	SysByteTempX
	sbrs	SysByteTempX,0
	rjmp	ENDIF76
SYSVALTENS:
;SysStrData = SysValTemp / 10
	lds	SysWORDTempA,SYSVALTEMP
	lds	SysWORDTempA_H,SYSVALTEMP_H
	ldi	SysWORDTempB,10
	ldi	SysWORDTempB_H,0
	rcall	SysDivSub16
	sts	SYSSTRDATA,SysWORDTempA
;SysValTemp = SysCalcTempX
	sts	SYSVALTEMP,SYSCALCTEMPX
	sts	SYSVALTEMP_H,SYSCALCTEMPX_H
;SysCharCount += 1
	lds	SysTemp1,SYSCHARCOUNT
	inc	SysTemp1
	sts	SYSCHARCOUNT,SysTemp1
;Str(SysCharCount) = SysStrData + 48
	ldi	SysTemp4,low(STR)
	add	SysTemp1,SysTemp4
	mov	SysStringA,SysTemp1
	ldi	SysTemp4,0
	ldi	SysTemp2,high(STR)
	adc	SysTemp4,SysTemp2
	mov	SysStringA_H,SysTemp4
	lds	SysTemp1,SYSSTRDATA
	ldi	SysTemp4,48
	add	SysTemp1,SysTemp4
	st	X,SysTemp1
;End If
ENDIF76:
;Ones
;SysCharCount += 1
	lds	SysTemp1,SYSCHARCOUNT
	inc	SysTemp1
	sts	SYSCHARCOUNT,SysTemp1
;Str(SysCharCount) = SysValTemp + 48
	ldi	SysTemp4,low(STR)
	add	SysTemp1,SysTemp4
	mov	SysStringA,SysTemp1
	ldi	SysTemp4,0
	ldi	SysTemp2,high(STR)
	adc	SysTemp4,SysTemp2
	mov	SysStringA_H,SysTemp4
	lds	SysTemp1,SYSVALTEMP
	ldi	SysTemp4,48
	add	SysTemp1,SysTemp4
	st	X,SysTemp1
;SysValTemp = SysCalcTempX
	sts	SYSVALTEMP,SYSCALCTEMPX
	sts	SYSVALTEMP_H,SYSCALCTEMPX_H
;Str(0) = SysCharCount
	lds	SysValueCopy,SYSCHARCOUNT
	sts	SYSSTR_0,SysValueCopy
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

SYSCOMPEQUAL32:
;dim SysLongTempA as long
;dim SysLongTempB as long
;dim SysByteTempX as byte
;clr SysByteTempX
	clr	SYSBYTETEMPX
;cp SysLongTempA, SysLongTempB
	cp	SYSLONGTEMPA, SYSLONGTEMPB
;brne SCE32False
	brne	SCE32FALSE
;cp SysLongTempA_H, SysLongTempB_H
	cp	SYSLONGTEMPA_H, SYSLONGTEMPB_H
;brne SCE32False
	brne	SCE32FALSE
;cp SysLongTempA_U, SysLongTempB_U
	cp	SYSLONGTEMPA_U, SYSLONGTEMPB_U
;brne SCE32False
	brne	SCE32FALSE
;cp SysLongTempA_E, SysLongTempB_E
	cp	SYSLONGTEMPA_E, SYSLONGTEMPB_E
;brne SCE32False
	brne	SCE32FALSE
;com SysByteTempX
	com	SYSBYTETEMPX
SCE32FALSE:
	ret

;********************************************************************************

SYSCOMPLESSTHAN:
;Dim SysByteTempA, SysByteTempB, SysByteTempX as byte
;clr SysByteTempX
	clr	SYSBYTETEMPX
;cp SysByteTempA,SysByteTempB
	cp	SYSBYTETEMPA,SYSBYTETEMPB
;brlo SCLTTrue
	brlo	SCLTTRUE
;ret
	ret
SCLTTRUE:
;com SysByteTempX
	com	SYSBYTETEMPX
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

SYSCOMPLESSTHANINT:
;Dim SysIntegerTempA, SysIntegerTempB, SysDivMultA as Integer
;Clear result
;SysByteTempX = 0
	ldi	SysValueCopy,0
	mov	SYSBYTETEMPX,SysValueCopy
;Compare sign bits
;-A
;If SysIntegerTempA.15 = On Then
	sbrs	SYSINTEGERTEMPA_H,7
	rjmp	ELSE70_1
;-A, +B, return true
;If SysIntegerTempB.15 = Off Then
	sbrc	SYSINTEGERTEMPB_H,7
	rjmp	ENDIF71
;Set SysByteTempX to 255
;SysByteTempX = Not SysByteTempX
	mov	SysTemp1,SYSBYTETEMPX
	com	SysTemp1
	mov	SYSBYTETEMPX,SysTemp1
;Exit Sub
	ret
;End If
ENDIF71:
;-A, -B, negate both and swap
;SysDivMultA = -SysIntegerTempA
	mov	SysTemp3,SYSINTEGERTEMPA
	mov	SysTemp3_H,SYSINTEGERTEMPA_H
	com	SysTemp3
	com	SysTemp3_H
	inc	SysTemp3
	brne	PC + 2
	inc	SysTemp3_H
	mov	SYSDIVMULTA,SysTemp3
	mov	SYSDIVMULTA_H,SysTemp3_H
;SysIntegerTempA = -SysIntegerTempB
	mov	SysTemp3,SYSINTEGERTEMPB
	mov	SysTemp3_H,SYSINTEGERTEMPB_H
	com	SysTemp3
	com	SysTemp3_H
	inc	SysTemp3
	brne	PC + 2
	inc	SysTemp3_H
	mov	SYSINTEGERTEMPA,SysTemp3
	mov	SYSINTEGERTEMPA_H,SysTemp3_H
;SysIntegerTempB = SysDivMultA
	mov	SYSINTEGERTEMPB,SYSDIVMULTA
	mov	SYSINTEGERTEMPB_H,SYSDIVMULTA_H
;+A
;Else
	rjmp	ENDIF70
ELSE70_1:
;+A, -B, return false
;If SysIntegerTempB.15 = On Then
	sbrc	SYSINTEGERTEMPB_H,7
;Exit Sub
	ret
;End If
ENDIF72:
;End If
ENDIF70:
;Test High, exit false if more
;cp SysIntegerTempB_H,SysIntegerTempA_H
	cp	SYSINTEGERTEMPB_H,SYSINTEGERTEMPA_H
;brlo SCLTIntFalse
	brlo	SCLTINTFALSE
;Test high, exit true if less
;cp SysIntegerTempA_H,SysIntegerTempB_H
	cp	SYSINTEGERTEMPA_H,SYSINTEGERTEMPB_H
;brlo SCLTIntTrue
	brlo	SCLTINTTRUE
;Test Low, exit if more or equal
;cp SysIntegerTempA,SysIntegerTempB
	cp	SYSINTEGERTEMPA,SYSINTEGERTEMPB
;brlo SCLTIntTrue
	brlo	SCLTINTTRUE
;ret
	ret
SCLTINTTRUE:
;com SysByteTempX
	com	SYSBYTETEMPX
SCLTINTFALSE:
	ret

;********************************************************************************

SYSDIVSUB:
;Check for div/0
;tst SysByteTempB
	tst	SYSBYTETEMPB
;brne DIV8Cont
	brne	DIV8CONT
;ret
	ret
DIV8CONT:
;Main calc routine
;clr SysByteTempX
	clr	SYSBYTETEMPX
;SysDivLoop = 8
	ldi	SysValueCopy,8
	mov	SYSDIVLOOP,SysValueCopy
SYSDIV8START:
;lsl SysByteTempA
	lsl	SYSBYTETEMPA
;rol SysByteTempX
	rol	SYSBYTETEMPX
;asm sub SysByteTempX,SysByteTempB 'asm needed, or else sub will be used as start of sub
	sub	SYSBYTETEMPX,SYSBYTETEMPB
;sbr SysByteTempA,1
	sbr	SYSBYTETEMPA,1
;brsh Div8NotNeg
	brsh	DIV8NOTNEG
;cbr SysByteTempA,1
	cbr	SYSBYTETEMPA,1
;add SysByteTempX,SysByteTempB
	add	SYSBYTETEMPX,SYSBYTETEMPB
DIV8NOTNEG:
;dec SysDivLoop
	dec	SYSDIVLOOP
;brne SysDiv8Start
	brne	SYSDIV8START
	ret

;********************************************************************************

SYSDIVSUB16:
;dim SysWordTempA as word
;dim SysWordTempB as word
;dim SysWordTempX as word
;dim SysDivMultA as word
;dim SysDivMultB as word
;dim SysDivMultX as word
;SysDivMultA = SysWordTempA
	mov	SYSDIVMULTA,SYSWORDTEMPA
	mov	SYSDIVMULTA_H,SYSWORDTEMPA_H
;SysDivMultB = SysWordTempB
	mov	SYSDIVMULTB,SYSWORDTEMPB
	mov	SYSDIVMULTB_H,SYSWORDTEMPB_H
;SysDivMultX = 0
	ldi	SysValueCopy,0
	mov	SYSDIVMULTX,SysValueCopy
	ldi	SysValueCopy,0
	mov	SYSDIVMULTX_H,SysValueCopy
;Avoid division by zero
;if SysDivMultB = 0 then
	mov	SysWORDTempA,SYSDIVMULTB
	mov	SysWORDTempA_H,SYSDIVMULTB_H
	ldi	SysWORDTempB,0
	ldi	SysWORDTempB_H,0
	rcall	SysCompEqual16
	sbrs	SysByteTempX,0
	rjmp	ENDIF63
;SysWordTempA = 0
	ldi	SYSWORDTEMPA,0
	ldi	SYSWORDTEMPA_H,0
;exit sub
	ret
;end if
ENDIF63:
;Main calc routine
;SysDivLoop = 16
	ldi	SysValueCopy,16
	mov	SYSDIVLOOP,SysValueCopy
SYSDIV16START:
;set C off
	clc
;Rotate SysDivMultA Left
	rol	SYSDIVMULTA
	rol	SYSDIVMULTA_H
;Rotate SysDivMultX Left
	rol	SYSDIVMULTX
	rol	SYSDIVMULTX_H
;SysDivMultX = SysDivMultX - SysDivMultB
	mov	SysTemp1,SYSDIVMULTX
	sub	SysTemp1,SYSDIVMULTB
	mov	SYSDIVMULTX,SysTemp1
	mov	SysTemp1,SYSDIVMULTX_H
	sbc	SysTemp1,SYSDIVMULTB_H
	mov	SYSDIVMULTX_H,SysTemp1
;Set SysDivMultA.0 On
	sbr	 SYSDIVMULTA,1<<0
;If C On Then
	brbc	C,ENDIF64
;Set SysDivMultA.0 Off
	cbr	 SYSDIVMULTA,1<<0
;SysDivMultX = SysDivMultX + SysDivMultB
	mov	SysTemp1,SYSDIVMULTX
	add	SysTemp1,SYSDIVMULTB
	mov	SYSDIVMULTX,SysTemp1
	mov	SysTemp1,SYSDIVMULTX_H
	adc	SysTemp1,SYSDIVMULTB_H
	mov	SYSDIVMULTX_H,SysTemp1
;End If
ENDIF64:
;dec SysDivLoop
	dec	SYSDIVLOOP
;brne SysDiv16Start
	brne	SYSDIV16START
;SysWordTempA = SysDivMultA
	mov	SYSWORDTEMPA,SYSDIVMULTA
	mov	SYSWORDTEMPA_H,SYSDIVMULTA_H
;SysWordTempX = SysDivMultX
	mov	SYSWORDTEMPX,SYSDIVMULTX
	mov	SYSWORDTEMPX_H,SYSDIVMULTX_H
	ret

;********************************************************************************

SYSDIVSUB32:
;dim SysLongTempA as long
;dim SysLongTempB as long
;dim SysLongTempX as long
;#ifdef PIC
;dim SysLongDivMultA as long
;dim SysLongDivMultB as long
;dim SysLongDivMultX as long
;#endif
;SysLongDivMultA = SysLongTempA
	sts	SYSLONGDIVMULTA,SYSLONGTEMPA
	sts	SYSLONGDIVMULTA_H,SYSLONGTEMPA_H
	sts	SYSLONGDIVMULTA_U,SYSLONGTEMPA_U
	sts	SYSLONGDIVMULTA_E,SYSLONGTEMPA_E
;SysLongDivMultB = SysLongTempB
	sts	SYSLONGDIVMULTB,SYSLONGTEMPB
	sts	SYSLONGDIVMULTB_H,SYSLONGTEMPB_H
	sts	SYSLONGDIVMULTB_U,SYSLONGTEMPB_U
	sts	SYSLONGDIVMULTB_E,SYSLONGTEMPB_E
;SysLongDivMultX = 0
	ldi	SysValueCopy,0
	sts	SYSLONGDIVMULTX,SysValueCopy
	sts	SYSLONGDIVMULTX_H,SysValueCopy
	sts	SYSLONGDIVMULTX_U,SysValueCopy
	sts	SYSLONGDIVMULTX_E,SysValueCopy
;Avoid division by zero
;if SysLongDivMultB = 0 then
	lds	SysLONGTempA,SYSLONGDIVMULTB
	lds	SysLONGTempA_H,SYSLONGDIVMULTB_H
	lds	SysLONGTempA_U,SYSLONGDIVMULTB_U
	lds	SysLONGTempA_E,SYSLONGDIVMULTB_E
	ldi	SysLONGTempB,0
	ldi	SysLONGTempB_H,0
	ldi	SysLONGTempB_U,0
	ldi	SysLONGTempB_E,0
	rcall	SysCompEqual32
	sbrs	SysByteTempX,0
	rjmp	ENDIF68
;SysLongTempA = 0
	ldi	SYSLONGTEMPA,0
	ldi	SYSLONGTEMPA_H,0
	ldi	SYSLONGTEMPA_U,0
	ldi	SYSLONGTEMPA_E,0
;exit sub
	ret
;end if
ENDIF68:
;Main calc routine
;SysDivLoop = 32
	ldi	SysValueCopy,32
	mov	SYSDIVLOOP,SysValueCopy
SYSDIV32START:
;set C off
	clc
;Rotate SysLongDivMultA Left
	lds	SysValueCopy,SYSLONGDIVMULTA
	rol	SysValueCopy
	sts	SYSLONGDIVMULTA,SysValueCopy
	lds	SysValueCopy,SYSLONGDIVMULTA_H
	rol	SysValueCopy
	sts	SYSLONGDIVMULTA_H,SysValueCopy
	lds	SysValueCopy,SYSLONGDIVMULTA_U
	rol	SysValueCopy
	sts	SYSLONGDIVMULTA_U,SysValueCopy
	lds	SysValueCopy,SYSLONGDIVMULTA_E
	rol	SysValueCopy
	sts	SYSLONGDIVMULTA_E,SysValueCopy
;Rotate SysLongDivMultX Left
	lds	SysValueCopy,SYSLONGDIVMULTX
	rol	SysValueCopy
	sts	SYSLONGDIVMULTX,SysValueCopy
	lds	SysValueCopy,SYSLONGDIVMULTX_H
	rol	SysValueCopy
	sts	SYSLONGDIVMULTX_H,SysValueCopy
	lds	SysValueCopy,SYSLONGDIVMULTX_U
	rol	SysValueCopy
	sts	SYSLONGDIVMULTX_U,SysValueCopy
	lds	SysValueCopy,SYSLONGDIVMULTX_E
	rol	SysValueCopy
	sts	SYSLONGDIVMULTX_E,SysValueCopy
;SysLongDivMultX = SysLongDivMultX - SysLongDivMultB
	lds	SysTemp1,SYSLONGDIVMULTX
	lds	SysTemp3,SYSLONGDIVMULTB
	sub	SysTemp1,SysTemp3
	sts	SYSLONGDIVMULTX,SysTemp1
	lds	SysTemp1,SYSLONGDIVMULTX_H
	lds	SysTemp3,SYSLONGDIVMULTB_H
	sbc	SysTemp1,SysTemp3
	sts	SYSLONGDIVMULTX_H,SysTemp1
	lds	SysTemp1,SYSLONGDIVMULTX_U
	lds	SysTemp3,SYSLONGDIVMULTB_U
	sbc	SysTemp1,SysTemp3
	sts	SYSLONGDIVMULTX_U,SysTemp1
	lds	SysTemp1,SYSLONGDIVMULTX_E
	lds	SysTemp3,SYSLONGDIVMULTB_E
	sbc	SysTemp1,SysTemp3
	sts	SYSLONGDIVMULTX_E,SysTemp1
;Set SysLongDivMultA.0 On
	lds	SysValueCopy,SYSLONGDIVMULTA
	sbr	SysValueCopy,1<<0
	sts	SYSLONGDIVMULTA,SysValueCopy
;If C On Then
	brbc	C,ENDIF69
;Set SysLongDivMultA.0 Off
	lds	SysValueCopy,SYSLONGDIVMULTA
	cbr	SysValueCopy,1<<0
	sts	SYSLONGDIVMULTA,SysValueCopy
;SysLongDivMultX = SysLongDivMultX + SysLongDivMultB
	lds	SysTemp1,SYSLONGDIVMULTX
	lds	SysTemp3,SYSLONGDIVMULTB
	add	SysTemp1,SysTemp3
	sts	SYSLONGDIVMULTX,SysTemp1
	lds	SysTemp1,SYSLONGDIVMULTX_H
	lds	SysTemp3,SYSLONGDIVMULTB_H
	adc	SysTemp1,SysTemp3
	sts	SYSLONGDIVMULTX_H,SysTemp1
	lds	SysTemp1,SYSLONGDIVMULTX_U
	lds	SysTemp3,SYSLONGDIVMULTB_U
	adc	SysTemp1,SysTemp3
	sts	SYSLONGDIVMULTX_U,SysTemp1
	lds	SysTemp1,SYSLONGDIVMULTX_E
	lds	SysTemp3,SYSLONGDIVMULTB_E
	adc	SysTemp1,SysTemp3
	sts	SYSLONGDIVMULTX_E,SysTemp1
;End If
ENDIF69:
;dec SysDivLoop
	dec	SYSDIVLOOP
;breq SysDiv32End
	breq	SYSDIV32END
;goto SysDiv32Start
	rjmp	SYSDIV32START
SYSDIV32END:
;SysLongTempA = SysLongDivMultA
	lds	SYSLONGTEMPA,SYSLONGDIVMULTA
	lds	SYSLONGTEMPA_H,SYSLONGDIVMULTA_H
	lds	SYSLONGTEMPA_U,SYSLONGDIVMULTA_U
	lds	SYSLONGTEMPA_E,SYSLONGDIVMULTA_E
;SysLongTempX = SysLongDivMultX
	lds	SYSLONGTEMPX,SYSLONGDIVMULTX
	lds	SYSLONGTEMPX_H,SYSLONGDIVMULTX_H
	lds	SYSLONGTEMPX_U,SYSLONGDIVMULTX_U
	lds	SYSLONGTEMPX_E,SYSLONGDIVMULTX_E
	ret

;********************************************************************************

SYSDIVSUBINT:
;Dim SysIntegerTempA, SysIntegerTempB, SysIntegerTempX As Integer
;Dim SysSignByte As Byte
;Make both inputs positive, decide output type
;SysSignByte = SysIntegerTempA_H xor SysIntegerTempB_H
	mov	SysTemp1,SYSINTEGERTEMPB_H
	eor	SysTemp1,SYSINTEGERTEMPA_H
	mov	SYSSIGNBYTE,SysTemp1
;If SysIntegerTempA.15 Then SysIntegerTempA = -SysIntegerTempA
	sbrs	SYSINTEGERTEMPA_H,7
	rjmp	ENDIF65
	mov	SysTemp3,SYSINTEGERTEMPA
	mov	SysTemp3_H,SYSINTEGERTEMPA_H
	com	SysTemp3
	com	SysTemp3_H
	inc	SysTemp3
	brne	PC + 2
	inc	SysTemp3_H
	mov	SYSINTEGERTEMPA,SysTemp3
	mov	SYSINTEGERTEMPA_H,SysTemp3_H
ENDIF65:
;If SysIntegerTempB.15 Then SysIntegerTempB = -SysIntegerTempB
	sbrs	SYSINTEGERTEMPB_H,7
	rjmp	ENDIF66
	mov	SysTemp3,SYSINTEGERTEMPB
	mov	SysTemp3_H,SYSINTEGERTEMPB_H
	com	SysTemp3
	com	SysTemp3_H
	inc	SysTemp3
	brne	PC + 2
	inc	SysTemp3_H
	mov	SYSINTEGERTEMPB,SysTemp3
	mov	SYSINTEGERTEMPB_H,SysTemp3_H
ENDIF66:
;Call word divide routine
;SysDivSub16
	rcall	SYSDIVSUB16
;Negate result if necessary
;If SysSignByte.7 Then
	sbrs	SYSSIGNBYTE,7
	rjmp	ENDIF67
;SysIntegerTempA = -SysIntegerTempA
	mov	SysTemp3,SYSINTEGERTEMPA
	mov	SysTemp3_H,SYSINTEGERTEMPA_H
	com	SysTemp3
	com	SysTemp3_H
	inc	SysTemp3
	brne	PC + 2
	inc	SysTemp3_H
	mov	SYSINTEGERTEMPA,SysTemp3
	mov	SYSINTEGERTEMPA_H,SysTemp3_H
;SysIntegerTempX = -SysIntegerTempX
	mov	SysTemp3,SYSINTEGERTEMPX
	mov	SysTemp3_H,SYSINTEGERTEMPX_H
	com	SysTemp3
	com	SysTemp3_H
	inc	SysTemp3
	brne	PC + 2
	inc	SysTemp3_H
	mov	SYSINTEGERTEMPX,SysTemp3
	mov	SYSINTEGERTEMPX_H,SysTemp3_H
;End If
ENDIF67:
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

SYSMULTSUBINT:
;Dim SysIntegerTempA, SysIntegerTempB, SysIntegerTempX As Integer
;Dim SysSignByte As Byte
;Make both inputs positive, decide output type
;SysSignByte = SysIntegerTempA_H xor SysIntegerTempB_H
	mov	SysTemp1,SYSINTEGERTEMPB_H
	eor	SysTemp1,SYSINTEGERTEMPA_H
	mov	SYSSIGNBYTE,SysTemp1
;if SysIntegerTempA.15 then SysIntegerTempA = -SysIntegerTempA
	sbrs	SYSINTEGERTEMPA_H,7
	rjmp	ENDIF60
	mov	SysTemp3,SYSINTEGERTEMPA
	mov	SysTemp3_H,SYSINTEGERTEMPA_H
	com	SysTemp3
	com	SysTemp3_H
	inc	SysTemp3
	brne	PC + 2
	inc	SysTemp3_H
	mov	SYSINTEGERTEMPA,SysTemp3
	mov	SYSINTEGERTEMPA_H,SysTemp3_H
ENDIF60:
;if SysIntegerTempB.15 then SysIntegerTempB = -SysIntegerTempB
	sbrs	SYSINTEGERTEMPB_H,7
	rjmp	ENDIF61
	mov	SysTemp3,SYSINTEGERTEMPB
	mov	SysTemp3_H,SYSINTEGERTEMPB_H
	com	SysTemp3
	com	SysTemp3_H
	inc	SysTemp3
	brne	PC + 2
	inc	SysTemp3_H
	mov	SYSINTEGERTEMPB,SysTemp3
	mov	SYSINTEGERTEMPB_H,SysTemp3_H
ENDIF61:
;Call word multiply routine
;SysMultSub16
	rcall	SYSMULTSUB16
;Negate result if necessary
;if SysSignByte.7 then SysIntegerTempX = -SysIntegerTempX
	sbrs	SYSSIGNBYTE,7
	rjmp	ENDIF62
	mov	SysTemp3,SYSINTEGERTEMPX
	mov	SysTemp3_H,SYSINTEGERTEMPX_H
	com	SysTemp3
	com	SysTemp3_H
	inc	SysTemp3
	brne	PC + 2
	inc	SysTemp3_H
	mov	SYSINTEGERTEMPX,SysTemp3
	mov	SYSINTEGERTEMPX_H,SysTemp3_H
ENDIF62:
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

StringTable1:
.DB	16,71,76,67,68,80,114,105,110,116,32,83,116,114,105,110,103,0


StringTable2:
.DB	9,71,76,67,68,32,102,111,110,116


StringTable3:
.DB	8,115,105,122,101,32,61,32,51,0


StringTable4:
.DB	3,71,67,66


StringTable5:
.DB	8,118,48,46,57,56,46,48,53,0


StringTable6:
.DB	7,68,114,97,119,83,116,114


StringTable7:
.DB	11,76,111,110,103,32,78,117,109,98,101,114


StringTable8:
.DB	11,87,111,114,100,32,78,117,109,98,101,114


StringTable9:
.DB	11,66,121,116,101,32,78,117,109,98,101,114


StringTable10:
.DB	4,65,115,99,58,0


StringTable11:
.DB	14,73,76,73,57,51,52,49,32,68,114,105,118,101,114,0


StringTable12:
.DB	15,71,114,101,97,116,32,67,111,119,32,66,65,83,73,67


StringTable13:
.DB	8,77,97,114,32,50,48,49,57,0


StringTable14:
.DB	5,56,32,98,105,116


StringTable15:
.DB	5,76,111,110,103,58


StringTable16:
.DB	5,87,111,114,100,58


StringTable17:
.DB	5,66,121,116,101,58


StringTable18:
.DB	2,32,32,0


StringTable53:
.DB	1,32


StringTable81:
.DB	0,0


;********************************************************************************


