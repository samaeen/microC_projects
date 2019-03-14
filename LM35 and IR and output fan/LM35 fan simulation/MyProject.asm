
_main:

;MyProject.c,20 :: 		void main() {
;MyProject.c,23 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;MyProject.c,24 :: 		ADC_Init();
	CALL       _ADC_Init+0
;MyProject.c,25 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;MyProject.c,26 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,27 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,29 :: 		while(1){
L_main1:
;MyProject.c,30 :: 		Lcd_Out(1,1,"hello");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,31 :: 		delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;MyProject.c,32 :: 		ref = 125;
	MOVLW      125
	MOVWF      _ref+0
	MOVLW      0
	MOVWF      _ref+1
;MyProject.c,33 :: 		afirst = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _afirst+0
	MOVF       R0+1, 0
	MOVWF      _afirst+1
;MyProject.c,34 :: 		asecond = ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _asecond+0
	MOVF       R0+1, 0
	MOVWF      _asecond+1
;MyProject.c,35 :: 		tempa=ADC_Read(2);
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
;MyProject.c,36 :: 		IntToStr(afirst,x);
	MOVF       _afirst+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _afirst+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _x+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;MyProject.c,37 :: 		Lcd_Out(1,2,x);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _x+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,38 :: 		IntToStr(asecond,x);
	MOVF       _asecond+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _asecond+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _x+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;MyProject.c,39 :: 		Lcd_Out(2,2,x);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _x+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,83 :: 		}
	GOTO       L_main1
;MyProject.c,84 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
