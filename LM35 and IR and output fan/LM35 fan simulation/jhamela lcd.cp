#line 1 "C:/Users/Shoummo/Documents/MICRO C/LM35 and IR and output fan/LM35 fan simulation/jhamela lcd.c"
int ref,afirst,count=0,asecond;
float temp;
float tempa;
char x[20];

sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;

void main() {
TRISC7_bit= 0;
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

while(1)
{
ref=190;

 ADC_Init();
afirst = ADC_Read(0);
asecond = ADC_Read(1);
tempa=ADC_Read(2);
temp= tempa*1.960784;





 if(afirst>ref && asecond>ref){

 count=count;
 IntToStr(count,x);
 Lcd_Out(2,6,x);

 }
if(afirst<ref && asecond>ref){
 while(afirst<ref){
 afirst=ADC_Read(0);

 }
 while(asecond>ref){
 asecond=ADC_Read(1);

 }
 while(asecond<ref){
 asecond=ADC_Read(1);

 }

 if(temp>20){ Lcd_Out(1,6,"Lights On!!");
 PORTC.f7=1;
 delay_ms(1000);
 }

 count=count+1;
 IntToStr(count,x);
 Lcd_Out(2,6,x);
 delay_ms(100);
 }

 if(afirst>ref && asecond<ref){
 while(asecond<ref){
 asecond=ADC_Read(1);

 }
 while(afirst>ref){
 afirst=ADC_Read(0);

 }
 while(afirst<ref){
 afirst=ADC_Read(0);

 }

 count=count-1;
 IntToStr(count,x);
 Lcd_Out(2,5,x);

 if(count == 0){
 PORTC.f7=0;
 Lcd_Out(1,6,"Lights Out!!");
 }


 }

}
}
