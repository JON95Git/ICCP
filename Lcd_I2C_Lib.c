/*
Biblioteca Lcd I2C com CI - PCF8574
Autor: Vitor Santos
MikroC 6.4v
OBS.: Habilitar Biblioteca I2C
*/

/*
void Lcd_I2C_Init()
void Lcd_I2C_Cmd(char out_char)
void Lcd_I2C_Chr(char row, char column, char out_char)
void Lcd_I2C_Chr_CP(char out_char)
void Lcd_I2C_Out(char row, char col, char *text)
void Lcd_I2C_Out_CP(char *text)
*/

extern char Lcd_I2C_address;

//char Lcd_I2C_address = 0x40; //A0 - 0, A1 - 0, A2 - 0

#define _LCD_FIRST_ROW          0x80     //Move cursor to the 1st row - ok
#define _LCD_SECOND_ROW         0xC0     //Move cursor to the 2nd row - ok
#define _LCD_THIRD_ROW          0x94     //Move cursor to the 3rd row - ok
#define _LCD_FOURTH_ROW         0xD4     //Move cursor to the 4th row - ok
#define _LCD_CLEAR              0x01     //Clear display - ok
#define _LCD_RETURN_HOME        0x02     //Return cursor to home position, returns a shifted display to
                                         //its original position. Display data RAM is unaffected. - ok
#define _LCD_CURSOR_OFF         0x0C     //Turn off cursor - ok
#define _LCD_UNDERLINE_ON       0x0E     //Underline cursor on - ok
#define _LCD_BLINK_CURSOR_ON    0x0F     //Blink cursor on - ok
#define _LCD_MOVE_CURSOR_LEFT   0x10     //Move cursor left without changing display data RAM - ok
#define _LCD_MOVE_CURSOR_RIGHT  0x14     //Move cursor right without changing display data RAM - ok
#define _LCD_TURN_ON            0x0C     //Turn Lcd display on - ok
#define _LCD_TURN_OFF           0x08     //Turn Lcd display off - ok
#define _LCD_SHIFT_LEFT         0x18     //Shift display left without changing display data RAM
#define _LCD_SHIFT_RIGHT        0x1E     //Shift display right without changing display data RAM



//Enviar um comando para Lcd_I2C-PCF8574
void Lcd_I2C_Cmd(char out_char)
{//Inicio do Lcd_I2C_Cmd

    char I2C_byte;

    I2C_byte = out_char & 0xF0;

    I2C1_Start();
    I2C1_Wr(LCD_I2C_address);

    I2C_byte.F3 = 1; // pino base j3y
    I2C_byte.F1 = 0;
    I2C_byte.F0 = 0;
    I2C_byte.F2 = 1;
    I2C1_Wr(I2C_byte);
    I2C_byte.F2 = 0;
    I2C1_Wr(I2C_byte);

    I2C_byte = (out_char << 4) & 0xF0;

    I2C_byte.F3 = 1; // pino base j3y
    I2C_byte.F1 = 0;
    I2C_byte.F0 = 0;
    I2C_byte.F2 = 1;
    I2C1_Wr(I2C_byte);
    I2C_byte.F2 = 0;
    I2C1_Wr(I2C_byte);
    I2C1_stop();

    Delay_ms(10);
}//Final LCD_I2C_Cmd

//Inicializa o Lcd_I2C-PCF8574
void Lcd_I2C_Init()
{//Inicio do Lcd_I2C_Init

    char I2C_byte;

    Delay_ms(100);

    I2C1_Start();
    I2C1_Wr(LCD_I2C_address);
    Delay_ms(10);

    I2C_byte = 0x30;

    I2C_byte.F3 = 1; // pino base j3y
    I2C_byte.F1 = 0;
    I2C_byte.F2 = 1;
    I2C1_Wr(I2C_byte);

    I2C_byte.F2 = 0;
    I2C1_Wr(I2C_byte);

    Delay_ms(10);

    I2C_byte.F3 = 1; // pino base j3y
    I2C_byte.F2 = 1;
    I2C1_Wr(I2C_byte);
    I2C_byte.F2 = 0;
    I2C1_Wr(I2C_byte);

    Delay_ms(10);

    I2C_byte.F3 = 1; // pino base j3y
    I2C_byte.F2 = 1;
    I2C1_Wr(I2C_byte);
    I2C_byte.F2 = 0;
    I2C1_Wr(I2C_byte);

    Delay_ms(10);

    I2C_byte = 0x20;

    I2C_byte.F3 = 1; // pino base j3y
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
}//Final do I2C_Lcd_Init

//Enviar um caracter para Lcd_I2C-PCF8574
void Lcd_I2C_Chr_CP(char out_char)
{//Inicio da Lcd_I2C_Chr_CP

    char byte;

    byte = out_char & 0xF0;

    I2C1_Start();
    I2C1_Wr(LCD_I2C_address);

    byte.F3 = 1; // pino base j3y
    byte.F1 = 0;
    byte.F0 = 1;  //rs   = 0
    byte.F2 = 1;  //e    = 2
    I2C1_Wr(byte);
    byte.F2 = 0;
    I2C1_Wr(byte);

    byte = (out_char << 4) & 0xF0;

    byte.F3 = 1; // pino base j3y
    byte.F1 = 0;
    byte.F0 = 1;
    byte.F2 = 1;
    I2C1_Wr(byte);
    byte.F2 = 0;
    I2C1_Wr(byte);

    I2C1_Stop();
    Delay_ms(10);
}//Final da Lcd_I2C_Chr_CP

//Enviar um texto para o Lcd_I2C-PCF8574
void Lcd_I2C_Out_CP(char *text)
{//Inicio do Lcd_I2C_Out_CP
    while(*text)
    {
     Lcd_I2C_Chr_CP(*text);
     text++;
    }
}//Final do Lcd_I2C_Out_CP

//Enviar um caracter para uma linha e uma coluna Lcd_I2C-PCF8574
void Lcd_I2C_Chr(char row, char column, char out_char)
{//Inicio do Lcd_I2C_Chr

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
}//Final do Lcd_I2C_Chr

//Enviar um texto para uma linha e uma coluna Lcd_I2C-PCF8574
void Lcd_I2C_Out(char row, char col, char *text)
{//Inicio do Lcd_I2C_Out
    while(*text)
    {
         Lcd_I2C_Chr(row, col, *text);
         col++;
         text++;
    }
}//Final do Lcd_I2C_Out