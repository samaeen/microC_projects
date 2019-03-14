
_main:

;LCD.c,18 :: 		void main() {
;LCD.c,20 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;LCD.c,21 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,22 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,24 :: 		Lcd_Out(2,2,"shoummo");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD.c,26 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
