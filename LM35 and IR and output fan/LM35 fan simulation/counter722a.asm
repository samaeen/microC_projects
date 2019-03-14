
_main:

;counter722a.c,21 :: 		void main() {
;counter722a.c,23 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;counter722a.c,24 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;counter722a.c,25 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;counter722a.c,26 :: 		Lcd_Out(2,1,"jolse");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_counter722a+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;counter722a.c,27 :: 		delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
;counter722a.c,28 :: 		while(1){
L_main1:
;counter722a.c,29 :: 		Lcd_Out(2,1,"jolse");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_counter722a+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;counter722a.c,76 :: 		}
	GOTO       L_main1
;counter722a.c,77 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
