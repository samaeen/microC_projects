
_main:

;jhamela lcd.c,20 :: 		void main() {
;jhamela lcd.c,21 :: 		TRISC7_bit= 0;
	BCF        TRISC7_bit+0, BitPos(TRISC7_bit+0)
;jhamela lcd.c,22 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;jhamela lcd.c,23 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;jhamela lcd.c,24 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;jhamela lcd.c,26 :: 		while(1)
L_main0:
;jhamela lcd.c,28 :: 		ref=190;
	MOVLW      190
	MOVWF      _ref+0
	CLRF       _ref+1
;jhamela lcd.c,30 :: 		ADC_Init();
	CALL       _ADC_Init+0
;jhamela lcd.c,31 :: 		afirst = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _afirst+0
	MOVF       R0+1, 0
	MOVWF      _afirst+1
;jhamela lcd.c,32 :: 		asecond = ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _asecond+0
	MOVF       R0+1, 0
	MOVWF      _asecond+1
;jhamela lcd.c,33 :: 		tempa=ADC_Read(2);
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       R0+0, 0
	MOVWF      _tempa+0
	MOVF       R0+1, 0
	MOVWF      _tempa+1
	MOVF       R0+2, 0
	MOVWF      _tempa+2
	MOVF       R0+3, 0
	MOVWF      _tempa+3
;jhamela lcd.c,34 :: 		temp= tempa*1.960784;
	MOVLW      248
	MOVWF      R4+0
	MOVLW      250
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      127
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _temp+0
	MOVF       R0+1, 0
	MOVWF      _temp+1
	MOVF       R0+2, 0
	MOVWF      _temp+2
	MOVF       R0+3, 0
	MOVWF      _temp+3
;jhamela lcd.c,40 :: 		if(afirst>ref && asecond>ref){
	MOVLW      128
	XORWF      _ref+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _afirst+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main31
	MOVF       _afirst+0, 0
	SUBWF      _ref+0, 0
L__main31:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
	MOVLW      128
	XORWF      _ref+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _asecond+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main32
	MOVF       _asecond+0, 0
	SUBWF      _ref+0, 0
L__main32:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
L__main29:
;jhamela lcd.c,42 :: 		count=count;
;jhamela lcd.c,43 :: 		IntToStr(count,x);
	MOVF       _count+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _count+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _x+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;jhamela lcd.c,44 :: 		Lcd_Out(2,6,x);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _x+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;jhamela lcd.c,46 :: 		}
L_main4:
;jhamela lcd.c,47 :: 		if(afirst<ref && asecond>ref){
	MOVLW      128
	XORWF      _afirst+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _ref+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main33
	MOVF       _ref+0, 0
	SUBWF      _afirst+0, 0
L__main33:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
	MOVLW      128
	XORWF      _ref+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _asecond+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main34
	MOVF       _asecond+0, 0
	SUBWF      _ref+0, 0
L__main34:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
L__main28:
;jhamela lcd.c,48 :: 		while(afirst<ref){
L_main8:
	MOVLW      128
	XORWF      _afirst+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _ref+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main35
	MOVF       _ref+0, 0
	SUBWF      _afirst+0, 0
L__main35:
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;jhamela lcd.c,49 :: 		afirst=ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _afirst+0
	MOVF       R0+1, 0
	MOVWF      _afirst+1
;jhamela lcd.c,51 :: 		}
	GOTO       L_main8
L_main9:
;jhamela lcd.c,52 :: 		while(asecond>ref){
L_main10:
	MOVLW      128
	XORWF      _ref+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _asecond+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main36
	MOVF       _asecond+0, 0
	SUBWF      _ref+0, 0
L__main36:
	BTFSC      STATUS+0, 0
	GOTO       L_main11
;jhamela lcd.c,53 :: 		asecond=ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _asecond+0
	MOVF       R0+1, 0
	MOVWF      _asecond+1
;jhamela lcd.c,55 :: 		}
	GOTO       L_main10
L_main11:
;jhamela lcd.c,56 :: 		while(asecond<ref){
L_main12:
	MOVLW      128
	XORWF      _asecond+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _ref+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main37
	MOVF       _ref+0, 0
	SUBWF      _asecond+0, 0
L__main37:
	BTFSC      STATUS+0, 0
	GOTO       L_main13
;jhamela lcd.c,57 :: 		asecond=ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _asecond+0
	MOVF       R0+1, 0
	MOVWF      _asecond+1
;jhamela lcd.c,59 :: 		}
	GOTO       L_main12
L_main13:
;jhamela lcd.c,61 :: 		if(temp>20){        Lcd_Out(1,6,"Lights On!!");
	MOVF       _temp+0, 0
	MOVWF      R4+0
	MOVF       _temp+1, 0
	MOVWF      R4+1
	MOVF       _temp+2, 0
	MOVWF      R4+2
	MOVF       _temp+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      32
	MOVWF      R0+2
	MOVLW      131
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_jhamela_32lcd+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;jhamela lcd.c,62 :: 		PORTC.f7=1;
	BSF        PORTC+0, 7
;jhamela lcd.c,63 :: 		delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main15:
	DECFSZ     R13+0, 1
	GOTO       L_main15
	DECFSZ     R12+0, 1
	GOTO       L_main15
	DECFSZ     R11+0, 1
	GOTO       L_main15
	NOP
;jhamela lcd.c,64 :: 		}
L_main14:
;jhamela lcd.c,66 :: 		count=count+1;
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
;jhamela lcd.c,67 :: 		IntToStr(count,x);
	MOVF       _count+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _count+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _x+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;jhamela lcd.c,68 :: 		Lcd_Out(2,6,x);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _x+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;jhamela lcd.c,69 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	DECFSZ     R11+0, 1
	GOTO       L_main16
	NOP
	NOP
;jhamela lcd.c,70 :: 		}
L_main7:
;jhamela lcd.c,72 :: 		if(afirst>ref && asecond<ref){
	MOVLW      128
	XORWF      _ref+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _afirst+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main38
	MOVF       _afirst+0, 0
	SUBWF      _ref+0, 0
L__main38:
	BTFSC      STATUS+0, 0
	GOTO       L_main19
	MOVLW      128
	XORWF      _asecond+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _ref+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main39
	MOVF       _ref+0, 0
	SUBWF      _asecond+0, 0
L__main39:
	BTFSC      STATUS+0, 0
	GOTO       L_main19
L__main27:
;jhamela lcd.c,73 :: 		while(asecond<ref){
L_main20:
	MOVLW      128
	XORWF      _asecond+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _ref+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main40
	MOVF       _ref+0, 0
	SUBWF      _asecond+0, 0
L__main40:
	BTFSC      STATUS+0, 0
	GOTO       L_main21
;jhamela lcd.c,74 :: 		asecond=ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _asecond+0
	MOVF       R0+1, 0
	MOVWF      _asecond+1
;jhamela lcd.c,76 :: 		}
	GOTO       L_main20
L_main21:
;jhamela lcd.c,77 :: 		while(afirst>ref){
L_main22:
	MOVLW      128
	XORWF      _ref+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _afirst+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main41
	MOVF       _afirst+0, 0
	SUBWF      _ref+0, 0
L__main41:
	BTFSC      STATUS+0, 0
	GOTO       L_main23
;jhamela lcd.c,78 :: 		afirst=ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _afirst+0
	MOVF       R0+1, 0
	MOVWF      _afirst+1
;jhamela lcd.c,80 :: 		}
	GOTO       L_main22
L_main23:
;jhamela lcd.c,81 :: 		while(afirst<ref){
L_main24:
	MOVLW      128
	XORWF      _afirst+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _ref+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main42
	MOVF       _ref+0, 0
	SUBWF      _afirst+0, 0
L__main42:
	BTFSC      STATUS+0, 0
	GOTO       L_main25
;jhamela lcd.c,82 :: 		afirst=ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _afirst+0
	MOVF       R0+1, 0
	MOVWF      _afirst+1
;jhamela lcd.c,84 :: 		}
	GOTO       L_main24
L_main25:
;jhamela lcd.c,86 :: 		count=count-1;
	MOVLW      1
	SUBWF      _count+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count+1, 1
;jhamela lcd.c,87 :: 		IntToStr(count,x);
	MOVF       _count+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _count+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _x+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;jhamela lcd.c,88 :: 		Lcd_Out(2,5,x);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _x+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;jhamela lcd.c,90 :: 		if(count == 0){
	MOVLW      0
	XORWF      _count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main43
	MOVLW      0
	XORWF      _count+0, 0
L__main43:
	BTFSS      STATUS+0, 2
	GOTO       L_main26
;jhamela lcd.c,91 :: 		PORTC.f7=0;
	BCF        PORTC+0, 7
;jhamela lcd.c,92 :: 		Lcd_Out(1,6,"Lights Out!!");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_jhamela_32lcd+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;jhamela lcd.c,93 :: 		}
L_main26:
;jhamela lcd.c,96 :: 		}
L_main19:
;jhamela lcd.c,98 :: 		}
	GOTO       L_main0
;jhamela lcd.c,99 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
