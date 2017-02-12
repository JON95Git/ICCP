#line 1 "C:/Users/JONATHAN/Desktop/ICCP upgrade/Up3/ICCP 3.c"
#line 1 "c:/users/jonathan/desktop/iccp upgrade/up3/interrupts.h"
#line 7 "c:/users/jonathan/desktop/iccp upgrade/up3/interrupts.h"
void interrupt ();
void recebe_dados(char read_buff);
#line 1 "c:/users/jonathan/desktop/iccp upgrade/up3/initializer.h"
#line 5 "c:/users/jonathan/desktop/iccp upgrade/up3/initializer.h"
void Init_MCU();
char Key_pad();
#line 1 "c:/users/jonathan/desktop/iccp upgrade/up3/lcd_i2c_lib.h"
#line 41 "c:/users/jonathan/desktop/iccp upgrade/up3/lcd_i2c_lib.h"
void Lcd_I2C_Cmd(char out_char);



void Lcd_I2C_Init();



void Lcd_I2C_Chr_CP(char out_char);



void Lcd_I2C_Out_CP(char *text);


void Lcd_I2C_Chr(char row, char column, char out_char);


void Lcd_I2C_Out(char row, char col, char *text);
#line 1 "c:/users/jonathan/desktop/iccp upgrade/up3/rs_485.h"
#line 7 "c:/users/jonathan/desktop/iccp upgrade/up3/rs_485.h"
typedef struct RS485_data
{
 char msg;
 char length_msg;
 char address;
};

void envia_slave(struct RS485_data);

void key_RS485(char key);
#line 1 "c:/users/jonathan/desktop/iccp upgrade/up3/rtc.h"
#line 7 "c:/users/jonathan/desktop/iccp upgrade/up3/rtc.h"
typedef struct real_time_clock {
 char seconds, seconds1;
 char minutes, minutes1;
 char hours, hours1;
 char weekday, weekday1;
 char days, days1;
 char month, month1;
 char years, years1;
};

void write_date_lcd(struct real_time_clock read_date);
void write_lcd (struct real_time_clock read_dates);
struct real_time_clock read_clock ();
struct real_time_clock converte_timer (struct real_time_clock dados_convert);
#line 7 "C:/Users/JONATHAN/Desktop/ICCP upgrade/Up3/ICCP 3.c"
char Lcd_I2C_address = 0x78;
char x;

void main (){

 char kp;
 Init_MCU();
 Lcd_I2C_Init();
 Lcd_I2C_Cmd( 0x01 );
 Lcd_I2C_Cmd( 0x0C );
 Lcd_I2C_Out(1,5, "I.C.C.P");
 delay_ms(1000);
 Lcd_I2C_Cmd( 0x01 );

for(;;)
 {





 write_lcd(converte_timer(read_clock()));


 }
}
