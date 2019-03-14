#line 1 "C:/Users/Shoummo/Documents/MICRO C/Counter for Real/counterReal.c"
int ref,count=0,afirst,asecond;
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
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 while(1){
ref = 80;
ADC_Init();
afirst = ADC_Read(0);
asecond = ADC_Read(3);

 if(afirst>ref && asecond>ref){
 count=count;
 IntToStr(count,x);
 Lcd_Out(2,2,x);
 Lcd_Out(1,2,"person present");
 }
 if(afirst<ref && asecond>ref){
 while(afirst<ref){
 afirst=ADC_Read(0);

 }
 while(asecond>ref){
 asecond=ADC_Read(3);

 }
 while(asecond<ref){
 asecond=ADC_Read(3);

 }
 count=count+1;
 IntToStr(count,x);
 Lcd_Out(2,2,x);
 delay_ms(100);
 }


 if(afirst>ref && asecond<ref){
 while(asecond<ref){
 asecond=ADC_Read(3);

 }
 while(afirst>ref){
 afirst=ADC_Read(0);

 }
 while(afirst<ref){
 afirst=ADC_Read(0);

 }
 count=count-1;
 IntToStr(count,x);
 Lcd_Out(2,2,x);
#line 74 "C:/Users/Shoummo/Documents/MICRO C/Counter for Real/counterReal.c"
 }



}
}
