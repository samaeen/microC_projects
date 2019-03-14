
_main:

;MyProject.c,2 :: 		void main() {
;MyProject.c,3 :: 		TRISB1_bit= 0;
	BCF        TRISB1_bit+0, BitPos(TRISB1_bit+0)
;MyProject.c,4 :: 		TRISB2_bit= 0;
	BCF        TRISB2_bit+0, BitPos(TRISB2_bit+0)
;MyProject.c,5 :: 		TRISB3_bit= 0;
	BCF        TRISB3_bit+0, BitPos(TRISB3_bit+0)
;MyProject.c,6 :: 		while(1){
L_main0:
;MyProject.c,7 :: 		PORTB.f1=1;
	BSF        PORTB+0, 1
;MyProject.c,8 :: 		delay_ms(500);
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
;MyProject.c,9 :: 		PORTB.f1=0;
	BCF        PORTB+0, 1
;MyProject.c,10 :: 		delay_ms(500);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;MyProject.c,11 :: 		PORTB.f2=1;
	BSF        PORTB+0, 2
;MyProject.c,12 :: 		delay_ms(500);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;MyProject.c,13 :: 		PORTB.f2=0;
	BCF        PORTB+0, 2
;MyProject.c,14 :: 		delay_ms(500);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;MyProject.c,15 :: 		PORTB.f3=1;
	BSF        PORTB+0, 3
;MyProject.c,16 :: 		delay_ms(500);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;MyProject.c,17 :: 		PORTB.f3=0;
	BCF        PORTB+0, 3
;MyProject.c,18 :: 		delay_ms(500);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;MyProject.c,19 :: 		}
	GOTO       L_main0
;MyProject.c,20 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
