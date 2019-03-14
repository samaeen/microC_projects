
_main:

;counterReal.c,19 :: 		void main() {
;counterReal.c,20 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;counterReal.c,21 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;counterReal.c,22 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;counterReal.c,23 :: 		while(1){
L_main0:
;counterReal.c,24 :: 		ref = 80;
	MOVLW      80
	MOVWF      _ref+0
	MOVLW      0
	MOVWF      _ref+1
;counterReal.c,25 :: 		ADC_Init();
	CALL       _ADC_Init+0
;counterReal.c,26 :: 		afirst = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _afirst+0
	MOVF       R0+1, 0
	MOVWF      _afirst+1
;counterReal.c,27 :: 		asecond = ADC_Read(3);
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _asecond+0
	MOVF       R0+1, 0
	MOVWF      _asecond+1
;counterReal.c,29 :: 		if(afirst>ref && asecond>ref){
	MOVLW      128
	XORWF      _ref+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _afirst+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main28
	MOVF       _afirst+0, 0
	SUBWF      _ref+0, 0
L__main28:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
	MOVLW      128
	XORWF      _ref+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _asecond+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main29
	MOVF       _asecond+0, 0
	SUBWF      _ref+0, 0
L__main29:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
L__main26:
;counterReal.c,30 :: 		count=count;
;counterReal.c,31 :: 		IntToStr(count,x);
	MOVF       _count+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _count+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _x+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;counterReal.c,32 :: 		Lcd_Out(2,2,x);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _x+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;counterReal.c,33 :: 		Lcd_Out(1,2,"person present");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_counterReal+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;counterReal.c,34 :: 		}
L_main4:
;counterReal.c,35 :: 		if(afirst<ref && asecond>ref){
	MOVLW      128
	XORWF      _afirst+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _ref+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main30
	MOVF       _ref+0, 0
	SUBWF      _afirst+0, 0
L__main30:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
	MOVLW      128
	XORWF      _ref+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _asecond+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main31
	MOVF       _asecond+0, 0
	SUBWF      _ref+0, 0
L__main31:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
L__main25:
;counterReal.c,36 :: 		while(afirst<ref){
L_main8:
	MOVLW      128
	XORWF      _afirst+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _ref+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main32
	MOVF       _ref+0, 0
	SUBWF      _afirst+0, 0
L__main32:
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;counterReal.c,37 :: 		afirst=ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _afirst+0
	MOVF       R0+1, 0
	MOVWF      _afirst+1
;counterReal.c,39 :: 		}
	GOTO       L_main8
L_main9:
;counterReal.c,40 :: 		while(asecond>ref){
L_main10:
	MOVLW      128
	XORWF      _ref+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _asecond+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main33
	MOVF       _asecond+0, 0
	SUBWF      _ref+0, 0
L__main33:
	BTFSC      STATUS+0, 0
	GOTO       L_main11
;counterReal.c,41 :: 		asecond=ADC_Read(3);
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _asecond+0
	MOVF       R0+1, 0
	MOVWF      _asecond+1
;counterReal.c,43 :: 		}
	GOTO       L_main10
L_main11:
;counterReal.c,44 :: 		while(asecond<ref){
L_main12:
	MOVLW      128
	XORWF      _asecond+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _ref+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main34
	MOVF       _ref+0, 0
	SUBWF      _asecond+0, 0
L__main34:
	BTFSC      STATUS+0, 0
	GOTO       L_main13
;counterReal.c,45 :: 		asecond=ADC_Read(3);
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _asecond+0
	MOVF       R0+1, 0
	MOVWF      _asecond+1
;counterReal.c,47 :: 		}
	GOTO       L_main12
L_main13:
;counterReal.c,48 :: 		count=count+1;
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
;counterReal.c,49 :: 		IntToStr(count,x);
	MOVF       _count+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _count+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _x+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;counterReal.c,50 :: 		Lcd_Out(2,2,x);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _x+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;counterReal.c,51 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
	NOP
	NOP
;counterReal.c,52 :: 		}
L_main7:
;counterReal.c,55 :: 		if(afirst>ref && asecond<ref){
	MOVLW      128
	XORWF      _ref+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _afirst+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main35
	MOVF       _afirst+0, 0
	SUBWF      _ref+0, 0
L__main35:
	BTFSC      STATUS+0, 0
	GOTO       L_main17
	MOVLW      128
	XORWF      _asecond+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _ref+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main36
	MOVF       _ref+0, 0
	SUBWF      _asecond+0, 0
L__main36:
	BTFSC      STATUS+0, 0
	GOTO       L_main17
L__main24:
;counterReal.c,56 :: 		while(asecond<ref){
L_main18:
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
	GOTO       L_main19
;counterReal.c,57 :: 		asecond=ADC_Read(3);
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _asecond+0
	MOVF       R0+1, 0
	MOVWF      _asecond+1
;counterReal.c,59 :: 		}
	GOTO       L_main18
L_main19:
;counterReal.c,60 :: 		while(afirst>ref){
L_main20:
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
	GOTO       L_main21
;counterReal.c,61 :: 		afirst=ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _afirst+0
	MOVF       R0+1, 0
	MOVWF      _afirst+1
;counterReal.c,63 :: 		}
	GOTO       L_main20
L_main21:
;counterReal.c,64 :: 		while(afirst<ref){
L_main22:
	MOVLW      128
	XORWF      _afirst+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _ref+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main39
	MOVF       _ref+0, 0
	SUBWF      _afirst+0, 0
L__main39:
	BTFSC      STATUS+0, 0
	GOTO       L_main23
;counterReal.c,65 :: 		afirst=ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _afirst+0
	MOVF       R0+1, 0
	MOVWF      _afirst+1
;counterReal.c,67 :: 		}
	GOTO       L_main22
L_main23:
;counterReal.c,68 :: 		count=count-1;
	MOVLW      1
	SUBWF      _count+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count+1, 1
;counterReal.c,69 :: 		IntToStr(count,x);
	MOVF       _count+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _count+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _x+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;counterReal.c,70 :: 		Lcd_Out(2,2,x);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _x+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;counterReal.c,74 :: 		}
L_main17:
;counterReal.c,78 :: 		}
	GOTO       L_main0
;counterReal.c,79 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
