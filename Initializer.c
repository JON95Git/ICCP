/*
 * Módulo INITIALIZER
 * Contém as configurações de Inicialização gerais do PIC
 * como periféricos, bibliotecas registradores e pinos
 */
 
#include "Initializer.h"

sbit  rs485_rxtx_pin  at RC0_bit;
sbit  rs485_rxtx_pin_direction at TRISC0_bit;
char keypadPort at PORTD;


void Init_MCU(){

 unsigned char HidReadBuff[3]  absolute 0x500; //USB RAM..
 unsigned char HidWriteBuff[3] absolute 0x540; //USB RAM..

//Setup dos pinos e registradores
{
  ADCON1       =  0x0D;              // Conversor AD, habilita AN0 e AN1 como analogicas
  TRISA        =  0b111111;          // Seta RA0 e RA1 como entradas analógicas
  TRISA3_bit   =  1;
  CMCON        =  0x07;              // To turn off comparators
  TRISB        =  0x00;              //Todo portB como saída
  PORTB        =  0xff;              // Todo o PORTB em nivel logico alto (módulo rele aciona em 0)
  TRISC2_bit   =  0;
  RC2_bit      =  1;
  RC1_bit      =  1;
  TRISC1_bit   =  0;
  }
// Setup das interrupções
{
  RCIF_bit    =  0x00;              // Flag testada na função interrupt, quando em 0 buffer vazio
  GIE_bit     =  0x01;              //Global Interrupt Enable bit, habilita a interrupção global
  PEIE_bit    =  0x01;              //Peripheral Interrupt Enable bit, habilita a interrupção por perifericos
  RCIE_bit    =  0x01;              //Habilita a interrupção por recepção da UART
  RCIP_bit    =  0x00;              //Habilita baixa prioridade da porta serial
  IPEN_bit    =  0x01;              //Habilita a prioridade de interrupção
  TXIE_bit    =  0x00;              //Desabilita a interrupção por transmissão

  //T1CON       =  0x31;

  //------------BITS DO T1CON-------------
  TMR1ON_bit  =  0x01;              //Habilita o TIMER 1
  TMR1IE_bit  =  0x01;              //Habilita interrupção do TIMER 1
  TMR1IF_bit  =  0x00;              //Flag testada na interrupção do TIMER 1
  TMR1IP_bit  =  0x01;              //Habilita alta prioridade do TIMER 1

  TMR1CS_bit    =  0x00;              //Seleciona clock interno
  T1CKPS1_bit   =  1;                 // Configura prescaler 1:2...
  T1CKPS0_bit   =  1;                 //...interrupção a cada 102,4us
  T1RUN_bit     =  0;
  T1OSCEN_bit   =  1;
  RD16_bit      =  1;
  T1SYNC_bit    =  1;
  T1OSCEN_bit   =  0;

  //T0CON       =  0x87;
  TMR0IE_bit  =  0x01;              //Habilita interrupção do TIMER 0
  TMR0IF_bit  =  0x00;              //Flag testada na interrupção do TIMER 0
  TMR0IP_bit  =  0x01;              //Habilita alta prioridade do TIMER 0
  TMR0L       =  0;

  TMR0ON_bit  =  0x01;              //Habilita o TIMER 0
  T08BIT_bit  =  0x01;              //Habiita timer 0 EM 16 BITS
  T0CS_bit    =  0x00;              //Seleciona clock interno
  T0SE_bit    =  0;
  PSA_bit     =  0x00;              //Habilita o Prescaler (pre contagem)
  T0PS2_bit   =  1;                 // Configura prescaler 1:2...
  T0PS1_bit   =  1;                 //...interrupção a cada 102,4us
  T0PS0_bit   =  1;
  
  //USBIE_bit   =  0x01;
  //USBIF_bit   =  0x00;
  //USBIP_bit   =  0x01;
  }
//Inicialização dos módulos e periféricos
{

  ADC_Init();

  Keypad_Init();

  UART1_Init(9600);
  RS485Master_Init();

  HID_Enable(&HidReadBuff, &HidWriteBuff);

  I2C1_Init(100000);

  }

 }
 
char Key_pad(){
    char kp = Keypad_Key_Press();
    switch (kp)
       {
        case  1: kp = 49; break; // 1        // Uncomment this block for keypad4x4
        case  2: kp = 50; break; // 2
        case  3: kp = 51; break; // 3
        case  4: kp = 65; break; // A
        case  5: kp = 52; break; // 4
        case  6: kp = 53; break; // 5
        case  7: kp = 54; break; // 6
        case  8: kp = 66; break; // B
        case  9: kp = 55; break; // 7
        case 10: kp = 56; break; // 8
        case 11: kp = 57; break; // 9
        case 12: kp = 67; break; // C
        case 13: kp = 42; break; // *
        case 14: kp = 48; break; // 0
        case 15: kp = 35; break; // #
        case 16: kp = 68; break; // D
        }//Fim do Switch do keypad
   return kp;
}//Fim da Função Teclado