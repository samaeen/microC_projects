
int valADC;

char x[4];


void main() {

    UART1_Init(9600);
    ADC_Init();
    TRISB0_bit = 0;
    
    while(1){
    valADC = ADC_Read(2);
/*IntToStr(valADC,x);
    UART1_Write_Text("analog value");
    UART1_Write_Text(x);

    strcpy(x,"");
    UART1_Write(13);
    Delay_ms(1000);*/
if(valADC<500){
PORTB.F0 = 1;
}
else{
PORTB.F0 = 0;
}

    
    }
    

}