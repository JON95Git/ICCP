#line 1 "C:/Users/JONATHAN/Desktop/ICCP upgrade/Up3/Interrupts.c"
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
#line 1 "c:/users/jonathan/desktop/iccp upgrade/up3/interrupts.h"
#line 7 "c:/users/jonathan/desktop/iccp upgrade/up3/interrupts.h"
void interrupt ();
void recebe_dados(char read_buff);
#line 24 "C:/Users/JONATHAN/Desktop/ICCP upgrade/Up3/Interrupts.c"
extern char x;

void interrupt () {

 bit flagB1, flagB2, flagB3, flagB4, flagB5, flagB6;
 unsigned char HidReadBuff[3] absolute 0x500;

USB_Interrupt_Proc();
if (HID_Read())
 {
 recebe_dados(HidReadBuff[0]);
 }

if (TMR0IF_bit == 1)
 {

  RB2_bit  = ( RA2_bit  == 1 && flagB1 == 0) ? ~  RB2_bit  :  RB2_bit ; flagB1 = 1;
 flagB1 = ( RA2_bit  == 0 && flagB1 == 1) ? 0: flagB1;

  RB3_bit  = ( RA3_bit  == 1 && flagB2 == 0) ? ~  RB3_bit  :  RB3_bit ; flagB2 = 1;
 flagB2 = ( RA3_bit  == 0 && flagB2 == 1) ? 0: flagB2;

  RB4_bit  = ( RA4_bit  == 1 && flagB3 == 0) ? ~  RB4_bit  :  RB4_bit ; flagB3 = 1;
 flagB3 = ( RA4_bit  == 0 && flagB3 == 1) ? 0: flagB3;

  RB5_bit  = ( RA5_bit  == 1 && flagB4 == 0) ? ~  RB5_bit  :  RB5_bit ; flagB4 = 1;
 flagB4 = ( RA5_bit  == 0 && flagB4 == 1) ? 0: flagB4;

  RB6_bit  = ( RE0_bit  == 1 && flagB5 == 0) ? ~  RB6_bit  :  RB6_bit ; flagB5 = 1;
 flagB5 = ( RE0_bit  == 0 && flagB5 == 1) ? 0: flagB5;

  RB7_bit = ( RE1_bit  == 1 && flagB6 == 0) ? ~  RB7_bit  :  RB7_bit ; flagB6 = 1;
 flagB6 = ( RE1_bit  == 0 && flagB6 == 1) ? 0: flagB6;

 TMR0IF_bit = 0;
 }


if (TMR1IF_bit == 1)
 {

 x++;
 TMR1IF_bit = 0;
 }


if (RCIF_bit == 1)
 {
 recebe_dados(UART_Read());
 RCIF_bit = 0;
 }
}

void recebe_dados(char read_buff) {


  RB2_bit  = (read_buff == '1' ) ? ~  RB2_bit  :  RB2_bit ;

  RB3_bit  = (read_buff == '2' ) ? ~  RB3_bit  :  RB3_bit ;

  RB4_bit  = (read_buff == '3' ) ? ~  RB4_bit  :  RB4_bit ;

  RB5_bit  = (read_buff == '4' ) ? ~  RB5_bit  :  RB5_bit ;

  RB6_bit  = (read_buff == '5' ) ? ~  RB6_bit  :  RB6_bit ;

  RB7_bit  = (read_buff == '6' ) ? ~  RB7_bit  :  RB7_bit ;

  RC1_bit  = (read_buff == '7' ) ? ~  RC1_bit  :  RC1_bit ;

  RC2_bit  = (read_buff == '8' ) ? ~  RC2_bit  :  RC2_bit ;
}
