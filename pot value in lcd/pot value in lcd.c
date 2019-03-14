
unsigned int potval;

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
      Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
     while(1){
      Lcd_Out(1,1,"pot er value -_-");
      potval = ADC_Read(2);
      IntToStr(potval,x);
      Lcd_Out(2,2,x);
      }
     Lcd_Cmd(_LCD_CLEAR);
}