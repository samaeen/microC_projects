
_main:

;Uart.c,2 :: 		void main() {
;Uart.c,4 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Uart.c,6 :: 		while(1){
L_main0:
;Uart.c,7 :: 		UART1_Write_Text("shoummo rocks and u suck :D ");
	MOVLW      ?lstr1_Uart+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Uart.c,8 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;Uart.c,9 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Uart.c,11 :: 		}
	GOTO       L_main0
;Uart.c,13 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
