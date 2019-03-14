
_forward:

;lfr BASIC.c,2 :: 		void forward(){             //forward
;lfr BASIC.c,3 :: 		PORTB.F1=1;
	BSF        PORTB+0, 1
;lfr BASIC.c,4 :: 		PORTB.F2=0;
	BCF        PORTB+0, 2
;lfr BASIC.c,5 :: 		PWM1_set_Duty(255);
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;lfr BASIC.c,6 :: 		PORTB.F3=1;
	BSF        PORTB+0, 3
;lfr BASIC.c,7 :: 		PORTB.F4=0;
	BCF        PORTB+0, 4
;lfr BASIC.c,8 :: 		PWM2_set_Duty(255);
	MOVLW      255
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;lfr BASIC.c,9 :: 		}
L_end_forward:
	RETURN
; end of _forward

_stop:

;lfr BASIC.c,10 :: 		void stop(){
;lfr BASIC.c,11 :: 		PORTB.F1=0;
	BCF        PORTB+0, 1
;lfr BASIC.c,12 :: 		PORTB.F2=1;
	BSF        PORTB+0, 2
;lfr BASIC.c,13 :: 		PWM1_set_Duty(0);
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;lfr BASIC.c,14 :: 		PORTB.F3=0;
	BCF        PORTB+0, 3
;lfr BASIC.c,15 :: 		PORTB.F4=1;
	BSF        PORTB+0, 4
;lfr BASIC.c,16 :: 		PWM2_set_Duty(0);
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;lfr BASIC.c,17 :: 		}
L_end_stop:
	RETURN
; end of _stop

_left:

;lfr BASIC.c,18 :: 		void left(){
;lfr BASIC.c,19 :: 		PORTB.F1=1;
	BSF        PORTB+0, 1
;lfr BASIC.c,20 :: 		PORTB.F2=0;
	BCF        PORTB+0, 2
;lfr BASIC.c,21 :: 		PWM1_set_Duty(100);
	MOVLW      100
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;lfr BASIC.c,22 :: 		PORTB.F3=1;
	BSF        PORTB+0, 3
;lfr BASIC.c,23 :: 		PORTB.F4=0;
	BCF        PORTB+0, 4
;lfr BASIC.c,24 :: 		PWM2_set_Duty(255);
	MOVLW      255
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;lfr BASIC.c,25 :: 		}
L_end_left:
	RETURN
; end of _left

_right:

;lfr BASIC.c,26 :: 		void right(){
;lfr BASIC.c,27 :: 		PORTB.F1=1;
	BSF        PORTB+0, 1
;lfr BASIC.c,28 :: 		PORTB.F2=0;
	BCF        PORTB+0, 2
;lfr BASIC.c,29 :: 		PWM1_set_Duty(255);
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;lfr BASIC.c,30 :: 		PORTB.F3=1;
	BSF        PORTB+0, 3
;lfr BASIC.c,31 :: 		PORTB.F4=0;
	BCF        PORTB+0, 4
;lfr BASIC.c,32 :: 		PWM2_set_Duty(100);
	MOVLW      100
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;lfr BASIC.c,33 :: 		}
L_end_right:
	RETURN
; end of _right

_main:

