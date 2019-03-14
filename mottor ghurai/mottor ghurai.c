void main() {
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
while(1){
PORTB.F1=1;
PORTB.F2=0;
PWM1_set_Duty(255);
Delay_ms(500);
PORTB.F1=0;
PORTB.F2=1;
PWM1_set_Duty(255);
Delay_ms(500);
PORTB.F3=1;
PORTB.F4=0;
PWM2_set_Duty(100);
Delay_ms(500);
PORTB.F3=0;
PORTB.F4=1;
PWM2_set_Duty(100);
Delay_ms(500);
}


}