/*
 * Módulo RTC
 * Contém as rotinas estruturadas para comunicação entre
 * PIC e RTC DS1307.
 */
 
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