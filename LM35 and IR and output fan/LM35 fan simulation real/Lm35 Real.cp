#line 1 "C:/Users/Shoummo/Documents/MICRO C/LM35 fan simulation real/Lm35 Real.c"
int ref,afirst,asecond;
float temp;
float tempa;
char x[20];

sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D7 at RB0_bit;
sbit LCD_D6 at RB1_bit;
sbit LCD_D5 at RB2_bit;
sbit LCD_D4 at RB3_bit;


sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D7_Direction at TRISB0_bit;
sbit LCD_D6_Direction at TRISB1_bit;
sbit LCD_D5_Direction at TRISB2_bit;
sbit LCD_D4_Direction at TRISB3_bit;
void main() {


 Delay_ms(100);
 ADC_Init();
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

while(1){
Lcd_Out(1,1,"hello");
delay_ms(1000);
ref = 125;
afirst = ADC_Read(0);
asecond = ADC_Read(1);
tempa=ADC_Read(2);
IntToStr(afirst,x);
Lcd_Out(1,2,x);
IntToStr(asecond,x);
Lcd_Out(2,2,x);
#line 83 "C:/Users/Shoummo/Documents/MICRO C/LM35 fan simulation real/Lm35 Real.c"
}
}
