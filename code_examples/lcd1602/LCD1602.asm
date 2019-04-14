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
.EQU	CHARARRAY=273
.EQU	LCDBYTE=282
.EQU	LCDCHAR=283
.EQU	LCDCHARLOC=284
.EQU	LCDCOLUMN=285
.EQU	LCDCRSR=286
.EQU	LCDLINE=287
.EQU	LCDREADY=288
.EQU	LCDTEMP=289
.EQU	LCD_STATE=290
.EQU	PRINTLEN=291
.EQU	STRINGPOINTER=292
.EQU	SYSLCDCHARDATAHANDLER=293
.EQU	SYSLCDCHARDATAHANDLER_H=294
.EQU	SYSPRINTDATAHANDLER=295
.EQU	SYSPRINTDATAHANDLER_H=296
.EQU	SYSPRINTTEMP=297
.EQU	SYSREPEATTEMP1=298
.EQU	SYSREPEATTEMP2=299
.EQU	SYSSTRINGPARAM1=256

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
.DEF	SYSREADA=r30
.DEF	SYSREADA_H=r31
.DEF	SYSSTRINGA=r26
.DEF	SYSSTRINGA_H=r27
.DEF	SYSSTRINGB=r28
.DEF	SYSSTRINGB_H=r29
.DEF	SYSSTRINGLENGTH=r25
.DEF	SYSVALUECOPY=r21
.DEF	SYSWAITTEMP10US=r27
.DEF	SYSWAITTEMPMS=r29
.DEF	SYSWAITTEMPMS_H=r30
.DEF	SYSWAITTEMPS=r31
.DEF	SYSWAITTEMPUS=r27
.DEF	SYSWAITTEMPUS_H=r28
.DEF	SYSTEMP1=r1
.DEF	SYSTEMP2=r16
.DEF	SYSTEMP3=r2

;********************************************************************************

;Alias variables
#define	SYSCHARARRAY_1	274
#define	SYSCHARARRAY_2	275
#define	SYSCHARARRAY_3	276
#define	SYSCHARARRAY_4	277
#define	SYSCHARARRAY_5	278
#define	SYSCHARARRAY_6	279
#define	SYSCHARARRAY_7	280
#define	SYSCHARARRAY_8	281

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
	rcall	INITSYS
	rcall	INITUNO
	rcall	INITLCD

;Start of the main program
;''A demonstration program for GCGB and GCB
;''This program will test the LCD panel and the buttons of the LCD Keypad Shield.
;''Requires  LCD Keypad Shield attached to a Arduino UNO.
;''The LCD Keypad shield is developed for Arduino compatible boards, to provide a user-friendly interface that allows users to go through the menu, make selections etc.
;''It consists of a 1602 white character blue backlight LCD.
;''The keypad consists of 5 keys — select, up, right, down and left. To save the digital IO pins, the keypad interface uses only one ADC channel. The key value is read through a 5 stage voltage divider.
;''@author  EvanV
;''@licence GPL
;''@version 1.0a
;''@date    16 March 2015
;''********************************************************************************
;----- Configuration
;----- Constants
;Setup LCD Parameters
;#define LCD_IO 4
;#define LCD_NO_RW
;#define LCD_Speed fast
;#define LCD_RS         Digital_8
;#define LCD_Enable     Digital_9
;#define LCD_DB4        Digital_4
;#define LCD_DB5        Digital_5
;#define LCD_DB6        Digital_6
;#define LCD_DB7        Digital_7
;----- Main body of program commences here.
;Do Forever
SysDoLoop_S1:
;CLS
	rcall	lbCLS
;Wait 1 sec
	ldi	SysWaitTempS,1
	rcall	Delay_S
