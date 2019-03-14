#line 1 "C:/Users/Shoummo/Documents/MICRO C/ADC/ADC.c"

int valADC;

char x[4];


void main() {

 UART1_Init(9600);
 ADC_Init();
 TRISB0_bit = 0;

 while(1){
 valADC = ADC_Read(2);
#line 22 "C:/Users/Shoummo/Documents/MICRO C/ADC/ADC.c"
if(valADC<500){
PORTB.F0 = 1;
}
else{
PORTB.F0 = 0;
}


 }


}
