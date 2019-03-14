void main() {

TRISB0_bit = 0;
TRISB1_bit = 1;
TRISB7_bit = 1;

OPTION_REG.F7=0;
OPTION_REG.F1=0;
   while(1){
      if(PORTB.F7==0){
          PORTB.F0=1;
      }
      else{
          PORTB.F0=0;
      }
   }
}