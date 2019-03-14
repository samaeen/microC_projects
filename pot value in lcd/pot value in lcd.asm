
_main:

;pot value in lcd.c,22 :: 		void main() {
;pot value in lcd.c,25 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;pot value in lcd.c,26 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pot value in lcd.c,27 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pot value in lcd.c,28 :: 		while(1){
L_main0:
;pot value in lcd.c,29 :: 		Lcd_Out(1,1,"pot er value -_-");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_pot_32value_32in_32lcd+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pot value in lcd.c,30 :: 		potval = ADC_Read(2);
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _potval+0
	MOVF       R0+1, 0
	MOVWF      _potval+1
;pot value in lcd.c,31 :: 		IntToStr(potval,x);
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _x+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;pot value in lcd.c,32 :: 		Lcd_Out(2,2,x);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _x+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pot value in lcd.c,33 :: 		}
	GOTO       L_main0
;pot value in lcd.c,35 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
