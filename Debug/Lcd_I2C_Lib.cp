#line 1 "C:/Users/JONATHAN/Desktop/ICCP upgrade/Up3/Lcd_I2C_Lib.c"
#line 17 "C:/Users/JONATHAN/Desktop/ICCP upgrade/Up3/Lcd_I2C_Lib.c"
extern char Lcd_I2C_address;
#line 41 "C:/Users/JONATHAN/Desktop/ICCP upgrade/Up3/Lcd_I2C_Lib.c"
void Lcd_I2C_Cmd(char out_char)
{

 char I2C_byte;

 I2C_byte = out_char & 0xF0;

 I2C1_Start();
 I2C1_Wr(LCD_I2C_address);

 I2C_byte.F3 = 1;
 I2C_byte.F1 = 0;
 I2C_byte.F0 = 0;
 I2C_byte.F2 = 1;
 I2C1_Wr(I2C_byte);
 I2C_byte.F2 = 0;
 I2C1_Wr(I2C_byte);

 I2C_byte = (out_char << 4) & 0xF0;

 I2C_byte.F3 = 1;
 I2C_byte.F1 = 0;
 I2C_byte.F0 = 0;
 I2C_byte.F2 = 1;
 I2C1_Wr(I2C_byte);
 I2C_byte.F2 = 0;
 I2C1_Wr(I2C_byte);
 I2C1_stop();

 Delay_ms(10);
}


void Lcd_I2C_Init()
{

 char I2C_byte;

 Delay_ms(100);

 I2C1_Start();
 I2C1_Wr(LCD_I2C_address);
 Delay_ms(10);

 I2C_byte = 0x30;

 I2C_byte.F3 = 1;
 I2C_byte.F1 = 0;
 I2C_byte.F2 = 1;
 I2C1_Wr(I2C_byte);

 I2C_byte.F2 = 0;
 I2C1_Wr(I2C_byte);

 Delay_ms(10);

 I2C_byte.F3 = 1;
 I2C_byte.F2 = 1;
 I2C1_Wr(I2C_byte);
 I2C_byte.F2 = 0;
 I2C1_Wr(I2C_byte);

 Delay_ms(10);

 I2C_byte.F3 = 1;
 I2C_byte.F2 = 1;
 I2C1_Wr(I2C_byte);
 I2C_byte.F2 = 0;
 I2C1_Wr(I2C_byte);

 Delay_ms(10);

 I2C_byte = 0x20;

 I2C_byte.F3 = 1;
 I2C_byte.F1 = 0;
 I2C_byte.F2 = 1;
 I2C1_Wr(I2C_byte);
 I2C_byte.F2 = 0;
 I2C1_Wr(I2C_byte);

 Delay_ms(10);

 LCD_I2C_Cmd(0x28);
 Delay_ms(10);
 LCD_I2C_Cmd(0x0F);
 Delay_ms(10);
 LCD_I2C_Cmd(0x06);
 Delay_ms(10);
 LCD_I2C_Cmd(0x01);
 Delay_ms(10);
}


void Lcd_I2C_Chr_CP(char out_char)
{

 char byte;

 byte = out_char & 0xF0;

 I2C1_Start();
 I2C1_Wr(LCD_I2C_address);

 byte.F3 = 1;
 byte.F1 = 0;
 byte.F0 = 1;
 byte.F2 = 1;
 I2C1_Wr(byte);
 byte.F2 = 0;
 I2C1_Wr(byte);

 byte = (out_char << 4) & 0xF0;

 byte.F3 = 1;
 byte.F1 = 0;
 byte.F0 = 1;
 byte.F2 = 1;
 I2C1_Wr(byte);
 byte.F2 = 0;
 I2C1_Wr(byte);

 I2C1_Stop();
 Delay_ms(10);
}


void Lcd_I2C_Out_CP(char *text)
{
 while(*text)
 {
 Lcd_I2C_Chr_CP(*text);
 text++;
 }
}


void Lcd_I2C_Chr(char row, char column, char out_char)
{

 char byte;

 switch(row)
 {
 case 1:
 Lcd_I2C_Cmd(0x80 + (column - 1));
 break;
 case 2:
 Lcd_I2C_Cmd(0xC0 + (column - 1));
 break;
 case 3:
 Lcd_I2C_Cmd(0x94 + (column - 1));
 break;
 case 4:
 Lcd_I2C_Cmd(0xD4 + (column - 1));
 break;
 };

 Lcd_I2C_Chr_CP(out_char);
}


void Lcd_I2C_Out(char row, char col, char *text)
{
 while(*text)
 {
 Lcd_I2C_Chr(row, col, *text);
 col++;
 text++;
 }
}
