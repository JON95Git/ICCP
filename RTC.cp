#line 1 "C:/Users/JONATHAN/Desktop/ICCP upgrade/Up3/RTC.c"
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
#line 1 "c:/users/jonathan/desktop/iccp upgrade/up3/lcd_i2c_lib.h"
#line 41 "c:/users/jonathan/desktop/iccp upgrade/up3/lcd_i2c_lib.h"
void Lcd_I2C_Cmd(char out_char);



void Lcd_I2C_Init();



void Lcd_I2C_Chr_CP(char out_char);



void Lcd_I2C_Out_CP(char *text);


void Lcd_I2C_Chr(char row, char column, char out_char);


void Lcd_I2C_Out(char row, char col, char *text);
#line 9 "C:/Users/JONATHAN/Desktop/ICCP upgrade/Up3/RTC.c"
struct real_time_clock read_clock (){

 struct real_time_clock read_date;

 I2C1_Start();
 I2C1_Wr(0xD0);
 I2C1_Wr(0);
 I2C1_Repeated_Start();
 I2C1_Wr(0xD1);
 read_date.seconds = I2C1_Rd(1);
 read_date.minutes = I2C1_Rd(1);
 read_date.hours = I2C1_Rd(1);
 read_date.weekday = I2C1_Rd(1);
 read_date.days = I2C1_Rd(1);
 read_date.month = I2C1_Rd(1);
 read_date.years = I2C1_Rd(0);
 I2C1_Stop();

 return read_date;
}

void write_date_lcd(struct real_time_clock read_date){


 LCD_I2C_Chr(1,6,((read_date.hours & 0xf0) >> 4) + 0x30);
 LCD_I2C_Chr_cp ((read_date.hours & 0x0f) + 0x30);
 LCD_I2C_Chr_cp (':');
 LCD_I2C_Chr_cp (((read_date.minutes & 0xf0) >> 4) + 0x30);
 LCD_I2C_Chr_cp ((read_date.minutes & 0x0f) + 0x30);
 LCD_I2C_Chr(2,5,((read_date.days & 0xf0) >> 4) + 0x30);
 LCD_I2C_Chr_cp ((read_date.days & 0x0f) + 0x30);
 LCD_I2C_Chr_cp ('/');
 LCD_I2C_Chr_cp (((read_date.month & 0xf0) >> 4) + 0x30);
 LCD_I2C_Chr_cp ((read_date.month & 0x0f) + 0x30);
 LCD_I2C_Chr_cp ('/');
 LCD_I2C_Chr_cp (((read_date. years & 0xf0) >> 4) + 0x30);
 LCD_I2C_Chr_cp ((read_date. years & 0x0f) + 0x30);

}

struct real_time_clock converte_timer (struct real_time_clock dados_convert){

 struct real_time_clock dados_convertidos;

 dados_convertidos.hours = ((dados_convert.hours & 0xf0) >> 4) + 0x30;
 dados_convertidos.hours1 = ((dados_convert.hours & 0x0f) + 0x30);
 dados_convertidos.minutes = (((dados_convert.minutes & 0xf0) >> 4) + 0x30);
 dados_convertidos.minutes1 = ((dados_convert.minutes & 0x0f) + 0x30);
 dados_convertidos.days = ((dados_convert.days & 0xf0) >> 4) + 0x30;
 dados_convertidos.days1 = ((dados_convert.days & 0x0f) + 0x30);
 dados_convertidos.month = (((dados_convert.month & 0xf0) >> 4) + 0x30);
 dados_convertidos.month1 = ((dados_convert.month & 0x0f) + 0x30);
 dados_convertidos.years = (((dados_convert.years & 0xf0) >> 4) + 0x30);
 dados_convertidos.years1 = ((dados_convert.years & 0x0f) + 0x30);


 return dados_convertidos;
}


void write_lcd (struct real_time_clock read_dates){

 LCD_I2C_Chr(1,6, read_dates.hours);
 LCD_I2C_Chr_cp (read_dates.hours1);
 LCD_I2C_Chr_cp (':');
 LCD_I2C_Chr_cp (read_dates.minutes);
 LCD_I2C_Chr_cp (read_dates.minutes1);
 LCD_I2C_Chr(2,5, read_dates.days);
 LCD_I2C_Chr_cp (read_dates.days1);
 LCD_I2C_Chr_cp ('/');
 LCD_I2C_Chr_cp (read_dates.month);
 LCD_I2C_Chr_cp (read_dates.month1);
 LCD_I2C_Chr_cp ('/');
 LCD_I2C_Chr_cp (read_dates. years);
 LCD_I2C_Chr_cp (read_dates. years1);


}
