
_main:

;ADC.c,7 :: 		void main() {
;ADC.c,9 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;ADC.c,10 :: 		ADC_Init();
	CALL       _ADC_Init+0
;ADC.c,11 :: 		TRISB0_bit = 0;
	BCF        TRISB0_bit+0, BitPos(TRISB0_bit+0)
;ADC.c,13 :: 		while(1){
L_main0:
;ADC.c,14 :: 		valADC = ADC_Read(2);
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _valADC+0
	MOVF       R0+1, 0
	MOVWF      _valADC+1
;ADC.c,22 :: 		if(valADC<500){
	MOVLW      128
	XORWF      R0+1, 0
	MOVWF      R2+0
	MOVLW      128
	XORLW      1
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main5
	MOVLW      244
	SUBWF      R0+0, 0
L__main5:
	BTFSC      STATUS+0, 0
	GOTO       L_main2
;ADC.c,23 :: 		PORTB.F0 = 1;
	BSF        PORTB+0, 0
;ADC.c,24 :: 		}
	GOTO       L_main3
L_main2:
;ADC.c,26 :: 		PORTB.F0 = 0;
	BCF        PORTB+0, 0
;ADC.c,27 :: 		}
L_main3:
;ADC.c,30 :: 		}
	GOTO       L_main0
;ADC.c,33 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
