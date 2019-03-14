
void main() {
     TRISB1_bit= 0;
     TRISB2_bit= 0;
     TRISB3_bit= 0;
     while(1){
     PORTB.f1=1;
     delay_ms(500);
     PORTB.f1=0;
     delay_ms(500);
     PORTB.f2=1;
     delay_ms(500);
     PORTB.f2=0;
     delay_ms(500);
     PORTB.f3=1;
     delay_ms(500);
     PORTB.f3=0;
     delay_ms(500);
     }
}