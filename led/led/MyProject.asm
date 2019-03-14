
_main:

;MyProject.c,1 :: 		void main() {
;MyProject.c,2 :: 		TRISB=0b00000000;
	CLRF       TRISB+0
;MyProject.c,3 :: 		while(1){
L_main0:
;MyProject.c,4 :: 		PORTB=0b11111111;
	MOVLW      255
	MOVWF      PORTB+0
;MyProject.c,5 :: 		}
	GOTO       L_main0
;MyProject.c,7 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
