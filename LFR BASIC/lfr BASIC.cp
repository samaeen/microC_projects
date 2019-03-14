#line 1 "C:/Users/Shoummo/Documents/MICRO C/LFR BASIC/lfr BASIC.c"
int Aright,Amiddle,Aleft;
void forward(){
 PORTB.F1=1;
PORTB.F2=0;
PWM1_set_Duty(255);
PORTB.F3=1;
PORTB.F4=0;
PWM2_set_Duty(255);
}
void stop(){
PORTB.F1=0;
PORTB.F2=1;
PWM1_set_Duty(0);
PORTB.F3=0;
PORTB.F4=1;
PWM2_set_Duty(0);
}
void left(){
PORTB.F1=1;
PORTB.F2=0;
PWM1_set_Duty(100);
PORTB.F3=1;
PORTB.F4=0;
PWM2_set_Duty(255);
}
void right(){
PORTB.F1=1;
PORTB.F2=0;
PWM1_set_Duty(255);
PORTB.F3=1;
PORTB.F4=0;
PWM2_set_Duty(100);
}
void main() {
ADC_Init();
PWM1_Init(5000);
PWM2_Init(5000);
PWM1_Start();
PWM2_Start();
TRISB1_bit = 0;
TRISB2_bit = 0;
TRISB3_bit = 0;
TRISB4_bit = 0;
TRISC1_bit = 0;
TRISC2_bit = 0;
Aright = ADC_Read(0);
Amiddle = ADC_Read(1);
Aleft = ADC_Read(2);
while(1){
if(Aright>500 && Amiddle<500 && Aleft>500) {
 forward();
}
else if(Aright<500 && Amiddle>500 && Aleft<500){
 stop();
 }
else if(Aright<500 && Amiddle>500 && Aleft>500){
 right();
 }
else if(Aright>500 && Amiddle>500 && Aleft<500){
 left();
 }
else{
 stop();
}


}

}
