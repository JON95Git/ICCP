#include "Interrupts.h"
#include "Initializer.h"
#include "Lcd_I2C_Lib.h"
#include "RS_485.h"
#include "RTC.h"

char Lcd_I2C_address = 0x78;
char x;

void main (){

   char kp;
   Init_MCU();         //Iniciaiza os registradores e funções do microcontrolador
   Lcd_I2C_Init();
   Lcd_I2C_Cmd(_LCD_CLEAR);
   Lcd_I2C_Cmd(_LCD_CURSOR_OFF);
   Lcd_I2C_Out(1,5, "I.C.C.P");
   delay_ms(1000);
   Lcd_I2C_Cmd(_LCD_CLEAR);

for(;;)
    {
    //kp = Key_pad();
    //key_RS485(kp);
    //Lcd_I2C_Chr(2,5,kp);
    //if (x >= 10)
      // {
        write_lcd(converte_timer(read_clock()));
      //  x = 0;
      // }
    }//Fim do loop
}//Fim da main