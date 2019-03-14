
_main:

;button.c,1 :: 		void main() {
;button.c,3 :: 		TRISB0_bit = 0;
	BCF        TRISB0_bit+0, BitPos(TRISB0_bit+0)
;button.c,4 :: 		TRISB1_bit = 1;
	BSF        TRISB1_bit+0, BitPos(TRISB1_bit+0)
;button.c,5 :: 		TRISB7_bit = 1;
	BSF        TRISB7_bit+0, BitPos(TRISB7_bit+0)
;button.c,7 :: 		OPTION_REG.F7=0;
	BCF        OPTION_REG+0, 7
;button.c,8 :: 		OPTION_REG.F1=0;
	BCF        OPTION_REG+0, 1
;button.c,9 :: 		while(1){
L_main0:
;button.c,10 :: 		if(PORTB.F7==0){
	BTFSC      PORTB+0, 7
	GOTO       L_main2
;button.c,11 :: 		PORTB.F0=1;
	BSF        PORTB+0, 0
;button.c,12 :: 		}
	GOTO       L_main3
L_main2:
;button.c,14 :: 		PORTB.F0=0;
	BCF        PORTB+0, 0
;button.c,15 :: 		}
L_main3:
;button.c,16 :: 		}
	GOTO       L_main0
;button.c,17 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
