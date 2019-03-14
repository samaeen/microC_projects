
void main() {
// Initialize hardware UART1 and establish communication at 9600 bps
   UART1_Init(9600);

   while(1){
   UART1_Write_Text("shoummo rocks and u suck :D ");
   delay_ms(1000);
    UART1_Write(13);
   
   }

}