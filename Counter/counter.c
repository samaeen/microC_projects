int ref,count=0,afirst,asecond;
char x[20];
// Lcd pinout settings
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D7 at RB0_bit;
sbit LCD_D6 at RB1_bit;
sbit LCD_D5 at RB2_bit;
sbit LCD_D4 at RB3_bit;

// Pin direction
sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D7_Direction at TRISB0_bit;
sbit LCD_D6_Direction at TRISB1_bit;
sbit LCD_D5_Direction at TRISB2_bit;
sbit LCD_D4_Direction at TRISB3_bit;

void main() {
     Lcd_Init();
     Lcd_Cmd(_LCD_CLEAR);               // Clear display
     Lcd_Cmd(_LCD_CURSOR_OFF);
     while(1){
ref = 500;
ADC_Init();
afirst = ADC_Read(0);
asecond = ADC_Read(1);
//Lcd_Out(1,1,"count");
        if(afirst<ref && asecond<ref){
        count=count;
        IntToStr(count,x);
        Lcd_Out(2,2,x);
        Lcd_Out(1,2,"1");
        }
        if(afirst>ref && asecond<ref){
        while(afirst>ref){
        afirst=ADC_Read(0);
        Lcd_Out(1,2,"2");
        }
        while(asecond<ref){
        asecond=ADC_Read(1);
        Lcd_Out(1,2,"3");
        }
        while(asecond>ref){
        asecond=ADC_Read(1);
        Lcd_Out(1,2,"4");
        }
        count=count+1;
        IntToStr(count,x);
        Lcd_Out(2,2,x);
        delay_ms(100);
        }
        //IntToStr(count,x);

        if(afirst<ref && asecond>ref){
        while(asecond>ref){
        asecond=ADC_Read(1);
        Lcd_Out(1,2,"5");
        }
        while(afirst<ref){
        afirst=ADC_Read(0);
        Lcd_Out(1,2,"6");
        }
        while(afirst>ref){
        afirst=ADC_Read(0);
        Lcd_Out(1,2,"7");
        }
        count=count-1;
        IntToStr(count,x);
         Lcd_Out(2,2,x);
/*while(asecond>ref){
        Lcd_Out(1,6,"hoise");
        }*/
        }
        //IntToStr(count,x);
        //Lcd_Out(2,2,x);

}
}