;PRINT "START TEST"
	ldi	SysStringB,low(SYSSTRINGPARAM1)
	ldi	SysStringB_H,high(SYSSTRINGPARAM1)
	ldi	SysReadA,low(StringTable1<<1)
	ldi	SysReadA_H,high(StringTable1<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler_H,SysValueCopy
	rcall	PRINT108
;wait 1 sec
	ldi	SysWaitTempS,1
	rcall	Delay_S
;locate 1,0
	ldi	SysValueCopy,1
	sts	LCDLINE,SysValueCopy
	ldi	SysValueCopy,0
	sts	LCDCOLUMN,SysValueCopy
	rcall	LOCATE
;PRINT "DISPLAY ON"
	ldi	SysStringB,low(SYSSTRINGPARAM1)
	ldi	SysStringB_H,high(SYSSTRINGPARAM1)
	ldi	SysReadA,low(StringTable2<<1)
	ldi	SysReadA_H,high(StringTable2<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler_H,SysValueCopy
	rcall	PRINT108
;Wait 1 sec
	ldi	SysWaitTempS,1
	rcall	Delay_S
;CLS
	rcall	lbCLS
;Locate 0,0
	ldi	SysValueCopy,0
	sts	LCDLINE,SysValueCopy
	ldi	SysValueCopy,0
	sts	LCDCOLUMN,SysValueCopy
	rcall	LOCATE
;Print "Cursor ON"
	ldi	SysStringB,low(SYSSTRINGPARAM1)
	ldi	SysStringB_H,high(SYSSTRINGPARAM1)
	ldi	SysReadA,low(StringTable3<<1)
	ldi	SysReadA_H,high(StringTable3<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler_H,SysValueCopy
	rcall	PRINT108
;Locate 1,0
	ldi	SysValueCopy,1
	sts	LCDLINE,SysValueCopy
	ldi	SysValueCopy,0
	sts	LCDCOLUMN,SysValueCopy
	rcall	LOCATE
;LCDcursor CursorOn
	ldi	SysValueCopy,10
	sts	LCDCRSR,SysValueCopy
	rcall	LCDCURSOR
;Wait 1 sec
	ldi	SysWaitTempS,1
	rcall	Delay_S
;CLS
	rcall	lbCLS
;LCDcursor CursorOFF
	ldi	SysValueCopy,13
	sts	LCDCRSR,SysValueCopy
	rcall	LCDCURSOR
;locate 0,0
	ldi	SysValueCopy,0
	sts	LCDLINE,SysValueCopy
	ldi	SysValueCopy,0
	sts	LCDCOLUMN,SysValueCopy
	rcall	LOCATE
;Print "Cursor OFF"
	ldi	SysStringB,low(SYSSTRINGPARAM1)
	ldi	SysStringB_H,high(SYSSTRINGPARAM1)
	ldi	SysReadA,low(StringTable4<<1)
	ldi	SysReadA_H,high(StringTable4<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler_H,SysValueCopy
	rcall	PRINT108
;Wait 1 sec
	ldi	SysWaitTempS,1
	rcall	Delay_S
;CLS
	rcall	lbCLS
;Locate 0,0
	ldi	SysValueCopy,0
	sts	LCDLINE,SysValueCopy
	ldi	SysValueCopy,0
	sts	LCDCOLUMN,SysValueCopy
	rcall	LOCATE
;Print "FLASH ON"
	ldi	SysStringB,low(SYSSTRINGPARAM1)
	ldi	SysStringB_H,high(SYSSTRINGPARAM1)
	ldi	SysReadA,low(StringTable5<<1)
	ldi	SysReadA_H,high(StringTable5<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler_H,SysValueCopy
	rcall	PRINT108
;Locate 1,0
	ldi	SysValueCopy,1
	sts	LCDLINE,SysValueCopy
	ldi	SysValueCopy,0
	sts	LCDCOLUMN,SysValueCopy
	rcall	LOCATE
;LCDcursor FLASHON
	ldi	SysValueCopy,9
	sts	LCDCRSR,SysValueCopy
	rcall	LCDCURSOR
;Wait 1 sec
	ldi	SysWaitTempS,1
	rcall	Delay_S
;CLS
	rcall	lbCLS
;locate 0,0
	ldi	SysValueCopy,0
	sts	LCDLINE,SysValueCopy
	ldi	SysValueCopy,0
	sts	LCDCOLUMN,SysValueCopy
	rcall	LOCATE
;Print "FLASH OFF"
	ldi	SysStringB,low(SYSSTRINGPARAM1)
	ldi	SysStringB_H,high(SYSSTRINGPARAM1)
	ldi	SysReadA,low(StringTable6<<1)
	ldi	SysReadA_H,high(StringTable6<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler_H,SysValueCopy
	rcall	PRINT108
;LCDCURSOR FLASHOFF
	ldi	SysValueCopy,14
	sts	LCDCRSR,SysValueCopy
	rcall	LCDCURSOR
;Wait 1 sec
	ldi	SysWaitTempS,1
	rcall	Delay_S
;Locate 0,0
	ldi	SysValueCopy,0
	sts	LCDLINE,SysValueCopy
	ldi	SysValueCopy,0
	sts	LCDCOLUMN,SysValueCopy
	rcall	LOCATE
;Print "CURSR & FLSH ON"
	ldi	SysStringB,low(SYSSTRINGPARAM1)
	ldi	SysStringB_H,high(SYSSTRINGPARAM1)
	ldi	SysReadA,low(StringTable7<<1)
	ldi	SysReadA_H,high(StringTable7<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler_H,SysValueCopy
	rcall	PRINT108
;locate 1,0
	ldi	SysValueCopy,1
	sts	LCDLINE,SysValueCopy
	ldi	SysValueCopy,0
	sts	LCDCOLUMN,SysValueCopy
	rcall	LOCATE
;LCDCURSOR CURSORON
	ldi	SysValueCopy,10
	sts	LCDCRSR,SysValueCopy
	rcall	LCDCURSOR
;LCDCURSOR FLASHON
	ldi	SysValueCopy,9
	sts	LCDCRSR,SysValueCopy
	rcall	LCDCURSOR
;Wait 1 sec
	ldi	SysWaitTempS,1
	rcall	Delay_S
;Locate 0,0
	ldi	SysValueCopy,0
	sts	LCDLINE,SysValueCopy
	ldi	SysValueCopy,0
	sts	LCDCOLUMN,SysValueCopy
	rcall	LOCATE
;Print "CURSR & FLSH OFF"
	ldi	SysStringB,low(SYSSTRINGPARAM1)
	ldi	SysStringB_H,high(SYSSTRINGPARAM1)
	ldi	SysReadA,low(StringTable8<<1)
	ldi	SysReadA_H,high(StringTable8<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler_H,SysValueCopy
	rcall	PRINT108
;locate 1,0
	ldi	SysValueCopy,1
	sts	LCDLINE,SysValueCopy
	ldi	SysValueCopy,0
	sts	LCDCOLUMN,SysValueCopy
	rcall	LOCATE
;LCDCURSOR CursorOFF
	ldi	SysValueCopy,13
	sts	LCDCRSR,SysValueCopy
	rcall	LCDCURSOR
;LCDCURSOR FLASHOFF
	ldi	SysValueCopy,14
	sts	LCDCRSR,SysValueCopy
	rcall	LCDCURSOR
;Wait 1 sec
	ldi	SysWaitTempS,1
	rcall	Delay_S
;CLS
	rcall	lbCLS
;Locate 0,4
	ldi	SysValueCopy,0
	sts	LCDLINE,SysValueCopy
	ldi	SysValueCopy,4
	sts	LCDCOLUMN,SysValueCopy
	rcall	LOCATE
;PRINT "Flashing"
	ldi	SysStringB,low(SYSSTRINGPARAM1)
	ldi	SysStringB_H,high(SYSSTRINGPARAM1)
	ldi	SysReadA,low(StringTable9<<1)
	ldi	SysReadA_H,high(StringTable9<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler_H,SysValueCopy
	rcall	PRINT108
;Locate 1,4
	ldi	SysValueCopy,1
	sts	LCDLINE,SysValueCopy
	ldi	SysValueCopy,4
	sts	LCDCOLUMN,SysValueCopy
	rcall	LOCATE
;Print "Display"
	ldi	SysStringB,low(SYSSTRINGPARAM1)
	ldi	SysStringB_H,high(SYSSTRINGPARAM1)
	ldi	SysReadA,low(StringTable10<<1)
	ldi	SysReadA_H,high(StringTable10<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler_H,SysValueCopy
	rcall	PRINT108
;wait 500 ms
	ldi	SysWaitTempMS,244
	ldi	SysWaitTempMS_H,1
	rcall	Delay_MS
;repeat 10
	ldi	SysValueCopy,10
	sts	SysRepeatTemp1,SysValueCopy
SysRepeatLoop1:
;LCDCURSOR LCDOFF
	ldi	SysValueCopy,11
	sts	LCDCRSR,SysValueCopy
	rcall	LCDCURSOR
;wait 100 ms
	ldi	SysWaitTempMS,100
	ldi	SysWaitTempMS_H,0
	rcall	Delay_MS
;LCDCURSOR LCDON
	ldi	SysValueCopy,12
	sts	LCDCRSR,SysValueCopy
	rcall	LCDCURSOR
;wait 100 ms
	ldi	SysWaitTempMS,100
	ldi	SysWaitTempMS_H,0
	rcall	Delay_MS
;end repeat
	lds	SysTemp1,SysRepeatTemp1
	dec	SysTemp1
	sts	SysRepeatTemp1,SysTemp1
	brne	SysRepeatLoop1
SysRepeatLoopEnd1:
;CLS
	rcall	lbCLS
;Locate 0,0
	ldi	SysValueCopy,0
	sts	LCDLINE,SysValueCopy
	ldi	SysValueCopy,0
	sts	LCDCOLUMN,SysValueCopy
	rcall	LOCATE
;Print "DISPLAY OFF"
	ldi	SysStringB,low(SYSSTRINGPARAM1)
	ldi	SysStringB_H,high(SYSSTRINGPARAM1)
	ldi	SysReadA,low(StringTable11<<1)
	ldi	SysReadA_H,high(StringTable11<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler_H,SysValueCopy
	rcall	PRINT108
;Locate 1,0
	ldi	SysValueCopy,1
	sts	LCDLINE,SysValueCopy
	ldi	SysValueCopy,0
	sts	LCDCOLUMN,SysValueCopy
	rcall	LOCATE
;Print "FOR 2 SEC"
	ldi	SysStringB,low(SYSSTRINGPARAM1)
	ldi	SysStringB_H,high(SYSSTRINGPARAM1)
	ldi	SysReadA,low(StringTable12<<1)
	ldi	SysReadA_H,high(StringTable12<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler_H,SysValueCopy
	rcall	PRINT108
;Wait 1 SEC
	ldi	SysWaitTempS,1
	rcall	Delay_S
;LCDCURSOR LCDOFF
	ldi	SysValueCopy,11
	sts	LCDCRSR,SysValueCopy
	rcall	LCDCURSOR
;WAIT 2 s
	ldi	SysWaitTempS,2
	rcall	Delay_S
;CLS
	rcall	lbCLS
;Locate 0,0
	ldi	SysValueCopy,0
	sts	LCDLINE,SysValueCopy
	ldi	SysValueCopy,0
	sts	LCDCOLUMN,SysValueCopy
	rcall	LOCATE
;LCDCURSOR LCDON
	ldi	SysValueCopy,12
	sts	LCDCRSR,SysValueCopy
	rcall	LCDCURSOR
;Create an array to store the character until it is copied
;Dim CharArray(8)
;Set the array to hold the character
;Binary has been used to improve the readability of the code, but is not essential
;CharArray(1) = b'00011011'
	ldi	SysValueCopy,27
	sts	SYSCHARARRAY_1,SysValueCopy
;CharArray(2) = b'00011011'
	ldi	SysValueCopy,27
	sts	SYSCHARARRAY_2,SysValueCopy
;CharArray(3) = b'00000000'
	ldi	SysValueCopy,0
	sts	SYSCHARARRAY_3,SysValueCopy
;CharArray(4) = b'00000100'
	ldi	SysValueCopy,4
	sts	SYSCHARARRAY_4,SysValueCopy
;CharArray(5) = b'00000000'
	ldi	SysValueCopy,0
	sts	SYSCHARARRAY_5,SysValueCopy
;CharArray(6) = b'00010001'
	ldi	SysValueCopy,17
	sts	SYSCHARARRAY_6,SysValueCopy
;CharArray(7) = b'00010001'
	ldi	SysValueCopy,17
	sts	SYSCHARARRAY_7,SysValueCopy
;CharArray(8) = b'00001110'
	ldi	SysValueCopy,14
	sts	SYSCHARARRAY_8,SysValueCopy
;CLS
	rcall	lbCLS
;Copy the character from the array to the LCD
;LCDCreateChar 0, CharArray()
	ldi	SysValueCopy,0
	sts	LCDCHARLOC,SysValueCopy
	ldi	SysValueCopy,low(CHARARRAY)
	sts	SysLCDCHARDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(CHARARRAY)
	sts	SysLCDCHARDATAHandler_H,SysValueCopy
	rcall	LCDCREATECHAR
;Draw the custom character
;LCDWriteChar 0
	ldi	SysValueCopy,0
	sts	LCDCHAR,SysValueCopy
	rcall	LCDWRITECHAR
;Wait 1 sec
	ldi	SysWaitTempS,1
	rcall	Delay_S
;Locate 1,0
	ldi	SysValueCopy,1
	sts	LCDLINE,SysValueCopy
	ldi	SysValueCopy,0
	sts	LCDCOLUMN,SysValueCopy
	rcall	LOCATE
;Print "END TEST"
	ldi	SysStringB,low(SYSSTRINGPARAM1)
	ldi	SysStringB_H,high(SYSSTRINGPARAM1)
	ldi	SysReadA,low(StringTable13<<1)
	ldi	SysReadA_H,high(StringTable13<<1)
	rcall	SysReadString
	ldi	SysValueCopy,low(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler,SysValueCopy
	ldi	SysValueCopy,high(SYSSTRINGPARAM1)
	sts	SysPRINTDATAHandler_H,SysValueCopy
	rcall	PRINT108
;Wait 1 sec
	ldi	SysWaitTempS,1
	rcall	Delay_S
;loop
	rjmp	SysDoLoop_S1
SysDoLoop_E1:
BASPROGRAMEND:
	sleep
	rjmp	BASPROGRAMEND

;********************************************************************************

lbCLS:
;SET LCD_RS OFF
	cbi	PORTB,0
;Clear screen
;LCDWriteByte (0b00000001)
	ldi	SysValueCopy,1
	sts	LCDBYTE,SysValueCopy
	rcall	LCDNORMALWRITEBYTE
;Wait 4 ms
	ldi	SysWaitTempMS,4
	ldi	SysWaitTempMS_H,0
	rcall	Delay_MS
;Move to start of visible DDRAM
;LCDWriteByte(0x80)
	ldi	SysValueCopy,128
	sts	LCDBYTE,SysValueCopy
	rcall	LCDNORMALWRITEBYTE
;Wait 12 10us
	ldi	SysWaitTemp10US,12
	rjmp	Delay_10US

;********************************************************************************

Delay_10US:
D10US_START:
	ldi	DELAYTEMP,52
DelayUS1:
	dec	DELAYTEMP
	brne	DelayUS1
	nop
	dec	SysWaitTemp10US
	brne	D10US_START
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

INITLCD:
;Initialization routines based upon code examples in HD44780 datasheet
;Configure RS,Enable & RW pin directions
;DIR LCD_RS OUT
	sbi	DDRB,0
;DIR LCD_Enable OUT
	sbi	DDRB,1
;wait 10 ms
	ldi	SysWaitTempMS,10
	ldi	SysWaitTempMS_H,0
	rcall	Delay_MS
;Wait until LCDReady
SysWaitLoop1:
	rcall	FN_LCDREADY
	lds	SysTemp1,LCDREADY
	tst	SysTemp1
	breq	SysWaitLoop1
;SET LCD_RS OFF
	cbi	PORTB,0
;4-bit initialization routine
;Set pins to output
;DIR LCD_DB4 OUT
	sbi	DDRD,4
;DIR LCD_DB5 OUT
	sbi	DDRD,5
;DIR LCD_DB6 OUT
	sbi	DDRD,6
;DIR LCD_DB7 OUT
	sbi	DDRD,7
;wait 15 ms
	ldi	SysWaitTempMS,15
	ldi	SysWaitTempMS_H,0
	rcall	Delay_MS
;Wakeup 0x30
;set LCD_DB4 ON
	sbi	PORTD,4
;set LCD_DB5 ON
	sbi	PORTD,5
;set LCD_DB6 OFF
	cbi	PORTD,6
;set LCD_DB7 OFF
	cbi	PORTD,7
;wait 2 us
	ldi	DELAYTEMP,10
DelayUS2:
	dec	DELAYTEMP
	brne	DelayUS2
	rjmp	PC + 1
;PULSEOUT LCD_Enable, 2 us
;Set Pin On
	sbi	PORTB,1
;Wait Time
	ldi	DELAYTEMP,10
DelayUS3:
	dec	DELAYTEMP
	brne	DelayUS3
	rjmp	PC + 1
;Set Pin Off
	cbi	PORTB,1
;wait 5 ms
	ldi	SysWaitTempMS,5
	ldi	SysWaitTempMS_H,0
	rcall	Delay_MS
;Repeat 3   'three more times
	ldi	SysValueCopy,3
	sts	SysRepeatTemp2,SysValueCopy
SysRepeatLoop2:
;PULSEOUT LCD_Enable, 2 us
;Set Pin On
	sbi	PORTB,1
;Wait Time
	ldi	DELAYTEMP,10
DelayUS4:
	dec	DELAYTEMP
	brne	DelayUS4
	rjmp	PC + 1
;Set Pin Off
	cbi	PORTB,1
;Wait 200 us
	ldi	DELAYTEMP2,4
DelayUSO5:
	ldi	DELAYTEMP,0
DelayUS5:
	dec	DELAYTEMP
	brne	DelayUS5
	dec	DELAYTEMP2
	brne	DelayUSO5
	ldi	DELAYTEMP,38
DelayUS6:
	dec	DELAYTEMP
	brne	DelayUS6
	rjmp	PC + 1
;end repeat
	lds	SysTemp3,SysRepeatTemp2
	dec	SysTemp3
	sts	SysRepeatTemp2,SysTemp3
	brne	SysRepeatLoop2
SysRepeatLoopEnd2:
;Wait 5 ms
	ldi	SysWaitTempMS,5
	ldi	SysWaitTempMS_H,0
	rcall	Delay_MS
;Set 4 bit mode    (0x20)
;set LCD_DB4 OFF
	cbi	PORTD,4
;set LCD_DB5 ON
	sbi	PORTD,5
;set LCD_DB6 OFF
	cbi	PORTD,6
;set LCD_DB7 OFF
	cbi	PORTD,7
;wait 2 us
	ldi	DELAYTEMP,10
DelayUS7:
	dec	DELAYTEMP
	brne	DelayUS7
	rjmp	PC + 1
;PULSEOUT LCD_Enable, 2 us
;Set Pin On
	sbi	PORTB,1
;Wait Time
	ldi	DELAYTEMP,10
DelayUS8:
	dec	DELAYTEMP
	brne	DelayUS8
	rjmp	PC + 1
;Set Pin Off
	cbi	PORTB,1
;Wait 50 us
	ldi	DELAYTEMP2,1
DelayUSO9:
	ldi	DELAYTEMP,0
DelayUS9:
	dec	DELAYTEMP
	brne	DelayUS9
	dec	DELAYTEMP2
	brne	DelayUSO9
	ldi	DELAYTEMP,9
DelayUS10:
	dec	DELAYTEMP
	brne	DelayUS10
	rjmp	PC + 1
;init 4 bit mode
;LCDWriteByte 0x28    '(b'011000000') 0x28  set 2 line mode
	ldi	SysValueCopy,40
	sts	LCDBYTE,SysValueCopy
	rcall	LCDNORMALWRITEBYTE
;LCDWriteByte 0x06    '(b'00000110')  'Set Cursor movement
	ldi	SysValueCopy,6
	sts	LCDBYTE,SysValueCopy
	rcall	LCDNORMALWRITEBYTE
;LCDWriteByte 0x0C    '(b'00001100')  'Turn off cursor
	ldi	SysValueCopy,12
	sts	LCDBYTE,SysValueCopy
	rcall	LCDNORMALWRITEBYTE
;CLS  'Clear the display
	rcall	lbCLS
;LCD_State = 12
	ldi	SysValueCopy,12
	sts	LCD_STATE,SysValueCopy
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

LCDCREATECHAR:
;Store old location
;Select location
;Set LCD_RS Off
	cbi	PORTB,0
;LCDWriteByte (64 + LCDCharLoc * 8)
	lds	SysBYTETempA,LCDCHARLOC
	ldi	SysBYTETempB,8
	mul	SysByteTempA,SysByteTempB
	mov	SysTemp1,SysByteTempX
	ldi	SysTemp2,64
	add	SysTemp1,SysTemp2
	sts	LCDBYTE,SysTemp1
	rcall	LCDNORMALWRITEBYTE
;wait 5 10us
	ldi	SysWaitTemp10US,5
	rcall	Delay_10US
;Write char
;Set LCD_RS On
	sbi	PORTB,0
;For LCDTemp = 1 to 8
	ldi	SysValueCopy,0
	sts	LCDTEMP,SysValueCopy
SysForLoop2:
	lds	SysTemp1,LCDTEMP
	inc	SysTemp1
	sts	LCDTEMP,SysTemp1
;LCDWriteByte LCDCharData(LCDTemp)
	lds	SysTemp1,SysLCDCHARDATAHandler
	lds	SysTemp3,LCDTEMP
	add	SysTemp1,SysTemp3
	mov	SysStringA,SysTemp1
	lds	SysTemp1,SysLCDCHARDATAHandler_H
	ldi	SysTemp2,0
	adc	SysTemp1,SysTemp2
	mov	SysStringA_H,SysTemp1
	ld	SysValueCopy,X
	sts	LCDBYTE,SysValueCopy
	rcall	LCDNORMALWRITEBYTE
;wait 5 10us
	ldi	SysWaitTemp10US,5
	rcall	Delay_10US
;Next
	lds	SysCalcTempA,LCDTEMP
	cpi	SysCalcTempA,8
	brlo	SysForLoop2
SysForLoopEnd2:
;Restore location
;set LCD_RS off
	cbi	PORTB,0
;LCDWriteByte(0x80)
	ldi	SysValueCopy,128
	sts	LCDBYTE,SysValueCopy
	rcall	LCDNORMALWRITEBYTE
;wait 5 10us
	ldi	SysWaitTemp10US,5
	rjmp	Delay_10US

;********************************************************************************

LCDCURSOR:
;Method uses LCDON, LCDOFF, CURSORON, CURSOROFF, FLASHON, Or FLASHOFF
;1) FLASH is the same as FLASHON and has been retained
;for compatibility but should be considererd depricated.
;
;2) ON & OFF Have been superceded with LCDON & LCDOFF for clarity.
;However they Will still work as usual. This was done
;because LCDCURSOR(OFF | ON) was confusing and implied
;control of the cursor instead of the entire display.
;
;3) With this revision, changing one setting does not change the others.
;eg.  FlashOFF does turn off the cursor and CURSOROFF does not
;turn off Flash. Cursor and flash states are not changed when the
;display is turned OFF or ON with LCDCURSOR LCDON OR LCDCURSOR LCDOFF.
;
;4) See Help For New Commands  LCD_OFF and LCD_ON
;LCD_ON & LCD OFF are separate Subs that when called
;will also turn off the cursor and flash if they are on
;-------------------------------------------------------------------
;Set LCD_RS OFF
	cbi	PORTB,0
;If LCDCRSR = ON  Then LCDTemp = LCD_State OR LCDON
	lds	SysCalcTempA,LCDCRSR
	cpi	SysCalcTempA,1
	brne	ENDIF16
	ldi	SysTemp2,12
	lds	SysTemp1,LCD_STATE
	or	SysTemp1,SysTemp2
	sts	LCDTEMP,SysTemp1
ENDIF16:
;IF LCDCRSR = LCDON Then LCDTemp = LCD_State OR LCDON
	lds	SysCalcTempA,LCDCRSR
	cpi	SysCalcTempA,12
	brne	ENDIF17
	ldi	SysTemp2,12
	lds	SysTemp1,LCD_STATE
	or	SysTemp1,SysTemp2
	sts	LCDTEMP,SysTemp1
ENDIF17:
;If LCDCRSR = OFF Then LCDTemp = LCD_State AND LCDOFF
	lds	SysCalcTempA,LCDCRSR
	tst	SysCalcTempA
	brne	ENDIF18
	ldi	SysTemp2,11
	lds	SysTemp1,LCD_STATE
	and	SysTemp1,SysTemp2
	sts	LCDTEMP,SysTemp1
ENDIF18:
;If LCDCRSR = LCDOFF Then LCDTemp = LCD_State AND LCDOFF
	lds	SysCalcTempA,LCDCRSR
	cpi	SysCalcTempA,11
	brne	ENDIF19
	ldi	SysTemp2,11
	lds	SysTemp1,LCD_STATE
	and	SysTemp1,SysTemp2
	sts	LCDTEMP,SysTemp1
ENDIF19:
;If LCDCRSR = CursorOn Then LCDTemp = LCD_State OR CursorON
	lds	SysCalcTempA,LCDCRSR
	cpi	SysCalcTempA,10
	brne	ENDIF20
	ldi	SysTemp2,10
	lds	SysTemp1,LCD_STATE
	or	SysTemp1,SysTemp2
	sts	LCDTEMP,SysTemp1
ENDIF20:
;If LCDCRSR = CursorOFF then LCDTemp = LCD_State and CursorOFF
	lds	SysCalcTempA,LCDCRSR
	cpi	SysCalcTempA,13
	brne	ENDIF21
	ldi	SysTemp2,13
	lds	SysTemp1,LCD_STATE
	and	SysTemp1,SysTemp2
	sts	LCDTEMP,SysTemp1
ENDIF21:
;If LCDCRSR = FLASH  Then LCDTemp = LCD_State OR FLASHON
	lds	SysCalcTempA,LCDCRSR
	cpi	SysCalcTempA,9
	brne	ENDIF22
	ldi	SysTemp2,9
	lds	SysTemp1,LCD_STATE
	or	SysTemp1,SysTemp2
	sts	LCDTEMP,SysTemp1
ENDIF22:
;If LCDCRSR = FLASHON  Then LCDTemp = LCD_State OR FLASHON
	lds	SysCalcTempA,LCDCRSR
	cpi	SysCalcTempA,9
	brne	ENDIF23
	ldi	SysTemp2,9
	lds	SysTemp1,LCD_STATE
	or	SysTemp1,SysTemp2
	sts	LCDTEMP,SysTemp1
ENDIF23:
;If LCDCRSR = FLASHOFF then LCDTemp = LCD_State and FLASHOFF
	lds	SysCalcTempA,LCDCRSR
	cpi	SysCalcTempA,14
	brne	ENDIF24
	ldi	SysTemp2,14
	lds	SysTemp1,LCD_STATE
	and	SysTemp1,SysTemp2
	sts	LCDTEMP,SysTemp1
ENDIF24:
;LCDWriteByte(LCDTemp)
	lds	SysValueCopy,LCDTEMP
	sts	LCDBYTE,SysValueCopy
	rcall	LCDNORMALWRITEBYTE
;LCD_State = LCDtemp  'save last state
	lds	SysValueCopy,LCDTEMP
	sts	LCD_STATE,SysValueCopy
	ret

;********************************************************************************

LCDNORMALWRITEBYTE:
;Set pins to output
;DIR LCD_DB4 OUT
	sbi	DDRD,4
;DIR LCD_DB5 OUT
	sbi	DDRD,5
;DIR LCD_DB6 OUT
	sbi	DDRD,6
;DIR LCD_DB7 OUT
	sbi	DDRD,7
;Write upper nibble to output pins
;set LCD_DB4 OFF
	cbi	PORTD,4
;set LCD_DB5 OFF
	cbi	PORTD,5
;set LCD_DB6 OFF
	cbi	PORTD,6
;set LCD_DB7 OFF
	cbi	PORTD,7
;if LCDByte.7 ON THEN SET LCD_DB7 ON
	lds	SysBitTest,LCDBYTE
	sbrc	SysBitTest,7
	sbi	PORTD,7
ENDIF5:
;if LCDByte.6 ON THEN SET LCD_DB6 ON
	lds	SysBitTest,LCDBYTE
	sbrc	SysBitTest,6
	sbi	PORTD,6
ENDIF6:
;if LCDByte.5 ON THEN SET LCD_DB5 ON
	lds	SysBitTest,LCDBYTE
	sbrc	SysBitTest,5
	sbi	PORTD,5
ENDIF7:
;if LCDByte.4 ON THEN SET LCD_DB4 ON
	lds	SysBitTest,LCDBYTE
	sbrc	SysBitTest,4
	sbi	PORTD,4
ENDIF8:
;wait 1 us
	ldi	DELAYTEMP,5
DelayUS11:
	dec	DELAYTEMP
	brne	DelayUS11
	nop
;pulseout LCD_enable, 2 us
;Set Pin On
	sbi	PORTB,1
;Wait Time
	ldi	DELAYTEMP,10
DelayUS12:
	dec	DELAYTEMP
	brne	DelayUS12
	rjmp	PC + 1
;Set Pin Off
	cbi	PORTB,1
;Wait 2 us
	ldi	DELAYTEMP,10
DelayUS13:
	dec	DELAYTEMP
	brne	DelayUS13
	rjmp	PC + 1
;All data pins low
;set LCD_DB4 OFF
	cbi	PORTD,4
;set LCD_DB5 OFF
	cbi	PORTD,5
;set LCD_DB6 OFF
	cbi	PORTD,6
;set LCD_DB7 OFF
	cbi	PORTD,7
;Write lower nibble to output pins
;if LCDByte.3 ON THEN SET LCD_DB7 ON
	lds	SysBitTest,LCDBYTE
	sbrc	SysBitTest,3
	sbi	PORTD,7
ENDIF9:
;if LCDByte.2 ON THEN SET LCD_DB6 ON
	lds	SysBitTest,LCDBYTE
	sbrc	SysBitTest,2
	sbi	PORTD,6
ENDIF10:
;if LCDByte.1 ON THEN SET LCD_DB5 ON
	lds	SysBitTest,LCDBYTE
	sbrc	SysBitTest,1
	sbi	PORTD,5
ENDIF11:
;if LCDByte.0 ON THEN SET LCD_DB4 ON
	lds	SysBitTest,LCDBYTE
	sbrc	SysBitTest,0
	sbi	PORTD,4
ENDIF12:
;wait 1 us
	ldi	DELAYTEMP,5
DelayUS14:
	dec	DELAYTEMP
	brne	DelayUS14
	nop
;pulseout LCD_enable, 2 us
;Set Pin On
	sbi	PORTB,1
;Wait Time
	ldi	DELAYTEMP,10
DelayUS15:
	dec	DELAYTEMP
	brne	DelayUS15
	rjmp	PC + 1
;Set Pin Off
	cbi	PORTB,1
;wait 2 us
	ldi	DELAYTEMP,10
DelayUS16:
	dec	DELAYTEMP
	brne	DelayUS16
	rjmp	PC + 1
;Set data pins low again
;SET LCD_DB7 OFF
	cbi	PORTD,7
;SET LCD_DB6 OFF
	cbi	PORTD,6
;SET LCD_DB5 OFF
	cbi	PORTD,5
;SET LCD_DB4 OFF
	cbi	PORTD,4
;character delay settings
;wait fast_us  us
	ldi	DELAYTEMP,170
DelayUS17:
	dec	DELAYTEMP
	brne	DelayUS17
	rjmp	PC + 1
;If Register Select is low.  14.02.19
;IF LCD_RS = 0 then
	sbic	PINB,0
	rjmp	ENDIF13
;IF LCDByte < 16 then
	lds	SysCalcTempA,LCDBYTE
	cpi	SysCalcTempA,16
	brsh	ENDIF14
;if LCDByte > 7 then
	ldi	SysCalcTempA,7
	lds	SysCalcTempB,LCDBYTE
	cp	SysCalcTempA,SysCalcTempB
	brsh	ENDIF15
;LCD_State = LCDByte
	lds	SysValueCopy,LCDBYTE
	sts	LCD_STATE,SysValueCopy
;end if
ENDIF15:
;END IF
ENDIF14:
;END IF
ENDIF13:
	ret

;********************************************************************************

FN_LCDREADY:
;Wait 10 ms
	ldi	SysWaitTempMS,10
	ldi	SysWaitTempMS_H,0
	rcall	Delay_MS
;LCDReady = TRUE
	ldi	SysValueCopy,255
	sts	LCDREADY,SysValueCopy
;exit function
	ret
	ret

;********************************************************************************

LCDWRITECHAR:
;set LCD_RS on
	sbi	PORTB,0
;LCDWriteByte(LCDChar)
	lds	SysValueCopy,LCDCHAR
	sts	LCDBYTE,SysValueCopy
	rcall	LCDNORMALWRITEBYTE
;wait 5 10us
	ret

;********************************************************************************

LOCATE:
;Set LCD_RS Off
	cbi	PORTB,0
;If LCDLine > 1 Then
	ldi	SysCalcTempA,1
	lds	SysCalcTempB,LCDLINE
	cp	SysCalcTempA,SysCalcTempB
	brsh	ENDIF1
;LCDLine = LCDLine - 2
	lds	SysTemp1,LCDLINE
	ldi	SysTemp2,2
	sub	SysTemp1,SysTemp2
	sts	LCDLINE,SysTemp1
;LCDColumn = LCDColumn + LCD_WIDTH
	lds	SysTemp1,LCDCOLUMN
	ldi	SysTemp2,20
	add	SysTemp1,SysTemp2
	sts	LCDCOLUMN,SysTemp1
;End If
ENDIF1:
;LCDWriteByte(0x80 or 0x40 * LCDLine + LCDColumn)
	lds	SysBYTETempA,LCDLINE
	ldi	SysBYTETempB,64
	mul	SysByteTempA,SysByteTempB
	mov	SysTemp2,SysByteTempX
	lds	SysTemp3,LCDCOLUMN
	add	SysTemp2,SysTemp3
	mov	SysTemp1,SysTemp2
	ldi	SysTemp2,128
	or	SysTemp1,SysTemp2
	sts	LCDBYTE,SysTemp1
	rcall	LCDNORMALWRITEBYTE
;wait 5 10us 'test
	ldi	SysWaitTemp10US,5
	rjmp	Delay_10US

;********************************************************************************

;Overloaded signature: STRING:
PRINT108:
;PrintLen = LEN(PrintData$)
;PrintLen = PrintData(0)
	lds	SysStringA,SysPRINTDATAHandler
	lds	SysStringA_H,SysPRINTDATAHandler_H
	ld	SysValueCopy,X
	sts	PRINTLEN,SysValueCopy
;If PrintLen = 0 Then Exit Sub
	lds	SysCalcTempA,PRINTLEN
	tst	SysCalcTempA
	brne	ENDIF2
	ret
ENDIF2:
;Set LCD_RS On
	sbi	PORTB,0
;Write Data
;For SysPrintTemp = 1 To PrintLen
	ldi	SysValueCopy,0
	sts	SYSPRINTTEMP,SysValueCopy
	lds	SysCalcTempA,PRINTLEN
	cpi	SysCalcTempA,1
	brlo	SysForLoopEnd1
SysForLoop1:
	lds	SysTemp1,SYSPRINTTEMP
	inc	SysTemp1
	sts	SYSPRINTTEMP,SysTemp1
;LCDWriteByte PrintData(SysPrintTemp)
	lds	SysTemp1,SysPRINTDATAHandler
	lds	SysTemp3,SYSPRINTTEMP
	add	SysTemp1,SysTemp3
	mov	SysStringA,SysTemp1
	lds	SysTemp1,SysPRINTDATAHandler_H
	ldi	SysTemp2,0
	adc	SysTemp1,SysTemp2
	mov	SysStringA_H,SysTemp1
	ld	SysValueCopy,X
	sts	LCDBYTE,SysValueCopy
	rcall	LCDNORMALWRITEBYTE
;Next
	lds	SysCalcTempA,SYSPRINTTEMP
	lds	SysCalcTempB,PRINTLEN
	cp	SysCalcTempA,SysCalcTempB
	brlo	SysForLoop1
SysForLoopEnd1:
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
.DB	10,83,84,65,82,84,32,84,69,83,84,0


StringTable2:
.DB	10,68,73,83,80,76,65,89,32,79,78,0


StringTable3:
.DB	9,67,117,114,115,111,114,32,79,78


StringTable4:
.DB	10,67,117,114,115,111,114,32,79,70,70,0


StringTable5:
.DB	8,70,76,65,83,72,32,79,78,0


StringTable6:
.DB	9,70,76,65,83,72,32,79,70,70


StringTable7:
.DB	15,67,85,82,83,82,32,38,32,70,76,83,72,32,79,78


StringTable8:
.DB	16,67,85,82,83,82,32,38,32,70,76,83,72,32,79,70,70,0


StringTable9:
.DB	8,70,108,97,115,104,105,110,103,0


StringTable10:
.DB	7,68,105,115,112,108,97,121


StringTable11:
.DB	11,68,73,83,80,76,65,89,32,79,70,70


StringTable12:
.DB	9,70,79,82,32,50,32,83,69,67


StringTable13:
.DB	8,69,78,68,32,84,69,83,84,0


;********************************************************************************


