/*
 * Módulo INTERRUPTS
 * Contém as interrupções de TIMER0 (entradas)
 * USB, Serial, Timer 1 (Temporizador)
 */
 
#include "RTC.h"
#include  "Interrupts.h"
#define  SAIDA_1   RB2_bit
#define  SAIDA_2   RB3_bit
#define  SAIDA_3   RB4_bit
#define  SAIDA_4   RB5_bit
#define  SAIDA_5   RB6_bit
#define  SAIDA_6   RB7_bit
#define  SAIDA_7   RC1_bit
#define  SAIDA_8   RC2_bit
#define  ENTRADA_1   RA2_bit
#define  ENTRADA_2   RA3_bit
#define  ENTRADA_3   RA4_bit
#define  ENTRADA_4   RA5_bit
#define  ENTRADA_5   RE0_bit
#define  ENTRADA_6   RE1_bit

extern char x;

void interrupt () {

  bit flagB1, flagB2, flagB3, flagB4, flagB5, flagB6;
  unsigned char HidReadBuff[3]  absolute 0x500; //USB RAM..

USB_Interrupt_Proc();
if (HID_Read())
    {
     recebe_dados(HidReadBuff[0]);
    }

if (TMR0IF_bit == 1)          //Verifica se houve interrupção do TIMER 0, usada nas entradas
    {

    SAIDA_1 = (ENTRADA_1 == 1 && flagB1 == 0) ? ~ SAIDA_1 : SAIDA_1; flagB1 = 1;
    flagB1  = (ENTRADA_1 == 0 && flagB1 == 1) ? 0: flagB1;

    SAIDA_2 = (ENTRADA_2 == 1 && flagB2 == 0) ? ~ SAIDA_2 : SAIDA_2; flagB2 = 1;
    flagB2  = (ENTRADA_2 == 0 && flagB2 == 1) ? 0: flagB2;

    SAIDA_3 = (ENTRADA_3 == 1 && flagB3 == 0) ? ~ SAIDA_3 : SAIDA_3; flagB3 = 1;
    flagB3  = (ENTRADA_3 == 0 && flagB3 == 1) ? 0: flagB3;

    SAIDA_4 = (ENTRADA_4 == 1 && flagB4 == 0) ? ~ SAIDA_4 : SAIDA_4; flagB4 = 1;
    flagB4  = (ENTRADA_4 == 0 && flagB4 == 1) ? 0: flagB4;

    SAIDA_5 = (ENTRADA_5 == 1 && flagB5 == 0) ? ~ SAIDA_5 : SAIDA_5; flagB5 = 1;
    flagB5  = (ENTRADA_5 == 0 && flagB5 == 1) ? 0: flagB5;

    SAIDA_6= (ENTRADA_6 == 1 && flagB6 == 0) ? ~ SAIDA_6 : SAIDA_6; flagB6 = 1;
    flagB6  = (ENTRADA_6 == 0 && flagB6 == 1) ? 0: flagB6;

    TMR0IF_bit = 0;
    }


if (TMR1IF_bit == 1)          //Verifica se houve interrupção do TIMER 1
    {
    
    x++;
    TMR1IF_bit = 0;
    }


if (RCIF_bit == 1)                // Verifica se houve interrupção da serial
    {
       recebe_dados(UART_Read());
       RCIF_bit = 0;
    }
}

void recebe_dados(char read_buff) {

//Saida 1
    SAIDA_1 = (read_buff  ==  '1' ) ?  ~ SAIDA_1  :  SAIDA_1;
//Saida 2
    SAIDA_2 = (read_buff  ==  '2' ) ?  ~ SAIDA_2  :  SAIDA_2;
//Saida 3
    SAIDA_3 = (read_buff  ==  '3' ) ?  ~ SAIDA_3  :  SAIDA_3;
//Saida 4
    SAIDA_4 = (read_buff  ==  '4' ) ?  ~ SAIDA_4  :  SAIDA_4;
//Saida 5
    SAIDA_5 = (read_buff  ==  '5' ) ?  ~ SAIDA_5  :  SAIDA_5;
//Saida 6
    SAIDA_6 = (read_buff  ==  '6' ) ?  ~ SAIDA_6  :  SAIDA_6;
//Saida 7
    SAIDA_7 = (read_buff  ==  '7' ) ?  ~ SAIDA_7  :  SAIDA_7;
//Saida 8
    SAIDA_8 = (read_buff  ==  '8' ) ?  ~ SAIDA_8  :  SAIDA_8;
}