;lfr BASIC.c,34 :: 		void main() {
;lfr BASIC.c,35 :: 		ADC_Init();
	CALL       _ADC_Init+0
;lfr BASIC.c,36 :: 		PWM1_Init(5000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;lfr BASIC.c,37 :: 		PWM2_Init(5000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;lfr BASIC.c,38 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;lfr BASIC.c,39 :: 		PWM2_Start();
	CALL       _PWM2_Start+0
;lfr BASIC.c,40 :: 		TRISB1_bit = 0;
	BCF        TRISB1_bit+0, BitPos(TRISB1_bit+0)
;lfr BASIC.c,41 :: 		TRISB2_bit = 0;
	BCF        TRISB2_bit+0, BitPos(TRISB2_bit+0)
;lfr BASIC.c,42 :: 		TRISB3_bit = 0;
	BCF        TRISB3_bit+0, BitPos(TRISB3_bit+0)
;lfr BASIC.c,43 :: 		TRISB4_bit = 0;
	BCF        TRISB4_bit+0, BitPos(TRISB4_bit+0)
;lfr BASIC.c,44 :: 		TRISC1_bit = 0;
	BCF        TRISC1_bit+0, BitPos(TRISC1_bit+0)
;lfr BASIC.c,45 :: 		TRISC2_bit = 0;
	BCF        TRISC2_bit+0, BitPos(TRISC2_bit+0)
;lfr BASIC.c,46 :: 		Aright = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _Aright+0
	MOVF       R0+1, 0
	MOVWF      _Aright+1
;lfr BASIC.c,47 :: 		Amiddle = ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _Amiddle+0
	MOVF       R0+1, 0
	MOVWF      _Amiddle+1
;lfr BASIC.c,48 :: 		Aleft = ADC_Read(2);
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _Aleft+0
	MOVF       R0+1, 0
	MOVWF      _Aleft+1
;lfr BASIC.c,49 :: 		while(1){
L_main0:
;lfr BASIC.c,50 :: 		if(Aright>500 && Amiddle<500 && Aleft>500)  {   //forward
	MOVLW      128
	XORLW      1
	MOVWF      R0+0
	MOVLW      128
	XORWF      _Aright+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main27
	MOVF       _Aright+0, 0
	SUBLW      244
L__main27:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
	MOVLW      128
	XORWF      _Amiddle+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main28
	MOVLW      244
	SUBWF      _Amiddle+0, 0
L__main28:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
	MOVLW      128
	XORLW      1
	MOVWF      R0+0
	MOVLW      128
	XORWF      _Aleft+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main29
	MOVF       _Aleft+0, 0
	SUBLW      244
L__main29:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
L__main21:
;lfr BASIC.c,51 :: 		forward();
	CALL       _forward+0
;lfr BASIC.c,52 :: 		}
	GOTO       L_main5
L_main4:
;lfr BASIC.c,53 :: 		else if(Aright<500 && Amiddle>500 && Aleft<500){  //ajaira
	MOVLW      128
	XORWF      _Aright+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main30
	MOVLW      244
	SUBWF      _Aright+0, 0
L__main30:
	BTFSC      STATUS+0, 0
	GOTO       L_main8
	MOVLW      128
	XORLW      1
	MOVWF      R0+0
	MOVLW      128
	XORWF      _Amiddle+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main31
	MOVF       _Amiddle+0, 0
	SUBLW      244
L__main31:
	BTFSC      STATUS+0, 0
	GOTO       L_main8
	MOVLW      128
	XORWF      _Aleft+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main32
	MOVLW      244
	SUBWF      _Aleft+0, 0
L__main32:
	BTFSC      STATUS+0, 0
	GOTO       L_main8
L__main20:
;lfr BASIC.c,54 :: 		stop();
	CALL       _stop+0
;lfr BASIC.c,55 :: 		}
	GOTO       L_main9
L_main8:
;lfr BASIC.c,56 :: 		else if(Aright<500 && Amiddle>500 && Aleft>500){
	MOVLW      128
	XORWF      _Aright+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main33
	MOVLW      244
	SUBWF      _Aright+0, 0
L__main33:
	BTFSC      STATUS+0, 0
	GOTO       L_main12
	MOVLW      128
	XORLW      1
	MOVWF      R0+0
	MOVLW      128
	XORWF      _Amiddle+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main34
	MOVF       _Amiddle+0, 0
	SUBLW      244
L__main34:
	BTFSC      STATUS+0, 0
	GOTO       L_main12
	MOVLW      128
	XORLW      1
	MOVWF      R0+0
	MOVLW      128
	XORWF      _Aleft+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main35
	MOVF       _Aleft+0, 0
	SUBLW      244
L__main35:
	BTFSC      STATUS+0, 0
	GOTO       L_main12
L__main19:
;lfr BASIC.c,57 :: 		right();       //right
	CALL       _right+0
;lfr BASIC.c,58 :: 		}
	GOTO       L_main13
L_main12:
;lfr BASIC.c,59 :: 		else if(Aright>500 && Amiddle>500 && Aleft<500){
	MOVLW      128
	XORLW      1
	MOVWF      R0+0
	MOVLW      128
	XORWF      _Aright+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main36
	MOVF       _Aright+0, 0
	SUBLW      244
L__main36:
	BTFSC      STATUS+0, 0
	GOTO       L_main16
	MOVLW      128
	XORLW      1
	MOVWF      R0+0
	MOVLW      128
	XORWF      _Amiddle+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main37
	MOVF       _Amiddle+0, 0
	SUBLW      244
L__main37:
	BTFSC      STATUS+0, 0
	GOTO       L_main16
	MOVLW      128
	XORWF      _Aleft+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main38
	MOVLW      244
	SUBWF      _Aleft+0, 0
L__main38:
	BTFSC      STATUS+0, 0
	GOTO       L_main16
L__main18:
;lfr BASIC.c,60 :: 		left();       //left
	CALL       _left+0
;lfr BASIC.c,61 :: 		}
	GOTO       L_main17
L_main16:
;lfr BASIC.c,63 :: 		stop();
	CALL       _stop+0
;lfr BASIC.c,64 :: 		}
L_main17:
L_main13:
L_main9:
L_main5:
;lfr BASIC.c,67 :: 		}
	GOTO       L_main0
;lfr BASIC.c,69 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
