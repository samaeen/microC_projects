
_main:

;counter.c,19 :: 		void main() {
;counter.c,20 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;counter.c,21 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;counter.c,22 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;counter.c,23 :: 		while(1){
L_main0:
;counter.c,24 :: 		ref = 500;
	MOVLW      244
	MOVWF      _ref+0
	MOVLW      1
	MOVWF      _ref+1
;counter.c,25 :: 		ADC_Init();
	CALL       _ADC_Init+0
;counter.c,26 :: 		afirst = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _afirst+0
	MOVF       R0+1, 0
	MOVWF      _afirst+1
;counter.c,27 :: 		asecond = ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _asecond+0
	MOVF       R0+1, 0
	MOVWF      _asecond+1
;counter.c,29 :: 		if(afirst<ref && asecond<ref){
	MOVLW      128
	XORWF      _afirst+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _ref+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main28
	MOVF       _ref+0, 0
	SUBWF      _afirst+0, 0
L__main28:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
	MOVLW      128
	XORWF      _asecond+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _ref+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main29
	MOVF       _ref+0, 0
	SUBWF      _asecond+0, 0
L__main29:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
L__main26:
;counter.c,30 :: 		count=count;
;counter.c,31 :: 		IntToStr(count,x);
	MOVF       _count+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _count+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _x+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;counter.c,32 :: 		Lcd_Out(2,2,x);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _x+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;counter.c,33 :: 		Lcd_Out(1,2,"1");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_counter+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;counter.c,34 :: 		}
L_main4:
;counter.c,35 :: 		if(afirst>ref && asecond<ref){
	MOVLW      128
	XORWF      _ref+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _afirst+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main30
	MOVF       _afirst+0, 0
	SUBWF      _ref+0, 0
L__main30:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
	MOVLW      128
	XORWF      _asecond+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _ref+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main31
	MOVF       _ref+0, 0
	SUBWF      _asecond+0, 0
L__main31:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
L__main25:
;counter.c,36 :: 		while(afirst>ref){
L_main8:
	MOVLW      128
	XORWF      _ref+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _afirst+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main32
	MOVF       _afirst+0, 0
	SUBWF      _ref+0, 0
L__main32:
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;counter.c,37 :: 		afirst=ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _afirst+0
	MOVF       R0+1, 0
	MOVWF      _afirst+1
;counter.c,38 :: 		Lcd_Out(1,2,"2");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_counter+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;counter.c,39 :: 		}
	GOTO       L_main8
L_main9:
;counter.c,40 :: 		while(asecond<ref){
L_main10:
	MOVLW      128
	XORWF      _asecond+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _ref+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main33
	MOVF       _ref+0, 0
	SUBWF      _asecond+0, 0
L__main33:
	BTFSC      STATUS+0, 0
	GOTO       L_main11
;counter.c,41 :: 		asecond=ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _asecond+0
	MOVF       R0+1, 0
	MOVWF      _asecond+1
;counter.c,42 :: 		Lcd_Out(1,2,"3");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_counter+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;counter.c,43 :: 		}
	GOTO       L_main10
L_main11:
;counter.c,44 :: 		while(asecond>ref){
L_main12:
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
	GOTO       L_main13
;counter.c,45 :: 		asecond=ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _asecond+0
	MOVF       R0+1, 0
	MOVWF      _asecond+1
;counter.c,46 :: 		Lcd_Out(1,2,"4");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_counter+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;counter.c,47 :: 		}
	GOTO       L_main12
L_main13:
;counter.c,48 :: 		count=count+1;
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
;counter.c,49 :: 		IntToStr(count,x);
	MOVF       _count+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _count+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _x+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;counter.c,50 :: 		Lcd_Out(2,2,x);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _x+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;counter.c,51 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
	NOP
;counter.c,52 :: 		}
L_main7:
;counter.c,55 :: 		if(afirst<ref && asecond>ref){
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
	GOTO       L_main17
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
	GOTO       L_main17
L__main24:
;counter.c,56 :: 		while(asecond>ref){
L_main18:
	MOVLW      128
	XORWF      _ref+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _asecond+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main37
	MOVF       _asecond+0, 0
	SUBWF      _ref+0, 0
L__main37:
	BTFSC      STATUS+0, 0
	GOTO       L_main19
;counter.c,57 :: 		asecond=ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _asecond+0
	MOVF       R0+1, 0
	MOVWF      _asecond+1
;counter.c,58 :: 		Lcd_Out(1,2,"5");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_counter+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;counter.c,59 :: 		}
	GOTO       L_main18
L_main19:
;counter.c,60 :: 		while(afirst<ref){
L_main20:
	MOVLW      128
	XORWF      _afirst+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _ref+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main38
	MOVF       _ref+0, 0
	SUBWF      _afirst+0, 0
L__main38:
	BTFSC      STATUS+0, 0
	GOTO       L_main21
;counter.c,61 :: 		afirst=ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _afirst+0
	MOVF       R0+1, 0
	MOVWF      _afirst+1
;counter.c,62 :: 		Lcd_Out(1,2,"6");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_counter+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;counter.c,63 :: 		}
	GOTO       L_main20
L_main21:
;counter.c,64 :: 		while(afirst>ref){
L_main22:
	MOVLW      128
	XORWF      _ref+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _afirst+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main39
	MOVF       _afirst+0, 0
	SUBWF      _ref+0, 0
L__main39:
	BTFSC      STATUS+0, 0
	GOTO       L_main23
;counter.c,65 :: 		afirst=ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _afirst+0
	MOVF       R0+1, 0
	MOVWF      _afirst+1
;counter.c,66 :: 		Lcd_Out(1,2,"7");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_counter+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;counter.c,67 :: 		}
	GOTO       L_main22
L_main23:
;counter.c,68 :: 		count=count-1;
	MOVLW      1
	SUBWF      _count+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count+1, 1
;counter.c,69 :: 		IntToStr(count,x);
	MOVF       _count+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _count+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _x+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;counter.c,70 :: 		Lcd_Out(2,2,x);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _x+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;counter.c,74 :: 		}
L_main17:
;counter.c,78 :: 		}
	GOTO       L_main0
;counter.c,79 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
