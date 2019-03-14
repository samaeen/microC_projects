
_main:

;mottor ghurai.c,1 :: 		void main() {
;mottor ghurai.c,2 :: 		PWM1_Init(5000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;mottor ghurai.c,3 :: 		PWM2_Init(5000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;mottor ghurai.c,4 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;mottor ghurai.c,5 :: 		PWM2_Start();
	CALL       _PWM2_Start+0
;mottor ghurai.c,6 :: 		TRISB1_bit = 0;
	BCF        TRISB1_bit+0, BitPos(TRISB1_bit+0)
;mottor ghurai.c,7 :: 		TRISB2_bit = 0;
	BCF        TRISB2_bit+0, BitPos(TRISB2_bit+0)
;mottor ghurai.c,8 :: 		TRISB3_bit = 0;
	BCF        TRISB3_bit+0, BitPos(TRISB3_bit+0)
;mottor ghurai.c,9 :: 		TRISB4_bit = 0;
	BCF        TRISB4_bit+0, BitPos(TRISB4_bit+0)
;mottor ghurai.c,10 :: 		TRISC1_bit = 0;
	BCF        TRISC1_bit+0, BitPos(TRISC1_bit+0)
;mottor ghurai.c,11 :: 		TRISC2_bit = 0;
	BCF        TRISC2_bit+0, BitPos(TRISC2_bit+0)
;mottor ghurai.c,12 :: 		while(1){
L_main0:
;mottor ghurai.c,13 :: 		PORTB.F1=1;
	BSF        PORTB+0, 1
;mottor ghurai.c,14 :: 		PORTB.F2=0;
	BCF        PORTB+0, 2
;mottor ghurai.c,15 :: 		PWM1_set_Duty(255);
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;mottor ghurai.c,16 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;mottor ghurai.c,17 :: 		PORTB.F1=0;
	BCF        PORTB+0, 1
;mottor ghurai.c,18 :: 		PORTB.F2=1;
	BSF        PORTB+0, 2
;mottor ghurai.c,19 :: 		PWM1_set_Duty(255);
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;mottor ghurai.c,20 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;mottor ghurai.c,21 :: 		PORTB.F3=1;
	BSF        PORTB+0, 3
;mottor ghurai.c,22 :: 		PORTB.F4=0;
	BCF        PORTB+0, 4
;mottor ghurai.c,23 :: 		PWM2_set_Duty(100);
	MOVLW      100
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;mottor ghurai.c,24 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;mottor ghurai.c,25 :: 		PORTB.F3=0;
	BCF        PORTB+0, 3
;mottor ghurai.c,26 :: 		PORTB.F4=1;
	BSF        PORTB+0, 4
;mottor ghurai.c,27 :: 		PWM2_set_Duty(100);
	MOVLW      100
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;mottor ghurai.c,28 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;mottor ghurai.c,29 :: 		}
	GOTO       L_main0
;mottor ghurai.c,32 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
