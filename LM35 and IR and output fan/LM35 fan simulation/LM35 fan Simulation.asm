
_main:

;LM35 fan Simulation.c,21 :: 		void main() {
;LM35 fan Simulation.c,22 :: 		TRISB6_bit= 0;
	BCF        TRISB6_bit+0, BitPos(TRISB6_bit+0)
;LM35 fan Simulation.c,23 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;LM35 fan Simulation.c,24 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LM35 fan Simulation.c,25 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LM35 fan Simulation.c,26 :: 		while(1){
L_main0:
;LM35 fan Simulation.c,27 :: 		ref = 500;
	MOVLW      244
	MOVWF      _ref+0
	MOVLW      1
	MOVWF      _ref+1
;LM35 fan Simulation.c,28 :: 		ADC_Init();
	CALL       _ADC_Init+0
;LM35 fan Simulation.c,29 :: 		afirst = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _afirst+0
	MOVF       R0+1, 0
	MOVWF      _afirst+1
;LM35 fan Simulation.c,30 :: 		asecond = ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _asecond+0
	MOVF       R0+1, 0
	MOVWF      _asecond+1
;LM35 fan Simulation.c,31 :: 		tempa=ADC_Read(2);
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
;LM35 fan Simulation.c,32 :: 		temp= tempa*0.48828125;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      125
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
;LM35 fan Simulation.c,34 :: 		if(afirst>ref && asecond<ref){
	MOVLW      128
	XORWF      _ref+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _afirst+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main25
	MOVF       _afirst+0, 0
	SUBWF      _ref+0, 0
L__main25:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
	MOVLW      128
	XORWF      _asecond+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _ref+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main26
	MOVF       _ref+0, 0
	SUBWF      _asecond+0, 0
L__main26:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
L__main23:
;LM35 fan Simulation.c,35 :: 		while(afirst>ref){
L_main5:
	MOVLW      128
	XORWF      _ref+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _afirst+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main27
	MOVF       _afirst+0, 0
	SUBWF      _ref+0, 0
L__main27:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;LM35 fan Simulation.c,36 :: 		afirst=ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _afirst+0
	MOVF       R0+1, 0
	MOVWF      _afirst+1
;LM35 fan Simulation.c,37 :: 		Lcd_Out(1,2,"2");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_LM35_32fan_32Simulation+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LM35 fan Simulation.c,38 :: 		}
	GOTO       L_main5
L_main6:
;LM35 fan Simulation.c,39 :: 		while(asecond<ref){
L_main7:
	MOVLW      128
	XORWF      _asecond+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _ref+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main28
	MOVF       _ref+0, 0
	SUBWF      _asecond+0, 0
L__main28:
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;LM35 fan Simulation.c,40 :: 		asecond=ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _asecond+0
	MOVF       R0+1, 0
	MOVWF      _asecond+1
;LM35 fan Simulation.c,41 :: 		Lcd_Out(1,2,"3");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_LM35_32fan_32Simulation+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LM35 fan Simulation.c,42 :: 		}
	GOTO       L_main7
L_main8:
;LM35 fan Simulation.c,43 :: 		while(asecond>ref){
L_main9:
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
	GOTO       L_main10
;LM35 fan Simulation.c,44 :: 		asecond=ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _asecond+0
	MOVF       R0+1, 0
	MOVWF      _asecond+1
;LM35 fan Simulation.c,45 :: 		Lcd_Out(1,2,"4");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_LM35_32fan_32Simulation+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LM35 fan Simulation.c,46 :: 		}
	GOTO       L_main9
L_main10:
;LM35 fan Simulation.c,48 :: 		if(temp>25){
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
	MOVLW      72
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
	GOTO       L_main11
;LM35 fan Simulation.c,49 :: 		Lcd_Out(2,1,"jolse");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_LM35_32fan_32Simulation+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LM35 fan Simulation.c,50 :: 		PORTB.f6=1;
	BSF        PORTB+0, 6
;LM35 fan Simulation.c,51 :: 		}
L_main11:
;LM35 fan Simulation.c,52 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
	NOP
;LM35 fan Simulation.c,53 :: 		}
L_main4:
;LM35 fan Simulation.c,55 :: 		if(afirst<ref && asecond>ref){
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
	GOTO       L_main15
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
	GOTO       L_main15
L__main22:
;LM35 fan Simulation.c,56 :: 		while(asecond>ref){
L_main16:
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
	GOTO       L_main17
;LM35 fan Simulation.c,57 :: 		asecond=ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _asecond+0
	MOVF       R0+1, 0
	MOVWF      _asecond+1
;LM35 fan Simulation.c,58 :: 		Lcd_Out(1,2,"5");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_LM35_32fan_32Simulation+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LM35 fan Simulation.c,59 :: 		}
	GOTO       L_main16
L_main17:
;LM35 fan Simulation.c,60 :: 		while(afirst<ref){
L_main18:
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
	GOTO       L_main19
;LM35 fan Simulation.c,61 :: 		afirst=ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _afirst+0
	MOVF       R0+1, 0
	MOVWF      _afirst+1
;LM35 fan Simulation.c,62 :: 		Lcd_Out(1,2,"6");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_LM35_32fan_32Simulation+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LM35 fan Simulation.c,63 :: 		}
	GOTO       L_main18
L_main19:
;LM35 fan Simulation.c,64 :: 		while(afirst>ref){
L_main20:
	MOVLW      128
	XORWF      _ref+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _afirst+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main34
	MOVF       _afirst+0, 0
	SUBWF      _ref+0, 0
L__main34:
	BTFSC      STATUS+0, 0
	GOTO       L_main21
;LM35 fan Simulation.c,65 :: 		afirst=ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _afirst+0
	MOVF       R0+1, 0
	MOVWF      _afirst+1
;LM35 fan Simulation.c,66 :: 		Lcd_Out(1,2,"7");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_LM35_32fan_32Simulation+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LM35 fan Simulation.c,67 :: 		}
	GOTO       L_main20
L_main21:
;LM35 fan Simulation.c,68 :: 		PORTB.f6=0;
	BCF        PORTB+0, 6
;LM35 fan Simulation.c,69 :: 		Lcd_Out(2,1,"finished");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_LM35_32fan_32Simulation+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LM35 fan Simulation.c,71 :: 		}
L_main15:
;LM35 fan Simulation.c,72 :: 		}
	GOTO       L_main0
;LM35 fan Simulation.c,73 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
